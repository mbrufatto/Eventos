//
//  IntExtension.swift
//  Events
//
//  Created by Marcio Habigzang Brufatto on 21/04/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

import Foundation

extension Int {
    func convertTimespampToDate(timestamp: Int) -> String {
        let epocTime = TimeInterval(timestamp) / 1000
        let unixTimestamp = Date(timeIntervalSince1970: epocTime)
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT") //Set timezone that you want
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "dd/MM/yyyy" //Specify your format that you want
        return dateFormatter.string(from: unixTimestamp)
    }
}
