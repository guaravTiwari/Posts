//
//  PostService.swift
//  Posts
//
//  Created by Gaurav Tiwari on 25/04/24.
//

import Foundation
import Combine

struct PostService: PostServiceProtocol {
  
  private var postsURL: URL? {
    URL(string: "https://jsonplaceholder.typicode.com/posts")
  }
  
  func fetchPosts(start: Int, limit: Int) -> AnyPublisher<[Post], Error> {
    guard let url = postsURL,
          var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else { 
      return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
    }
    
    components.queryItems = [
      URLQueryItem(name: "_start", value: "\(start)"),
      URLQueryItem(name: "_limit", value: "\(limit)")
    ]
    
    guard let url = components.url else {
      return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
    }
    
    return URLSession.shared.dataTaskPublisher(for: url)
      .map(\.data)
      .decode(type: [Post].self, decoder: JSONDecoder())
      .eraseToAnyPublisher()
  }
}
