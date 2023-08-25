//
//  AllStattistic.swift
//  TestTaskMacPaw
//
//  Created by Дмитро Сегейда on 22.08.2023.
//

import UIKit

class AllStatistics: UIViewController {
    
    private let collectionView = CollectionView(frame: .zero, collectionViewLayout: .init()).setupCollectionView()
    let semaphore = DispatchSemaphore(value: 0)
    var dataEquipment: [RussiaLossesEquipment]?
    var dataPersonnel: [RussiaLossesPersonnel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        takeDataEquipment()
        takeDataPersonnel()
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupConstraints()
    }
    
    func setup() {
        let selectedColor: MyColors = .superViewBackgroundColor
        view.backgroundColor = selectedColor.color
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
    }
    
    func setupConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            
        ])
    }
    
    func takeDataEquipment() {
        NetworkManager().fetchPage(str: Url.russiaLossesEquipment.rawValue) { data in
            let decodeData = NetworkManager().decodeData(data, into: [RussiaLossesEquipment].self)
            self.dataEquipment = decodeData?.reversed()
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

    func takeDataPersonnel() {
        NetworkManager().fetchPage(str: Url.russiaLossesPersonnel.rawValue) { data in
            let decode = NetworkManager().decodeData(data, into: [RussiaLossesPersonnel].self)
            self.dataPersonnel = decode?.reversed()
        }
    }
}

/*
 RussiaLossesPersonnel
 RussiaLossesEquipment
 RussiaLossesEquipmentCorrection
 RussiaLossesEquipmentOryx
 */
