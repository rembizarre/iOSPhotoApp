//
//  SectionHeader.swift
//  iOSPhotoApp
//
//  Created by Rustem on 17.03.2024.
//

import UIKit

 class SectionHeader: UICollectionReusableView {
    static let identifier = "SectionHeader"

     // MARK: - UI
    lazy var title: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 22, weight: .bold))
        return label
    }()

     lazy var separator: UIView = {
        let separator = UIView()
         separator.backgroundColor = .quaternaryLabel
        return separator
    }()

     lazy var headerButton: UIButton = {
         let button = UIButton()
         button.setTitle("Все", for: .normal)
         button.setTitleColor(UIColor.systemBlue, for: .normal)
         button.isHidden = true
         return button
     }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: SetupHierarchy
    private func setupHierarchy () {
        self.addSubview(separator)
        self.addSubview(title)
        self.addSubview(headerButton)

    }
    //MARK: SetupHierarchy
    private func setupLayout() {
        separator.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.leading.equalToSuperview().offset(-15)
            make.trailing.equalToSuperview().offset(25)
            make.top.equalToSuperview()
        }
        title.snp.makeConstraints { make in
            make.top.equalTo(separator.snp.bottom).offset(10)
            make.leading.equalTo(separator.snp.leading)
            make.bottom.equalToSuperview()
        }
        headerButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-15)
            make.width.height.equalTo(40)
            make.top.equalTo(separator.snp.bottom).offset(5)
        }
    }
}
import SwiftUI
#Preview {
    TabBarViewController(nibName: "", bundle: .main)
}
