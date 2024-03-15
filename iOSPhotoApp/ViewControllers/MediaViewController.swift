//
//  MediaViewController.swift
//  iOSPhotoApp
//
//  Created by Rustem on 15.03.2024.
//

import UIKit
import SnapKit

final class MediaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureNavigationBar()
    }

    private func configureNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor.systemBackground
        appearance.shadowColor = .label
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Медиатека"
    }
}
