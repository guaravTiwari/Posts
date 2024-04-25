//
//  PostDetailsViewModel.swift
//  Posts
//
//  Created by Gaurav Tiwari on 26/04/24.
//

import Foundation

final class PostDetailsViewModel: PostDetailsViewModelProtocol {
  
  let post: Post
  
  init(post: Post) {
    self.post = post
  }
  
  var navigationTitle: String {
    "ID: " + String(post.id)
  }
  
  var title: String {
    post.title
  }
  
  var body: String {
    post.body
  }
}
