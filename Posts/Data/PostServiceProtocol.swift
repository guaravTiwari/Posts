//
//  PostServiceProtocol.swift
//  Posts
//
//  Created by Gaurav Tiwari on 25/04/24.
//

import Foundation
import Combine

protocol PostServiceProtocol {
  func fetchPosts(start: Int, limit: Int) -> AnyPublisher<[Post], Error>
}
