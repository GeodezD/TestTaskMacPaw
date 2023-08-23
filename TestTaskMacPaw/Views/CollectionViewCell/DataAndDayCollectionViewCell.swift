//
//  DataAndDayCollectionViewCell.swift
//  TestTaskMacPaw
//
//  Created by Дмитро Сегейда on 22.08.2023.
//

import UIKit

class DataAndDayCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var labelStatisttic: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelDays: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setLabel(with text: String, label: UILabel, font: CGFloat, bold: Bool) {
        label.text = text
        label.textAlignment = .center
        if bold {
            label.font = .boldSystemFont(ofSize: font)
        } else {
            label.font = .systemFont(ofSize: font)
        }
        label.sizeToFit()
    }
    
}
