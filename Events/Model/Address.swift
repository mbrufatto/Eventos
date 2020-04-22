//
//  Address.swift
//  Events
//
//  Created by Marcio Habigzang Brufatto on 22/04/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

import Foundation


struct Address: Codable {
    var road: String = ""
    var suburb: String = ""
    var city_district: String = ""
    var city: String =  ""
    var county: String = ""
    var state_district: String = ""
    var state: String = ""
    var postcode: String = ""
    var country: String = ""
    var country_code: String = ""
}

struct AddressBase: Codable {
    var address: Address
}
