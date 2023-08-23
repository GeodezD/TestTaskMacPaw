//
//  ImageAndTextCollectionViewCell.swift
//  TestTaskMacPaw
//
//  Created by Дмитро Сегейда on 22.08.2023.
//

import UIKit

class ImageAndTextCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setImage(imageName: String) {
        let selectedColor: MyColors = .colorCell
        imageView.backgroundColor = selectedColor.color
        imageView.image = UIImage(named: imageName)
    }
    
    func setLabel(with text: String, label: UILabel, font: CGFloat = 16, bold: Bool = false) {
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
