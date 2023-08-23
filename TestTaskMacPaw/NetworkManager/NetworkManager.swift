//
//  NetworkManager.swift
//  TestTaskMacPaw
//
//  Created by Дмитро Сегейда on 22.08.2023.
//

import UIKit

enum Url: String {
    case russiaLossesPersonnel = "https://raw.githubusercontent.com/PetroIvaniuk/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_personnel.json"
    case russiaLossesEquipment = "https://raw.githubusercontent.com/PetroIvaniuk/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_equipment.json"
    case russiaLossesEquipmentCorrection = "https://raw.githubusercontent.com/PetroIvaniuk/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_equipment_correction.json"
    case russiaLossesEquipmentOryx = "https://raw.githubusercontent.com/PetroIvaniuk/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_equipment_oryx.json"
}

final class NetworkManager {
    
    func fetchPage(str: String, completion: @escaping ((Data) -> Void)) {
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig,
                                 delegate: nil,
                                 delegateQueue: nil)
        guard let url = URL(string: str) else { fatalError() }
        var request = URLRequest(url: url,  cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 60)
        request.httpMethod = "GET"
        let serialQueue = DispatchQueue(label: "Network", attributes: .concurrent)
        serialQueue.sync {
            let task = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
                if error != nil {
                    print("error")
                }
                guard let data = data else { return }
                completion(data)
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
