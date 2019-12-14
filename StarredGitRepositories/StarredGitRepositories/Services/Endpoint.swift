//
//  Endpoint.swift
//  StarredGitRepositories
//
//  Created by Victor Oka on 14/12/19.
//  Copyright © 2019 Victor Oka. All rights reserved.
//

import Foundation

struct Endpoint {
    
    let path: String
    let queryItems: [URLQueryItem]
    
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.github.com"
        components.path = path
        components.queryItems = queryItems
        return components.url
    }
    
    static func build() -> Endpoint {
        Endpoint(
            path: "/search/repositories",
            queryItems: [
                URLQueryItem(name: "q", value: "language:swift"),
                URLQueryItem(name: "sort", value: "stars")
        ])
    }
}
