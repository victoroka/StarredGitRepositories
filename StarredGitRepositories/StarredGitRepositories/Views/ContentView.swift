//
//  ContentView.swift
//  StarredGitRepositories
//
//  Created by Victor Oka on 14/12/19.
//  Copyright © 2019 Victor Oka. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var service = RepositoriesService.shared
    
    var body: some View {
        Button(action: {
            self.service.fetchRepositories(URLRequest(url: URL(string: "https://api.github.com/search/repositories?q=language:swift&sort=stars")!)) { (result) in
                print(result)
            }
        }) {
            Text("Request")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
