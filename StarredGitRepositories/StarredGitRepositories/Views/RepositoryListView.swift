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
                List(self.repositoriesList.list.repositories ?? []) { repository in
                    RepositoryRowView(repository: repository)
                }
            }
            .navigationBarTitle("Swift")
        }
        .onAppear {
            UITableView.appearance().separatorStyle = .none
            self.repositoriesList.reload()
        }
    }
}

struct RepositoryListView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryListView()
    }
}
