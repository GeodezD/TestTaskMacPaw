//
//  MilitaryEquipment.swift
//  TestTaskMacPaw
//
//  Created by Дмитро Сегейда on 25.08.2023.
//

import UIKit

final class LostMilitaryEquipment: ViewController {
    
    var dataRussiaLossesEquipmentOryx: [RussiaLossesEquipmentOryx]?
    override func viewDidLoad() {
        super.viewDidLoad()
        takeData()
    }
    
    override  func setup() {
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
    
    func takeData() {
        NetworkManager().fetchPage(str: .russiaLossesEquipmentOryx) { (data, error) in
            if let data {
                let decode = NetworkManager().decodeData(data, into: [RussiaLossesEquipmentOryx].self)
                self.dataRussiaLossesEquipmentOryx = decode
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            } else {
                DispatchQueue.main.async {
                    self.showAlert(message: "No internet connection")
                }
            }
        }
    }
}
