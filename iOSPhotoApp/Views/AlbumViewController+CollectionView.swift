//
//  Extensions.swift
//  iOSPhotoApp
//
//  Created by Rustem on 18.03.2024.
//

import Foundation
import UIKit


// MARK: - AlbumViewController
extension AlbumViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return [albums, peopleAndPlaces, mediaTypes, utilities].count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
            case 0:
                return albums.count
            case 1:
                return peopleAndPlaces.count
            case 2:
                return mediaTypes.count
            case 3:
                return utilities.count
            default:
                return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch indexPath.section {
            case 0:
                guard kind == UICollectionView.elementKindSectionHeader else {
                    return UICollectionReusableView()
                }
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.identifier, for: indexPath) as! SectionHeader
                header.title.text = "Мои альбомы"
                header.headerButton.isHidden = false
                header.headerButton.addTarget(self, action: #selector(didTapAllPhotoButton), for: .touchUpInside)
                return header
            case 1:
                guard kind == UICollectionView.elementKindSectionHeader else {
                    return UICollectionReusableView()
                }
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.identifier, for: indexPath) as! SectionHeader
                header.title.text = "Люди и места"
                header.headerButton.isHidden = true
                return header
            case 2:
                guard kind == UICollectionView.elementKindSectionHeader else {
                    return UICollectionReusableView()
                }
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.identifier, for: indexPath) as! SectionHeader
                header.title.text = "Типы медиафайлов"
                header.headerButton.isHidden = true
                return header
            case 3:
                guard kind == UICollectionView.elementKindSectionHeader else {
                    return UICollectionReusableView()
                }
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.identifier, for: indexPath) as! SectionHeader
                header.title.text = "Другое"
                header.headerButton.isHidden = true
                return header
            default:
                fatalError()
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 2 { // Assuming section 2 uses ListCollectionViewCell
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCollectionViewCell.identifier, for: indexPath) as? ListCollectionViewCell else {
                fatalError("Could not dequeue ListCollectionViewCell")
            }
            let mediaType = mediaTypes[indexPath.item]
            let isLastItem = indexPath.item == collectionView.numberOfItems(inSection: indexPath.section) - 1
            cell.configure(with: mediaType, isLastItem: isLastItem)
            return cell
        }
        switch indexPath.section {
            case 0:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SectionCollectionViewCell.identifier, for: indexPath) as? SectionCollectionViewCell else {
                    fatalError("no cell")
                }
                let albumItem = albums[indexPath.item]
                cell.configure(with: albumItem)
                return cell

            case 1:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SectionCollectionViewCell.identifier, for: indexPath) as? SectionCollectionViewCell else {
                    fatalError("no cell to deque")
                }
                let peopleAndPlaces = peopleAndPlaces[indexPath.item]
                cell.configure(with: peopleAndPlaces)
                return cell

            case 2:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCollectionViewCell.identifier, for: indexPath) as? ListCollectionViewCell else {
                    fatalError("no list cell")
                }
                let mediaTypes = mediaTypes[indexPath.item]
                cell.configure(with: mediaTypes, isLastItem: true)
                return cell

            case 3:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCollectionViewCell.identifier, for: indexPath) as? ListCollectionViewCell else {
                    fatalError("no list cell")
                }
                let mediaTypes = utilities[indexPath.item]
                cell.configure(with: mediaTypes, isLastItem: true)
                return cell
            default:
                fatalError("Default")
        }
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let isLastCellInSection = indexPath.item == collectionView.numberOfItems(inSection: indexPath.section) - 1
        if let listCell = cell as? ListCollectionViewCell {
            listCell.setSeparatorHidden(isLastCellInSection)
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    @objc func didTapAllPhotoButton() {
        print("didTapAllPhotoButton")
    }
}

