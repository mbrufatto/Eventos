//
//  NetworkManagerProtocol.swift
//  Events
//
//  Created by Marcio Habigzang Brufatto on 22/04/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

import Foundation

typealias GetEventsClosure = ([Event]) -> Void
typealias GetEventAddressClosure = (Address) -> Void
typealias DoCheckinClousure = (Bool) -> Void

protocol NetworkManagerProtocol {
    func getEvents(completion: @escaping GetEventsClosure)
    func getAddressByLatitudeAndLongitude(latitude: String, longitude: String, completion: @escaping GetEventAddressClosure)
    func sendCheckin(eventId: String, name: String, email: String, completion: @escaping DoCheckinClousure)
}
