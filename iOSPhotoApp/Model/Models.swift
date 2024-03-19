//
//  Models.swift
//  iOSPhotoApp
//
//  Created by Rustem on 15.03.2024.
//

import UIKit

struct SectionItem {
    let title: String
    let subTitle: String
    let image: UIImage
}

enum subtitleType {
    case text(String)
    case iconImage(UIImage)
}

struct MediaFileTypeItem {
    let tittle: String
    let image: UIImage
    let type: subtitleType
    let accessoryImage: UIImage
}

enum Orientation {
    case horizontal, vertical
}
