//
//  ForYouViewController + extension.swift
//  iOSPhotoApp
//
//  Created by Rustem on 19.03.2024.
//
import UIKit

extension ForYouViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PhotoAssets.forYouAlbum.count
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.identifier, for: indexPath) as! SectionHeader
        header.title.text = "Воспоминания"
        header.headerButton.isHidden = false
        header.headerButton.addTarget(self, action: #selector(didTapAllPhotoButton), for: .touchUpInside)
        return header
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ForYouCollectionViewCell.identifier, for: indexPath) as? ForYouCollectionViewCell else {
            fatalError("no cell")
        }
        let albumItem = PhotoAssets.forYouAlbum[indexPath.item]
        cell.configure(with: UIImage(named:albumItem))
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }

    @objc func didTapAllPhotoButton() {
        swithLayout(to: .vertical)
    }
}
