//
//  FiveLabelCollectionViewCell.swift
//  TestTaskMacPaw
//
//  Created by Дмитро Сегейда on 25.08.2023.
//

import UIKit

enum labelInFiveLabelCollectionViewCell {
    case equipmentOryx, model, manufacturer, lossesTotal, equipmentUA
}



class FiveLabelCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var equipmentOryx: UILabel!
    @IBOutlet weak var model: UILabel!
    @IBOutlet weak var manufacturer: UILabel!
    @IBOutlet weak var lossesTotal: UILabel!
    @IBOutlet weak var equipmentUA: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setLabel(with text: String,
                  label: labelInFiveLabelCollectionViewCell,
                  font: CGFloat,
                  bold: TrueOrFalse) {
        var textLabel = UILabel()
        
        switch label {
        case .equipmentOryx:
            textLabel = equipmentOryx
        case .equipmentUA:
            textLabel = equipmentUA
        case .lossesTotal:
            textLabel = lossesTotal
        case .manufacturer:
            textLabel = manufacturer
        case .model:
            textLabel = model
        }
        
        textLabel.text = text
        textLabel.textAlignment = .center
        
        if bold == .textBoldTrue {
            textLabel.font = .boldSystemFont(ofSize: font)
        } else {
            textLabel.font = .systemFont(ofSize: font)
        }
        
        textLabel.sizeToFit()
    }
}
