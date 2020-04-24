//
//  DoubleExtension.swift
//  Events
//
//  Created by Marcio Habigzang Brufatto on 23/04/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

import Foundation

extension Double {
    func formatCurrency() -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.currencyCode = "BRL"
        formatter.currencySymbol = "R$"
        formatter.maximumFractionDigits = 2
        formatter.numberStyle = .currencyAccounting
        return formatter.string(from: NSNumber(value: self)) ?? "R$\(self)"
    }
}
