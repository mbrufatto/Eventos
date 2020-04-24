//
//  ListEventViewModel.swift
//  Events
//
//  Created by Marcio Habigzang Brufatto on 22/04/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

import Foundation

class ListEventViewModel: ListEventViewModelProtocol {
    
    private var events: [Event] = []
    private var networkManagerProtocol: NetworkManagerProtocol
    private var address: String?
    
    init(networkManagerProtocol: NetworkManagerProtocol? = nil) {
        self.networkManagerProtocol = networkManagerProtocol ?? NetworkManager(session: URLSession.shared)
    }
    
    func numberOfRows() -> Int {
        return self.events.count
    }
    
    func eventAt(_ index: Int) -> Event {
        return self.events[index]
    }
    
    func loadEvents(completion: @escaping GetEventsClosure) {
        self.networkManagerProtocol.getEvents(completion: { (events) in
            self.updateListEvent(events: events)
            completion(self.events)
        })
    }
    
    func updateListEvent(events: [Event]) {
        for event in events {
            if !self.events.contains(where: { $0.id == event.id }) {
                self.events.append(event)
            }
        }
    }
}
