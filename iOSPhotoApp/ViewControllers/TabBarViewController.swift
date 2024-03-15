//
//  TabBarViewController.swift
//  iOSPhotoApp
//
//  Created by Rustem on 15.03.2024.
//

import UIKit

final class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarController()
        setupTabBarViewController()
    }

    private func setupTabBarController() {
        tabBar.tintColor = .systemBlue
        tabBar.backgroundColor = .white
    }

    private func setupTabBarViewController() {
        let first = MediaViewController()
        let firstIcon = UITabBarItem(title: "Медиатека", image: UIImage(systemName: "photo.on.rectangle"), selectedImage: UIImage(systemName: "photo.fill.on.rectangle.fill"))
        first.tabBarItem = firstIcon

        let second = ForYouViewController()
        let secondIcon = UITabBarItem(title: "Для Вас", image: UIImage(systemName: "heart.text.square"), selectedImage: UIImage(systemName: "heart.text.square.fill"))
        second.tabBarItem = secondIcon

        let third = MediaViewController()
        let thirdIcon = UITabBarItem(title: "Альбомы", image: UIImage(systemName: "rectangle.stack"), selectedImage: UIImage(systemName: "rectangle.stack.fill"))
        third.tabBarItem = thirdIcon

        let forth = MediaViewController()
        let forthIcon = UITabBarItem(title: "Поиск", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass"))
        forth.tabBarItem = forthIcon

        let controllers = [first, second, third, forth]
        self.setViewControllers(controllers, animated: true)

    }

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
}

