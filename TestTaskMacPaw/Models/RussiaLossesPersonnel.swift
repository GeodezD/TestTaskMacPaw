//
//  Personnel.swift
//  TestTaskMacPaw
//
//  Created by Дмитро Сегейда on 22.08.2023.
//

import Foundation

struct RussiaLossesPersonnel: Codable {
    let date: String
    let day: Int
    let personnel: Int
    let personnelAbout: String?
    let pow: Int?
    
        enum CodingKeys: String, CodingKey {
            case date, day, personnel
            case personnelAbout = "personnel*"
            case pow = "POW"
        }

}


    






