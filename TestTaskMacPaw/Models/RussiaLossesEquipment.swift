//
//  russiaLossesEquipment.swift
//  TestTaskMacPaw
//
//  Created by Дмитро Сегейда on 22.08.2023.
//

import Foundation

struct RussiaLossesEquipment: Codable {
    let date: String
    let day: Int
    let aircraft: Int
    let helicopter: Int
    let tank: Int
    let apc: Int
    let fieldArtillery: Int
    let mrl: Int
    let drone: Int
    let navalShip: Int
    let antiAircraftWarfare: Int

    let militaryAuto: Int?
    let fuelTank: Int?
    let mobileSRBMSystem: Int?
    let vehiclesAndFuelTanks: Int?
    let cruiseMissiles: Int?
    let directionOfGreatestLosses: String?
    let specialEquipment: Int?
    
    let optionalSet: Set = ["militaryAuto", "fuelTank", "mobileSRBMSystem", "vehiclesAndFuelTanks", "cruiseMissiles", "directionOfGreatestLosses", "specialEquipment"]
    
    enum CodingKeys: String, CodingKey {
        case date, day, aircraft, helicopter, tank, drone
        case fieldArtillery = "field artillery"
        case militaryAuto = "military auto"
        case fuelTank = "fuel tank"
        case navalShip = "naval ship"
        case antiAircraftWarfare = "anti-aircraft warfare"
        case apc = "APC"
        case mrl = "MRL"
        case mobileSRBMSystem = "mobile SRBM System"
        case vehiclesAndFuelTanks = "vehicles and fuel tanks"
        case cruiseMissiles = "cruise missiles"
        case directionOfGreatestLosses  = "greatest losses direction"
        case specialEquipment = "special equipment"
        
    }
    
    func GettingTheNumberOfElements() -> Int {
        return returnDataArray().count
    }
    
    func returnDataArray() -> [String : Any] {
        let dataDictionary: [String : Any?] = ["date" : date,
                                          "day" : day,
                                          "aircraft" : aircraft,
                                          "helicopter" : helicopter,
                                          "tank" : tank,
                                          "apc" : apc,
                                          "fieldArtillery" : fieldArtillery,
                                          "mrl" : mrl,
                                          "drone" : drone,
                                          "navalShip" : navalShip,
                                          "antiAircraftWarfare" : antiAircraftWarfare,
                                          "militaryAuto" : militaryAuto,
                                          "fuelTank" : fuelTank,
                                          "mobileSRBMSystem" : mobileSRBMSystem,
                                          "vehiclesAndFuelTanks" : vehiclesAndFuelTanks,
                                          "cruiseMissiles" : cruiseMissiles,
                                          "directionOfGreatestLosses" : directionOfGreatestLosses,
                                          "specialEquipment" : specialEquipment]
        
//        let nonNilDataDictionary: [String : Any] = dataArray.filter { (_, value) in
//            return value != nil
//        } as [String : Any]
        
        var nonNilDataDictionary: [String : Any] = [ : ]
        for (key, value) in dataDictionary {
            if value != nil {
                nonNilDataDictionary[key] = value
            }
        }
        return nonNilDataDictionary
    }
}

