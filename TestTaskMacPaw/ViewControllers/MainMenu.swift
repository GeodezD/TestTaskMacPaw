//
//  MainViewController.swift
//  TestTaskMacPaw
//
//  Created by Дмитро Сегейда on 23.08.2023.
//

import UIKit

final class MainMenu: ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupConstraints()
    }
    
    override func setup() {
        super.setup()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func setupConstraints() {
        super.setupConstraints()
    }
}




