//
//  StatisticForOneDay + extension.swift
//  TestTaskMacPaw
//
//  Created by Дмитро Сегейда on 22.08.2023.
//

import UIKit

extension StatisticForOneDay: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let dataStatisticForOneDayEquipment {
            return dataStatisticForOneDayEquipment.GettingTheNumberOfElements()
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellImageWithText = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageAndTextCollectionViewCell", for: indexPath) as? ImageAndTextCollectionViewCell
        let cellOnlyText = collectionView.dequeueReusableCell(withReuseIdentifier: "DataAndDayCollectionViewCell", for: indexPath) as? DataAndDayCollectionViewCell
        guard let cellOnlyText else {fatalError()}
        guard let cellImageWithText else {fatalError()}
        let selectedColor: MyColors = .colorCell
        cellOnlyText.backgroundColor = selectedColor.color
        cellOnlyText.layer.cornerRadius = 20
        cellImageWithText.backgroundColor = selectedColor.color
        cellImageWithText.layer.cornerRadius = 20
        if dataStatisticForOneDayEquipment != nil && dataStatisticForOneDayPersonnel != nil {
            
            switch indexPath.item {
            case 0:
                if let day = dataDictionaryEquipment["day"],
                   let date = dataDictionaryEquipment["date"] {
                    cellOnlyText.setLabel(with: "Statistic for:",
                                          label: .labelStatisttic,
                                          font: 16,
                                          bold: .textBoldFalse)
                    cellOnlyText.setLabel(with: "\(date)",
                                          label: .labelDate,
                                          font: 18,
                                          bold: .textBoldFalse)
                    cellOnlyText.setLabel(with: "\(day)",
                                          label: .labelDays,
                                          font: 35,
                                          bold: .textBoldTrue)
                    return cellOnlyText
                }
            case 1:
                if let element = dataStatisticForOneDayPersonnel?.personnel, let name = imageNameDictionary["personnel"] {
                    cellImageWithText.setImage(imageName: "\(name)")
                    cellImageWithText.setLabel(with: "\(name): \(element)",
                                               font: 16,
                                               bold: .textBoldFalse)
                    return cellImageWithText
                }
            case indexPath.item:
//            case indexPath.item where indexPath.item != 0:
                let key = keysArrayDataDictionaryEquipment[indexPath.item - 2]
                if let element = dataDictionaryEquipment[key], let name = imageNameDictionary[key]  {
                    cellImageWithText.setImage(imageName: "\(name)")
                    cellImageWithText.setLabel(with: "\(name): \(element)",
                                               font: 16,
                                               bold: .textBoldFalse)
                    return cellImageWithText
                }
            default:
                break
            }
        }
        
        return cellOnlyText
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 || indexPath.item == 1 {
            return CGSize(width: collectionView.frame.width,
                          height: collectionView.frame.width / 2 - 2)
        }
        
        return CGSize(width: collectionView.frame.width / 2 - 2,
                      height: collectionView.frame.width / 2 - 2)
    }
}
