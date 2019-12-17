//
//  RepositoriesServiceTests.swift
//  StarredGitRepositoriesTests
//
//  Created by Victor Oka on 16/12/19.
//  Copyright © 2019 Victor Oka. All rights reserved.
//

import XCTest
import Quick
import Nimble

@testable import StarredGitRepositories

class RepositoriesServiceTests: QuickSpec {

    var service: RepositoriesService = RepositoriesService()
    
    override func spec() {
        super.spec()
        describe("A network response code") {
            context("Given the response status code") {
                it("It should return the correct network error type") {
                    expect(self.service.getErrorDescription(for: 401)).to(equal(.unauthorized))
                    expect(self.service.getErrorDescription(for: 403)).to(equal(.forbidden))
                    expect(self.service.getErrorDescription(for: 404)).to(equal(.notFound))
                    expect(self.service.getErrorDescription(for: 405)).to(equal(.unknownError))
                }
            }
        }
    }
}
