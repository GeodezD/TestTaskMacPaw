//
//  StatisticForOneDay.swift
//  TestTaskMacPaw
//
//  Created by Дмитро Сегейда on 22.08.2023.
//

import UIKit

class StatisticForOneDay: ViewController {
    
    var dataStatisticForOneDayEquipment: RussiaLossesEquipment?
    var dataStatisticForOneDayPersonnel: RussiaLossesPersonnel?
    var dataDictionaryEquipment: [String : Any] = [ : ]
    var keysArrayDataDictionaryEquipment: [String] = []
    var imageNameDictionary: [String : String] = ["aircraft" : "Aircraft",
                                                  "helicopter" : "Helicopter",
                                                  "tank" : "Tank",
                                                  "apc" : "Armored Personnel Carrier",
                                                  "fieldArtillery" : "Field artillery",
                                                  "mrl" : "Multiple Rocket Launcher",
                                                  "drone" : "Drone",
                                                  "navalShip" : "Naval ship",
                                                  "antiAircraftWarfare" : "Anti-aircraft warfare",
                                                  "militaryAuto" : "Military auto",
                                                  "fuelTank" : "Fuel tank",
                                                  "mobileSRBMSystem" : "Mobile SRBM System",
                                                  "vehiclesAndFuelTanks" : "Vehicles and fuel tanks",
                                                  "cruiseMissiles" : "Cruise missiles",
                                                  "directionOfGreatestLosses" : "direction of greatest losses",
                                                  "specialEquipment" : "Special equipment",
                                                  "personnel" : "Personnel"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
}


