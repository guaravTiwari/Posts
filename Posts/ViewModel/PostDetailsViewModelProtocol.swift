//
//  PostDetailsViewModelProtocol.swift
//  Posts
//
//  Created by Gaurav Tiwari on 26/04/24.
//

import Foundation

protocol PostDetailsViewModelProtocol {
  var navigationTitle: String { get }
  var title: String { get }
  var body: String { get }
}
