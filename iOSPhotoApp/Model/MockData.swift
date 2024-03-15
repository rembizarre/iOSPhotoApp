//
//  MockData.swift
//  iOSPhotoApp
//
//  Created by Rustem on 15.03.2024.
//

import UIKit

struct MockData {
    static let shared = MockData()

let albums: [SectionItem] = [
    SectionItem(title: "Недавние", subTitle: "235", image: UIImage(named: "astana")!),
    SectionItem(title: "Wallpapers", subTitle: "5", image: UIImage(named: "wp2")!),
    SectionItem(title: "Paris", subTitle: "23", image: UIImage(named: "paris")!),
    SectionItem(title: "Instagram", subTitle: "54", image: UIImage(named: "insta")!),
    SectionItem(title: "Места", subTitle: "21", image: UIImage(named: "place")!),
    SectionItem(title: "Сингапур", subTitle: "76", image: UIImage(named: "sg")!),
    SectionItem(title: "Whats App", subTitle: "46", image: UIImage(named: "wa")!),
    SectionItem(title: "Еда", subTitle: "4", image: UIImage(named: "restik4")!)
]

    let peopleAndPlaces: [SectionItem] = [
        SectionItem(title: "Люди", subTitle: "5", image: UIImage(named: "people")!),
        SectionItem(title: "Места", subTitle: "90", image: UIImage(named: "places")!)
    ]

}
