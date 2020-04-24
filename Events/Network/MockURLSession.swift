//
//  MockURLSession.swift
//  Events
//
//  Created by Marcio Habigzang Brufatto on 24/04/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

import Foundation

class MockURLSession {
    private (set) var lastURL: URL?
    func dataTask(with request: NSURLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTask {
        lastURL = request.url
        completionHandler(nextData, successHttpURLResponse(request: request), nextError)
        return // dataTask, will be impletmented later
    }
}
