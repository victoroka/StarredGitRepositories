//
//  NetworkErrors.swift
//  StarredGitRepositories
//
//  Created by Victor Oka on 14/12/19.
//  Copyright © 2019 Victor Oka. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case notFound
    case forbidden
    case unauthorized
    case badUrl
    case mappingError
    case emptyResponseDataError
    case unknownError
}
