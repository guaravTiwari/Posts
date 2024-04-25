//
//  Post.swift
//  Posts
//
//  Created by Gaurav Tiwari on 25/04/24.
//

import Foundation

struct Post: Codable {
  let userId: Int
  let id: Int
  let title: String
  let body: String
}
