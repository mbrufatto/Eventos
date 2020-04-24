//
//  ListEventViewModelProtocol.swift
//  Events
//
//  Created by Marcio Habigzang Brufatto on 22/04/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

import Foundation

protocol ListEventViewModelProtocol {
    func numberOfRows() -> Int
    func eventAt(_ index: Int) -> Event
    func loadEvents(completion: @escaping GetEventsClosure)
    func updateListEvent(events: [Event])
}
