//
//  StatisticForOneDay + extension.swift
//  TestTaskMacPaw
//
//  Created by Дмитро Сегейда on 22.08.2023.
//

import UIKit

extension StatisticForOneDay {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let dataStatisticForOneDay {
            return dataStatisticForOneDay.someNil()
        }
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageAndTextCollectionViewCell", for: indexPath) as? ImageAndTextCollectionViewCell
        guard let cell else {fatalError()}
        let selectedColor: MyColors = .colorCell
        cell.backgroundColor = selectedColor.color
        if let dataStatisticForOneDay {
            switch indexPath.item {
            case 0:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DataAndDayCollectionViewCell", for: indexPath) as? DataAndDayCollectionViewCell
                guard let cell else {fatalError()}
                cell.setLabel(with: "Statistic for:", label: cell.labelStatisttic, font: 16, bold: false)
                cell.setLabel(with: "\(dataStatisticForOneDay.date)", label: cell.labelDate, font: 18, bold: false)
                cell.setLabel(with: "\(dataStatisticForOneDay.day)", label: cell.labelDays, font: 25, bold: true)
                let selectedColor: MyColors = .colorCell
                cell.backgroundColor = selectedColor.color
                print(dataStatisticForOneDay)
                return cell
            case 1:
                cell.setImage(imageName: "Aircraft")
                cell.setLabel(with: "Aircraft: \(dataStatisticForOneDay.aircraft)", label: cell.label, font: 16, bold: false)
            case 2:
                cell.setImage(imageName: "Helicopter")
                cell.setLabel(with: "Helicopter: \(dataStatisticForOneDay.helicopter)", label: cell.label, font: 16, bold: false)
            case 3:
                cell.setImage(imageName: "Tank")
                cell.setLabel(with: "Tank: \(dataStatisticForOneDay.tank)", label: cell.label, font: 16, bold: false)
            case 4:
                //                APC
                cell.setImage(imageName: "Armored Personnel Carrier")
                cell.setLabel(with: "Armored Personnel Carrier: \(dataStatisticForOneDay.apc)", label: cell.label, font: 16, bold: false)
            case 5:
                //                field artillery
                cell.setImage(imageName: "field artillery")
                cell.setLabel(with: "Field artillery: \(dataStatisticForOneDay.fieldArtillery)", label: cell.label, font: 16, bold: false)
            case 6:
                //                MRL
                cell.setImage(imageName: "Multiple Rocket Launcher")
                cell.setLabel(with: "Multiple Rocket Launcher: \(dataStatisticForOneDay.mrl)", label: cell.label, font: 16, bold: false)
            case 7:
                //                naval ship
                cell.setImage(imageName: "naval ship")
                cell.setLabel(with: "Naval ship: \(dataStatisticForOneDay.navalShip)", label: cell.label, font: 16, bold: false)
            case 8:
                //                anti-aircraft warfare
                cell.setImage(imageName: "anti-aircraft warfare")
                cell.setLabel(with: "Anti-aircraft warfare: \(dataStatisticForOneDay.antiAircraftWarfare)", label: cell.label, font: 16, bold: false)
            case 9:
                //                drone
                cell.setImage(imageName: "drone")
                cell.setLabel(with: "Drone: \(dataStatisticForOneDay.drone)", label: cell.label, font: 16, bold: false)
            case 10:
                //                military auto
                cell.setImage(imageName: "military auto")
                if dataStatisticForOneDay.militaryAuto != nil  {
                    cell.setLabel(with: "Military auto: \(dataStatisticForOneDay.militaryAuto)", label: cell.label, font: 16, bold: false)
                } else {
                    cell.setLabel(with: "Military auto: - ", label: cell.label, font: 16, bold: false)
                }
            case 11:
                //                fuel tank
                cell.setImage(imageName: "fuel tank")
                if dataStatisticForOneDay.fuelTank != nil {
                cell.setLabel(with: "Fuel tank: \(dataStatisticForOneDay.fieldArtillery)", label: cell.label, font: 16, bold: false)
            } else {
                cell.setLabel(with: "Fuel tank: - ", label: cell.label, font: 16, bold: false)
            }
            default:
                break
            }
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 {
            return CGSize(width: collectionView.frame.width,
                          height: collectionView.frame.width / 3 - 2)
        }
        
        return CGSize(width: collectionView.frame.width / 2 - 2,
                      height: collectionView.frame.width / 2 - 2)
    }
}
