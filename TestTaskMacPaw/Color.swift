//
//  Color.swift
//  TestTaskMacPaw
//
//  Created by Дмитро Сегейда on 22.08.2023.
//

import UIKit

enum MyColors {
    case superViewBackgroundColor
    case colorCell
    case collectionView
    
    var color: UIColor {
        switch self {
        case .superViewBackgroundColor:
            return UIColor.systemGray5
        case .colorCell:
            return UIColor.systemGray3
        case .collectionView:
            return UIColor.systemGray5
        }
    }
}
