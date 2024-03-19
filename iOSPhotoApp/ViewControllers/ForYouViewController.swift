//
//  ForYouViewController.swift
//  iOSPhotoApp
//
//  Created by Rustem on 15.03.2024.
//

import UIKit
import SnapKit

final class ForYouViewController: UIViewController {

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        collectionView.setCollectionViewLayout(createLayout(for: .horizontal), animated: false)
        configureNavigationBar()
        setupHierarchy()
        setupLayout()
    }

    private func configureNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor.systemBackground
        appearance.shadowColor = .clear
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Для Вас"
    }

    private func createLayout(for orientation: Orientation) -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(0.9), heightDimension: .estimated(80)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)

            let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
            item.contentInsets = .init(top: 0, leading: 2, bottom: 10, trailing: 5)

            let group: NSCollectionLayoutGroup
            switch orientation {
                case .horizontal:
                    group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.91), heightDimension: .fractionalWidth(1)), subitems: [item])
                case .vertical:
                    group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(0.97), heightDimension: .fractionalWidth(1)), subitems: [item])
            }
            group.interItemSpacing = .fixed(15)

            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = (orientation == .horizontal) ? .groupPaging : .none
            section.interGroupSpacing = 5
            section.contentInsets = .init(top: 5, leading: 15, bottom: 30, trailing: 0)
            section.boundarySupplementaryItems = [layoutSectionHeader]
            return section
        }
    }

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.identifier)
        collectionView.register(ForYouCollectionViewCell.self, forCellWithReuseIdentifier: ForYouCollectionViewCell.identifier)
        return collectionView
    }()

    func swithLayout(to orientation: Orientation) {
        collectionView.setCollectionViewLayout(createLayout(for: orientation), animated: true)
    }

    private func setupHierarchy () {
        view.addSubview(collectionView)
    }

    private func setupLayout() {
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.left.right.equalToSuperview()

        }
    }
}





