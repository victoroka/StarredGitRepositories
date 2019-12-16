//
//  ProgrammingLanguage.swift
//  StarredGitRepositories
//
//  Created by Victor Oka on 15/12/19.
//  Copyright © 2019 Victor Oka. All rights reserved.
//

import Foundation

enum ProgrammingLanguage: CaseIterable, CustomStringConvertible {
    
    case swift
    case kotlin
    case python
    
    var description: String {
        switch self {
        case .swift:
            return "swift"
        case .kotlin:
            return "kotlin"
        case .python:
            return "python"
        }
    }
    
    var name: String {
        switch self {
        case .swift:
            return "Swift"
        case .kotlin:
            return "Kotlin"
        case .python:
            return "Python"
        }
    }
    
}
