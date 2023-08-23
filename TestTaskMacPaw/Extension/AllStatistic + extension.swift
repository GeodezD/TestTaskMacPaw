//
//  AllStatistic + extension.swift
//  TestTaskMacPaw
//
//  Created by Дмитро Сегейда on 22.08.2023.
//

import UIKit

extension AllStatistics: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let data {
            return data.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DataAndDayCollectionViewCell", for: indexPath) as? DataAndDayCollectionViewCell
        guard let cell else {fatalError()}
        if let data  {
            cell.setLabel(with: "Statistics for", label: cell.labelStatisttic, font: 16, bold: false)
            cell.setLabel(with: "Date: \(data[indexPath.item].date)", label: cell.labelDate, font: 18, bold: false)
            cell.setLabel(with: "Day: \(data[indexPath.item].day)", label: cell.labelDays, font: 25, bold: true)
            let selectedColor: MyColors = .colorCell
            cell.backgroundColor = selectedColor.color
            return  cell
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nextPage = StatisticForOneDay()
        if let data  {
            nextPage.dataStatisticForOneDay  = data[indexPath.item]
        }
        present(nextPage, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width / 2 - 2,
                      height: collectionView.frame.width / 2 - 2)
    }
    
}
