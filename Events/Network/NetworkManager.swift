//
//  NetworkManager.swift
//  Events
//
//  Created by Marcio Habigzang Brufatto on 21/04/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

import Foundation

class NetworkManager: NetworkManagerProtocol {
   
    func getEvents(completion: @escaping GetEventsClosure) {
        
        let url = URL(string: ApiConfig.baseUrl)
        
        let dataTask = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            DispatchQueue.main.async {
                if let data = data {
                    let decoder = JSONDecoder()
                    do {
                        let decodedEvents = try decoder.decode([Event].self, from: data)
                        completion(decodedEvents)
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
        dataTask.resume()
    }
    
    
    func getAddressByLatitudeAndLongitude(latitude: String, longitude: String, completion: @escaping GetEventAddressClosure) {
        
        let url = URL(string: "http://nominatim.openstreetmap.org/reverse?lat=\(latitude)&lon=\(longitude)&format=json")
        
        let dataTask = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            DispatchQueue.main.async {
                if let data = data {
                    let decoder = JSONDecoder()
                    do {
                        let decodedAddress = try decoder.decode(AddressBase.self, from: data)
                        completion(decodedAddress.address)
                    } catch {
                        print(error.localizedDescription)
                        completion(Address())
                    }
                }
            }
        }
        dataTask.resume()
    }
}
