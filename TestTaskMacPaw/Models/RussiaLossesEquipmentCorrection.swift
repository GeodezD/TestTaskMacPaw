//
//  Correction.swift
//  TestTaskMacPaw
//
//  Created by Дмитро Сегейда on 22.08.2023.
//

import Foundation

struct RussiaLossesEquipmentCorrection: Codable {
    let date: String
    let day: Int
    let aircraft: Int?
    let helicopter: Int?
    let tank: Int?
    let apc: Int?
    let fieldArtillery: Int?
    let mrl: Int?
    let drone: Int?
    let navalShip: Int?
    let antiAircraftWarfare: Int?
    let specialEquipment: Int?
    let vehiclesAndFuelTanks: Int?
    let cruiseMissiles: Int?

    enum CodingKeys: String, CodingKey {
        case date, day, aircraft, helicopter, drone, navalShip, antiAircraftWarfare, tank, cruiseMissiles
        case apc = "APC"
        case fieldArtillery = "field artillery"
        case mrl = "MRL"
        case specialEquipment = "special equipment"
        case vehiclesAndFuelTanks = "vehicles and fuel tanks"
    }
}




