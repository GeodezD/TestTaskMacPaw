//
//  MilitaryEquipment + extension.swift
//  TestTaskMacPaw
//
//  Created by Дмитро Сегейда on 25.08.2023.
//

import UIKit

extension MilitaryEquipment: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let dataRussiaLossesEquipmentOryx {
            return dataRussiaLossesEquipmentOryx.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FiveLabelCollectionViewCell", for: indexPath) as? FiveLabelCollectionViewCell
        guard let cell else {fatalError()}
        
        let selectedColor: MyColors = .colorCell
        cell.backgroundColor = selectedColor.color
        cell.layer.cornerRadius = 20
        
        if let dataRussiaLossesEquipmentOryx  {
            cell.setLabel(with: "Equipent onyx: \(dataRussiaLossesEquipmentOryx[indexPath.item].equipmentOryx)",
                          label: .equipmentOryx,
                          font: 16,
                          bold: .textBoldFalse)
            
            cell.setLabel(with: "Model: \(dataRussiaLossesEquipmentOryx[indexPath.item].model)",
                          label: .model,
                          font: 20,
                          bold: .textBoldTrue)
            
            cell.setLabel(with: "Manufacturer: \(dataRussiaLossesEquipmentOryx[indexPath.item].manufacturer)",
                          label: .manufacturer,
                          font: 16,
                          bold: .textBoldFalse)
            
            cell.setLabel(with: "Losses total: \(dataRussiaLossesEquipmentOryx[indexPath.item].lossesTotal)",
                          label: .lossesTotal,
                          font: 20,
                          bold: .textBoldTrue)
            
            cell.setLabel(with: "Equipment ua: \(dataRussiaLossesEquipmentOryx[indexPath.item].equipmentUa)",
                          label: .equipmentUA,
                          font: 16,
                          bold: .textBoldFalse)
            return  cell
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2 - 2,
                      height: collectionView.frame.width / 2 - 2)
    }
}


