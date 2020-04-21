//
//  Event.swift
//  Events
//
//  Created by Marcio Habigzang Brufatto on 21/04/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

import Foundation


struct Event: Codable {
    let id: String
    let title: String
    let date: String
    let description: String
    let image: String
    let latitude: String
    let longitude: String
    let address: String
    let price: Double
}
