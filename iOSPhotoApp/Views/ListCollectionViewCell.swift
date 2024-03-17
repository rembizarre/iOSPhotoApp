//
//  ListCollectionViewCell.swift
//  iOSPhotoApp
//
//  Created by Rustem on 17.03.2024.
//

import UIKit
import SnapKit

class ListCollectionViewCell: UICollectionViewCell {
    static var identifier = "ListCollectionViewCell"
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .clear
        return image
    }()
    
    private lazy var title: UILabel = {
        let tittle = UILabel()
        tittle.font = UIFont.preferredFont(forTextStyle: .title2)
        tittle.textColor = .systemBlue
        return tittle
    }()
    private lazy var subTittle: UILabel = {
        let tittle = UILabel()
        tittle.font = UIFont.preferredFont(forTextStyle: .title3)
        tittle.textColor = .secondaryLabel
        return tittle
    }()
    private lazy var separator: UIView = {
        let line = UIView()
        line.backgroundColor = .quaternaryLabel
        return line
    }()
    private lazy var accessoryItem: UIImageView = {
        let accessory = UIImageView()
        accessory.tintColor = UIColor.lightGray.withAlphaComponent(0.5)
        return accessory
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
        selectedBackgroundView = UIView()
        selectedBackgroundView?.backgroundColor = UIColor.secondaryLabel
    }
    
    required init?(coder: NSCoder) {
        fatalError("No storybaord, please")
    }
    
    public func configure(with item: MediaFileTypeItem) {
        imageView.image = item.image
        title.text = item.tittle
        subTittle.text = item.subtittle
        accessoryItem.image = item.accessoryImage
    }
    
    // MARK: - setupHierarchy
    private func setupHierarchy() {
        contentView.addSubview(imageView)
        contentView.addSubview(title)
        contentView.addSubview(subTittle)
        contentView.addSubview(separator)
        contentView.addSubview(accessoryItem)
    }
    
    
    // MARK: - Setup Layout
    private func setupLayout() {
        imageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(30)
        }
        
        title.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.trailing).offset(10)
            make.top.equalToSuperview().offset(10)
            make.trailing.lessThanOrEqualTo(accessoryItem.snp.leading).offset(-1)
            make.bottom.equalTo(imageView.snp.bottom)
        }
        
        accessoryItem.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-15)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(20)
        }
        
        subTittle.snp.makeConstraints { make in
            make.trailing.equalTo(accessoryItem.snp.leading).offset(-5)
            make.centerY.equalToSuperview()
        }
        
        separator.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.leading.equalTo(title.snp.leading)
            make.top.equalTo(title.snp.bottom).offset(10)
            make.height.equalTo(0.5)
        }
    }
}
import SwiftUI
#Preview {
    TabBarViewController(nibName: "", bundle: .main)
}
