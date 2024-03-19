//
//  ForYouCollectionViewCell.swift
//  iOSPhotoApp
//
//  Created by Rustem on 19.03.2024.
//

import UIKit
import SnapKit

class ForYouCollectionViewCell: UICollectionViewCell {
   static let identifier = "ForYouCollectionViewCell"

    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(with image: UIImage?) {
        imageView.image = image
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
    }
    //MARK: SetupHierarchy
    private func setupHierarchy () {
        contentView.addSubview(imageView)
    }
    //MARK: SetupHierarchy
    private func setupLayout() {
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
