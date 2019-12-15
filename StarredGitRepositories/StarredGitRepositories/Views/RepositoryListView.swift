//
//  RepositoryListView.swift
//  StarredGitRepositories
//
//  Created by Victor Oka on 14/12/19.
//  Copyright © 2019 Victor Oka. All rights reserved.
//

import SwiftUI

struct RepositoryListView: View {
    
    @ObservedObject var repositoriesList = RepositoriesList()
    
    var body: some View {
        NavigationView {
            Group {
                if repositoriesList.isLoading {
                    LoadingView()
                } else {
                    List(self.repositoriesList.list.repositories ?? []) { repository in
                        RepositoryRowView(repository: repository)
                    }
                }
            }
            .navigationBarTitle("Git Repositories")
        }
        .onAppear {
            UITableView.appearance().separatorStyle = .none
            if let repos = self.repositoriesList.list.repositories {
                if repos.isEmpty {
                    self.repositoriesList.reload()
                }
            }
        }
    }
}

struct RepositoryListView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryListView()
    }
}
