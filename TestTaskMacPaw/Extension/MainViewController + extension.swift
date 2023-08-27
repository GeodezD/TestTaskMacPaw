//
//  MainViewController + extension.swift
//  TestTaskMacPaw
//
//  Created by Дмитро Сегейда on 25.08.2023.
//

import UIKit

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageAndTextCollectionViewCell", for: indexPath) as? ImageAndTextCollectionViewCell
        guard let cell else {fatalError()}
        
        let selectedColor: MyColors = .colorCell
        cell.backgroundColor = selectedColor.color
        cell.imageView.alpha = 0.8
        cell.imageView?.layer.cornerRadius = 10
        cell.layer.cornerRadius = 20
        
        switch indexPath.item {
        case 0:
            cell.setImage(imageName: "UA")
            cell.setLabel(with: "Statistics of total losses",
                          bold: .textBoldTrue)
        case 1:
            cell.setImage(imageName: "Fire car")
            cell.setLabel(with: "Losses military equipment",
                          bold: .textBoldTrue)
        default:
            break
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.item{
        case 0:
            let nextPageAllStatistics = AllStatistics()
            navigationController?.pushViewController(nextPageAllStatistics, animated: true)
        case 1:
            let nextPageAllStatistics = MilitaryEquipment()
            navigationController?.pushViewController(nextPageAllStatistics, animated: true)
        default:
            break
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width - 2,
                      height: collectionView.frame.width / 1.25)
    }
}


