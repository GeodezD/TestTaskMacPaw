//
//  CollectionView.swift
//  TestTaskMacPaw
//
//  Created by Дмитро Сегейда on 22.08.2023.
//

import UIKit

class CollectionView: UICollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCollectionView() -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.register(.init(nibName: "DataAndDayCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DataAndDayCollectionViewCell")
        collectionView.register(.init(nibName: "ImageAndTextCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageAndTextCollectionViewCell")
        let selectedColor: MyColors = .collectionView
        collectionView.backgroundColor = selectedColor.color
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { fatalError() }
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 2
        layout.scrollDirection = .vertical
        return collectionView
    }
}
