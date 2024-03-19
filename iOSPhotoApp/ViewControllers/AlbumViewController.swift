//
//  AlbumViewController.swift
//  iOSPhotoApp
//
//  Created by Rustem on 15.03.2024.
//

import UIKit

final class AlbumViewController: UIViewController {

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureNavigationBar()
        setupHierarchy()
        setupLayout()
        loadItems()
    }
    private func configureNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor.systemBackground
        appearance.shadowColor = .clear
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isHidden = false
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: nil, action: nil)
        title = "Альбомы"
    }


    // MARK: - UI
    var albums: [SectionItem] = []
    var peopleAndPlaces: [SectionItem] = []
    var mediaTypes: [MediaFileTypeItem] = []
    var utilities: [MediaFileTypeItem] = []
    lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.identifier)
        collectionView.register(SectionCollectionViewCell.self, forCellWithReuseIdentifier: SectionCollectionViewCell.identifier)
        collectionView.register(ListCollectionViewCell.self, forCellWithReuseIdentifier: ListCollectionViewCell.identifier)
        return collectionView
    }()

    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, _ in
            let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(0.9), heightDimension: .estimated(80)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
            switch sectionIndex {
                case 0:
                    let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                    item.contentInsets = .init(top: 0, leading: 2, bottom: 10, trailing: 5)

                    let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(0.9 / 2), heightDimension: .fractionalWidth(1.2)), subitem: item, count: 2)
                    group.interItemSpacing = .fixed(15)
                    let section = NSCollectionLayoutSection(group: group)
                    section.orthogonalScrollingBehavior = .paging
                    section.interGroupSpacing = 5
                    section.contentInsets = .init(top: 5, leading: 15, bottom: 30, trailing: 0)
                    section.boundarySupplementaryItems = [layoutSectionHeader]

                    return section

                case 1:
                    let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1 / 2), heightDimension: .fractionalHeight(1 / 2)))
                    item.contentInsets = .init(top: 10, leading: 2, bottom: 10, trailing: 10)

                    let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(460)), subitems: [item])

                    let section = NSCollectionLayoutSection(group: group)
                    section.orthogonalScrollingBehavior = .none
                    section.interGroupSpacing = 5
                    section.contentInsets = .init(top: 0, leading: 15, bottom: 25, trailing: 10)
                    section.boundarySupplementaryItems = [layoutSectionHeader]

                    return section

                case 2:
                    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                    let item = NSCollectionLayoutItem(layoutSize: itemSize)

                    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(44))
                    let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
                    group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

                    let section = NSCollectionLayoutSection(group: group)
                    section.contentInsets = .init(top: 0, leading: 15, bottom: 25, trailing: 0)
                    section.boundarySupplementaryItems = [layoutSectionHeader]
                    return section

                case 3:
                    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                    let item = NSCollectionLayoutItem(layoutSize: itemSize)

                    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(44))
                    let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
                    group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

                    let section = NSCollectionLayoutSection(group: group)
                    section.contentInsets = .init(top: 0, leading: 15, bottom: 0, trailing: 0)
                    section.boundarySupplementaryItems = [layoutSectionHeader]
                    return section
                default:
                    fatalError()
            }
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }

    private func loadItems() {
        albums = MockData.shared.albums
        peopleAndPlaces = MockData.shared.peopleAndPlaces
        mediaTypes = MockData.shared.mediaTypes
        utilities = MockData.shared.utilities
        collectionView.reloadData()
    }

    // MARK: - setupHierarchy
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
