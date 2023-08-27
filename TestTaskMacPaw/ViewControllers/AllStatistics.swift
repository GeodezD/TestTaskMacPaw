//
//  AllStattistic.swift
//  TestTaskMacPaw
//
//  Created by Дмитро Сегейда on 22.08.2023.
//

import UIKit

final class AllStatistics: ViewController {
    
    var dataEquipment: [RussiaLossesEquipment]?
    var dataPersonnel: [RussiaLossesPersonnel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        takeDataEquipment()
        takeDataPersonnel()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func setup() {
        super.setup()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func setupConstraints() {
        super.setupConstraints()
    }
    
    override func showAlert(message: String) {
        super.showAlert(message: message)
    }
    
    func takeDataEquipment() {
        NetworkManager().fetchPage(str: .russiaLossesEquipment) { (data, error) in
            if let data {
                let decodeData = NetworkManager().decodeData(data, into: [RussiaLossesEquipment].self)
                self.dataEquipment = decodeData?.reversed()
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            } else {
                self.showAlert(message: "No internet connection")
            }
        }
    }
    
    func takeDataPersonnel() {
        NetworkManager().fetchPage(str: .russiaLossesPersonnel) { (data, error) in
            if let data {
                let decode = NetworkManager().decodeData(data, into: [RussiaLossesPersonnel].self)
                self.dataPersonnel = decode?.reversed()
            } else {
                self.showAlert(message: "No internet connection")
            }
        }
    }
}
