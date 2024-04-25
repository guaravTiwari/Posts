//
//  PostsViewModel.swift
//  Posts
//
//  Created by Gaurav Tiwari on 25/04/24.
//

import Foundation
import Combine

final class PostsViewModel: PostsViewModelProtocol {
  
  private let postsService: PostServiceProtocol
  private var cancellables = Set<AnyCancellable>()
  private let limit = 20
  var posts = CurrentValueSubject<[Post], Never>([])
  
  init(postsService: PostServiceProtocol) {
    self.postsService = postsService
  }
  
  func fetchPosts() {
    postsService.fetchPosts(start: posts.value.count, limit: limit)
      .sink { completion in
        // Handle completion if needed
      } receiveValue: { [weak self] fetchedPosts in
        self?.posts.value.append(contentsOf: fetchedPosts)
      }
      .store(in: &cancellables)
  }
}
