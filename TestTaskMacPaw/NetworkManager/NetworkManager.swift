//
//  NetworkManager.swift
//  TestTaskMacPaw
//
//  Created by Дмитро Сегейда on 22.08.2023.
//

import UIKit

enum Url {
    case russiaLossesPersonnel
    case russiaLossesEquipment
    case russiaLossesEquipmentCorrection
    case russiaLossesEquipmentOryx
    
    var url: String {
        switch self {
        case .russiaLossesPersonnel:
            return "https://raw.githubusercontent.com/PetroIvaniuk/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_personnel.json"
        case .russiaLossesEquipment:
            return "https://raw.githubusercontent.com/PetroIvaniuk/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_equipment.json"
        case .russiaLossesEquipmentCorrection:
            return "https://raw.githubusercontent.com/PetroIvaniuk/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_equipment_correction.json"
        case .russiaLossesEquipmentOryx:
            return "https://raw.githubusercontent.com/PetroIvaniuk/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_equipment_oryx.json"
        }
    }
}

final class NetworkManager {
    
    func fetchPage(str: Url, completion: @escaping ((Data?, Error?) -> Void)) {
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig,
                                 delegate: nil,
                                 delegateQueue: nil)
        guard let url = URL(string: str.url) else { fatalError() }
        var request = URLRequest(url: url,  cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 60)
        request.httpMethod = "GET"
        let serialQueue = DispatchQueue(label: "Network", attributes: .concurrent)
        serialQueue.sync {
            let task = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
                if error != nil {
                    print("error")
                    completion(nil, error)
                }
                guard let data = data else { return }
                completion(data, nil)
            }
            task.resume()
            session.finishTasksAndInvalidate()
        }
    }
    
    func decodeData<T: Decodable>(_ data: Data, into type: [T].Type) -> [T]? {
        let decoder = JSONDecoder()
        do {
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(type, from: data)
            return decodedData
        } catch {
            print("Decoding error: \(error)")
            return nil
        }
    }
}
