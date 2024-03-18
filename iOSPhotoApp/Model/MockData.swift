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
    
    let mediaTypes: [MediaFileTypeItem] = [
        MediaFileTypeItem(tittle: "Видео", image: UIImage(systemName: "video")!, type: subtitleType.text("5"), accessoryImage: UIImage(systemName: "chevron.compact.right")!),
        MediaFileTypeItem(tittle: "Селфи", image: UIImage(systemName: "person.crop.square")!, type: subtitleType.text("15"), accessoryImage: UIImage(systemName: "chevron.compact.right")!),
        MediaFileTypeItem(tittle: "Фото Live Photo", image: UIImage(systemName: "livephoto")!, type: subtitleType.text("10"), accessoryImage: UIImage(systemName: "chevron.compact.right")!),
        MediaFileTypeItem(tittle: "Портреты", image: UIImage(systemName: "f.cursive.circle")!, type: subtitleType.text("3"),  accessoryImage: UIImage(systemName: "chevron.compact.right")!),
        MediaFileTypeItem(tittle: "Панорамы", image: UIImage(systemName: "pano")!, type: subtitleType.text("7"), accessoryImage: UIImage(systemName: "chevron.compact.right")!),
        MediaFileTypeItem(tittle: "Таймлапс", image: UIImage(systemName: "timelapse")!, type: subtitleType.text("2"), accessoryImage: UIImage(systemName: "chevron.compact.right")!),
        MediaFileTypeItem(tittle: "Замедлено", image: UIImage(systemName: "slowmo")!, type: subtitleType.text("1"), accessoryImage: UIImage(systemName: "chevron.compact.right")!),
        MediaFileTypeItem(tittle: "Киноэффект", image: UIImage(systemName: "arrow.up.right.video")!, type: subtitleType.text("18"),  accessoryImage: UIImage(systemName: "chevron.compact.right")!),
        MediaFileTypeItem(tittle: "Снимки экрана", image: UIImage(systemName: "camera.viewfinder")!, type: subtitleType.text("65"),  accessoryImage: UIImage(systemName: "chevron.compact.right")!),
        MediaFileTypeItem(tittle: "Записи экрана", image: UIImage(systemName: "record.circle")!, type: subtitleType.text("21"), accessoryImage: UIImage(systemName: "chevron.compact.right")!),
        MediaFileTypeItem(tittle: "Анимированные", image: UIImage(systemName: "square.stack.3d.forward.dottedline")!, type: subtitleType.text("17"), accessoryImage: UIImage(systemName: "chevron.compact.right")!),
        MediaFileTypeItem(tittle: "RAW", image: UIImage(systemName: "r.square.on.square")!, type: subtitleType.text("5"), accessoryImage: UIImage(systemName: "chevron.compact.right")!),
    ]

    let utilities: [MediaFileTypeItem] = [
        MediaFileTypeItem(tittle: "Импортированные", image: UIImage(systemName: "square.and.arrow.down")!, type: subtitleType.text("10"), accessoryImage: UIImage(systemName: "chevron.compact.right")!),
        MediaFileTypeItem(tittle: "Скрытые", image: UIImage(systemName: "eye.slash")!, type: subtitleType.iconImage(UIImage(systemName: "lock.fill")!), accessoryImage: UIImage(systemName: "chevron.compact.right")!),
        MediaFileTypeItem(tittle: "Недавно удаленные", image: UIImage(systemName: "trash")!, type: subtitleType.iconImage(UIImage(systemName: "lock.fill")!), accessoryImage: UIImage(systemName: "chevron.compact.right")!)
        ]
}
