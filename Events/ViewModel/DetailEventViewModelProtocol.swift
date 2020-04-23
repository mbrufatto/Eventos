//
//  DetailEventViewModelProtocol.swift
//  Events
//
//  Created by Marcio Habigzang Brufatto on 23/04/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

import Foundation

protocol DetailEventViewModelProtocol {
    func loadAddress(latitude: String, longitude: String, completion: @escaping GetEventAddressClosure)
}
