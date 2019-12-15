//
//  CircleAvatarView.swift
//  StarredGitRepositories
//
//  Created by Victor Oka on 15/12/19.
//  Copyright © 2019 Victor Oka. All rights reserved.
//

import SwiftUI

struct CircleAvatarView: View {
    
    @ObservedObject var imageLoader: ImageLoader = ImageLoader()
    var picturePath: String = ""
    
    var body: some View {
        VStack {
            if imageLoader.image != nil {
                Image(uiImage: self.imageLoader.image!)
                    .resizable()
                    .frame(width: 45.0, height: 45.0, alignment: .leading)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
            }
        }
        .onAppear {
            if let imageUrl = URL(string: self.picturePath) {
                self.imageLoader.downloadImage(url: imageUrl)
            }
        }
    }
}
