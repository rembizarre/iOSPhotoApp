//
//  SectionCollectionViewCell.swift
//  iOSPhotoApp
//
//  Created by Rustem on 15.03.2024.
//

import UIKit
import SnapKit

class SectionCollectionViewCell: UICollectionViewCell {
    static let identifier = "SectionCollectionViewCell"

    // MARK: - UI
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 5
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    private lazy var tittle: UILabel = {
        let tittle = UILabel()
        tittle.font = UIFont.preferredFont(forTextStyle: .title3)
        tittle.textColor = .label
        return tittle
    }()

    private lazy var subTittle: UILabel = {
        let tittle = UILabel()
        tittle.font = UIFont.preferredFont(forTextStyle: .title2)
        tittle.textColor = .secondaryLabel
        return tittle
    }()
    private lazy var stackView: UIStackView = {
        let stack  = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fill
        stack.spacing = 1
        return stack
    }()


    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("No storyboard")
    }

    public func configure(with item: SectionItem) {
        imageView.image = item.image
        tittle.text = item.title
        subTittle.text = item.subTitle
    }

    // MARK: - Setup
    private func setupHierarchy () {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(tittle)
        stackView.addArrangedSubview(subTittle)
    }
    private func setupLayout() {
        stackView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalTo(contentView)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
}
