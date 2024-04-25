//
//  PostsViewModelProtocol.swift
//  Posts
//
//  Created by Gaurav Tiwari on 25/04/24.
//

import Foundation
import Combine

protocol PostsViewModelProtocol {
  
  var posts: CurrentValueSubject<[Post], Never> { get }
  
  func fetchPosts()
}
