//
//  Enums.swift
//  TestTaskMacPaw
//
//  Created by Дмитро Сегейда on 26.08.2023.
//

import UIKit

enum TrueOrFalse {
    case textBoldTrue, textBoldFalse
}

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

