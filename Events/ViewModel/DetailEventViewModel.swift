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
    
    init(networkManagerProtocol: NetworkManagerProtocol) {
        self.networkManagerProtocol = networkManagerProtocol
    }
    
    func loadAddress(latitude: String, longitude: String, completion: @escaping GetEventAddressClosure) {
        self.networkManagerProtocol.getAddressByLatitudeAndLongitude(latitude: latitude, longitude: longitude, completion: { address in
            completion(address)
        })
    }
}
