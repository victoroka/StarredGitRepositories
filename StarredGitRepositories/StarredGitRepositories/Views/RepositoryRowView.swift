//
//  RepositoryRowView.swift
//  StarredGitRepositories
//
//  Created by Victor Oka on 14/12/19.
//  Copyright © 2019 Victor Oka. All rights reserved.
//

import SwiftUI

struct RepositoryRowView: View {
    
    var repository: Repository
    
    var body: some View {
        VStack {
            HStack {
                CircleAvatarView(picturePath: repository.owner.picture).padding(.trailing)
                VStack(alignment: .leading) {
                    Text("Swift")
                        .font(.custom("Avenir", size: 14))
                        .foregroundColor(.secondary)
                    Text(repository.name)
                        .font(.custom("Avenir", size: 22))
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .fixedSize(horizontal: false, vertical: true)
                    Text("by \(repository.owner.name)".uppercased())
                        .font(.custom("Avenir", size: 12))
                        .foregroundColor(.secondary)
                }
                .layoutPriority(100)
                Spacer()
                VStack(alignment: .trailing) {
                    Text(self.formatNumberOfStars(repository.numberOfStars))
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 20.0, height: 20.0)
                        .foregroundColor(.yellow)
                }
                .padding(.leading)
                .fixedSize()
            }
            .padding()
        }
        .cornerRadius(10)
        .padding([.top, .horizontal])
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 200/255, green: 200/255, blue: 200/255, opacity: 1), lineWidth: 1)
        )
    }
    
    private func formatNumberOfStars(_ numberOfStars: Int) -> String {
        if numberOfStars > 1000 {
            return "\(Int(numberOfStars/1000))K"
        } else {
            return "\(numberOfStars)"
        }
    }
}
