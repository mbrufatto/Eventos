//
//  NetworkManagerTest.swift
//  EventsTests
//
//  Created by Marcio Habigzang Brufatto on 24/04/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

import XCTest
@testable import Events

class NetworkManagerTest: XCTestCase {
    
    var networkManager: NetworkManager!
    let session = MockURLSession()
    
    override func setUp() {
        super.setUp()
        networkManager = NetworkManager(session: session)
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testGetEvents() {
        guard let url = URL(string: "https://mockurl") else {
            fatalError("URL não poder ser vazia")
        }
        
        
    }

}