//
//  Event.swift
//  Events
//
//  Created by Marcio Habigzang Brufatto on 21/04/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

import Foundation


struct Event: Codable {
    var id: String = ""
    var title: String = ""
    var date: String = ""
    var description: String = ""
    var image: String = ""
    var latitude: String = ""
    var longitude: String = ""
    var address: String = ""
    var price: Double = 0.0
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case date
        case description
        case image
        case latitude
        case longitude
        case price
    }
    
    init() {}
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let idEvent = try? container.decode(String.self, forKey: .id) {
            self.id = idEvent
        }
        
        if let eventTitle = try? container.decode(String.self, forKey: .title) {
            self.title = eventTitle
        }
        
        if let eventDate = try? container.decode(Int.self, forKey: .date) {
            self.date = eventDate.convertTimespampToDate()
        }
        
        if let eventDesc = try? container.decode(String.self, forKey: .description) {
            self.description = eventDesc
        }
        
        if let eventImage = try? container.decode(String.self, forKey: .image) {
            self.image = eventImage
        }
        
        if let lat = try? container.decode(String.self, forKey: .latitude) {
            self.latitude = lat
        } else if let lat = try? container.decode(Double.self, forKey: .latitude) {
            self.latitude = "\(lat)"
        }
        
        if let long = try? container.decode(String.self, forKey: .longitude) {
            self.longitude = long
        } else if let long = try? container.decode(Double.self, forKey: .longitude) {
            self.longitude = "\(long)"
        }
        
        if let eventPrice = try? container.decode(Double.self, forKey: .price) {
            self.price = eventPrice
        }
    }
}
