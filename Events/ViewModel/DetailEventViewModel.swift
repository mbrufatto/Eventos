//
//  DetailEventViewModel.swift
//  Events
//
//  Created by Marcio Habigzang Brufatto on 23/04/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

import UIKit

class DetailEventViewModel: DetailEventViewModelProtocol {

    private var networkManagerProtocol: NetworkManagerProtocol
    
    init(networkManagerProtocol: NetworkManagerProtocol? = nil) {
        self.networkManagerProtocol = networkManagerProtocol ?? NetworkManager()
    }
    
    func loadAddress(latitude: String, longitude: String, completion: @escaping GetEventAddressClosure) {
        self.networkManagerProtocol.getAddressByLatitudeAndLongitude(latitude: latitude, longitude: longitude, completion: { address in
            completion(address)
        })
    }
    
    func doCheckin(eventId: String, name: String, email: String, completion: @escaping DoCheckinClousure) {
        self.networkManagerProtocol.sendCheckin(eventId: eventId, name: name, email: email, completion: { result in
            completion(result)
        })
    }
}
