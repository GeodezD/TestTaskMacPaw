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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DataAndDayCollectionViewCell", for: indexPath) as? DataAndDayCollectionViewCell
        guard let cell else {fatalError()}
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nextPage = StatisticForOneDay()
        present(nextPage, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width / 2 - 2,
                      height: collectionView.frame.width / 2 - 2)
    }
    
}


