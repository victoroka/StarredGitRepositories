//
//  RepositoriesList.swift
//  StarredGitRepositories
//
//  Created by Victor Oka on 14/12/19.
//  Copyright © 2019 Victor Oka. All rights reserved.
//

import Foundation

class RepositoriesList: ObservableObject {
    
    @Published var list: RepositoryList = RepositoryList(repositories: [])
    @Published var isLoading: Bool = false
    
    var repositoriesService = RepositoriesService.shared
    
    func reload(for programmingLanguage: ProgrammingLanguage) {
        self.list = RepositoryList(repositories: [])
        self.isLoading = true
        
        repositoriesService.fetchRepositories(Endpoint.build(language: programmingLanguage.description, sort: "stars")) { [weak self] (result) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self?.isLoading = false
            }
            
            switch result {
            case .success(let repositories):
                DispatchQueue.main.async {
                    self?.list = repositories
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
