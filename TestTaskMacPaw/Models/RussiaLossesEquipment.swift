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
    let militaryAuto: Int?
    let fuelTank: Int?
    let drone: Int
    let navalShip: Int
    let antiAircraftWarfare: Int
    
    enum CodingKeys: String, CodingKey {
        case date, day, aircraft, helicopter, tank, drone
        case fieldArtillery = "field artillery"
        case militaryAuto = "military auto"
        case fuelTank = "fuel tank"
        case navalShip = "naval ship"
        case antiAircraftWarfare = "anti-aircraft warfare"
        case apc = "APC"
        case mrl = "MRL"
    }
    
    func someNil() -> Int {
        return 12
    }
}
/*
 [
 {
 "date": "2022-02-25",
 "day": 2,
 "aircraft": 10,
 "helicopter": 7,
 "tank": 80,
 "APC": 516,
 "field artillery": 49,
 "MRL": 4,
 "military auto": 100,
 "fuel tank": 60,
 "drone": 0,
 "naval ship": 2,
 "anti-aircraft warfare": 0
 },
 */
