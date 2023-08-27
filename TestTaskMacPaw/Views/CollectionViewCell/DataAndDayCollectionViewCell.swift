//
//  DataAndDayCollectionViewCell.swift
//  TestTaskMacPaw
//
//  Created by Дмитро Сегейда on 22.08.2023.
//

import UIKit

enum dataAndDayCollectionViewCell {
    case labelStatisttic, labelDate, labelDays
}

class DataAndDayCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var labelStatisttic: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelDays: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setLabel(with text: String,
                  label: dataAndDayCollectionViewCell,
                  font: CGFloat,
                  bold: TrueOrFalse) {
        var textLabel = UILabel()
        
        switch label {
        case .labelDate:
            textLabel = labelDate
        case .labelDays:
            textLabel = labelDays
        case .labelStatisttic:
            textLabel = labelStatisttic
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
