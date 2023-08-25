//
//  AllStatistic + extension.swift
//  TestTaskMacPaw
//
//  Created by Дмитро Сегейда on 22.08.2023.
//

import UIKit

extension AllStatistics: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let dataEquipment {
            return dataEquipment.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DataAndDayCollectionViewCell", for: indexPath) as? DataAndDayCollectionViewCell
        guard let cell else {fatalError()}
        
        let selectedColor: MyColors = .colorCell
        cell.backgroundColor = selectedColor.color
        cell.layer.cornerRadius = 20
        
        if let dataEquipment  {
            cell.setLabel(with: "Statistics for",
                          label: .labelStatisttic,
                          font: 16,
                          bold: .textBoldFalse)
            cell.setLabel(with: "Date: \(dataEquipment[indexPath.item].date)",
                          label: .labelDate,
                          font: 18,
                          bold: .textBoldFalse)
            cell.setLabel(with: "Day: \(dataEquipment[indexPath.item].day)",
                          label: .labelDays,
                          font: 25,
                          bold: .textBoldTrue)
            let selectedColor: MyColors = .colorCell
            cell.backgroundColor = selectedColor.color
            return  cell
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nextPage = StatisticForOneDay()
        var setOptionalWithOptionalProperty: Set<String> = []
        
        if let dataPersonnel {
            nextPage.dataStatisticForOneDayPersonnel = dataPersonnel[indexPath.item]
        }
        
        if let dataEquipment  {
            nextPage.dataStatisticForOneDayEquipment = dataEquipment[indexPath.item]
            
            for (key, _) in dataEquipment[indexPath.item].returnDataArray() {
                if key != "day" && key != "date" {
                    nextPage.keysArrayDataDictionaryEquipment.append(key)
                }
                
                for keySet in dataEquipment[indexPath.item].optionalSet {
                    if key == keySet {
                        setOptionalWithOptionalProperty.insert(key)
                    }
                }
            }
            
            let setWithNil = dataEquipment[indexPath.item].optionalSet.symmetricDifference(setOptionalWithOptionalProperty)
            nextPage.dataDictionaryEquipment = dataEquipment[indexPath.item].returnDataArray()
            
            for element in setWithNil {
                nextPage.dataDictionaryEquipment[element] = nil
            }
        }
        present(nextPage, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width / 2 - 2,
                      height: collectionView.frame.width / 2 - 2)
    }
    
}
