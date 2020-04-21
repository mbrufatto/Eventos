//
//  ListEventsTest.swift
//  EventsTests
//
//  Created by Marcio Habigzang Brufatto on 21/04/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

import XCTest
@testable import Events

class ListEventsTest: XCTestCase {
    
    func testListEvents() {
        let events = didLoadEvents(nameFile: "events")
        XCTAssertEqual(events.count, 3)
    }
    
    private func didLoadEvents(nameFile: String) -> [Event] {
           let bundle = Bundle(for: type(of: self))
           if let url = bundle.url(forResource: nameFile, withExtension: "json") {
               do {
                   let data = try Data(contentsOf: url)
                   let decoder = JSONDecoder()
                   let jsonData = try decoder.decode([Event].self, from: data)
                   return jsonData
               } catch {
                   return []
               }
           }
           return []
       }
}
