//
//  Oryx.swift
//  TestTaskMacPaw
//
//  Created by Дмитро Сегейда on 22.08.2023.
//

import Foundation

struct RussiaLossesEquipmentOryx: Codable {
    let equipmentOryx: String?
    let model: String?
    let manufacturer: String?
    let lossesTotal: Int?
    let equipmentUA: String?

    enum CodingKeys: String, CodingKey {
        case equipmentOryx = "equipment_oryx"
        case model, manufacturer, lossesTotal
        case equipmentUA = "equipment_ua"
    }
}

