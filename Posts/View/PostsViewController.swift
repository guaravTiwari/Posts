//
//  PostsViewController.swift
//  Posts
//
//  Created by Gaurav Tiwari on 25/04/24.
//

import UIKit
import Combine

final class PostsViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  //NOTE: - We can set it as a dependency for Tesatbility, but thats not required right now.
  private let viewModel: PostsViewModelProtocol = PostsViewModel(postsService: PostService())
  private var cancellables = Set<AnyCancellable>()

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.rowHeight = UITableView.automaticDimension
    bindViewModel()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    viewModel.fetchPosts()
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == PostDetailsViewController.identifier {
      if let postDetailsVC = segue.destination as? PostDetailsViewController,
         let selectedPost = sender as? Post {
        postDetailsVC.viewModel = PostDetailsViewModel(post: selectedPost)
      }
    }
  }
}

//MARK: - Private Members
private extension PostsViewController {
  func bindViewModel() {
    viewModel.posts
      .receive(on: DispatchQueue.main)
      .sink { [weak self] _ in
        self?.tableView.reloadData()
      }
      .store(in: &cancellables)
  }
}

//MARK: - TableView Methods
extension PostsViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.posts.value.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath)
    let post = viewModel.posts.value[indexPath.row]
    cell.textLabel?.text = "ID: \(post.id)"
    cell.detailTextLabel?.text = post.title
    return cell
  }
  
  func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    guard indexPath.row == tableView.numberOfRows(inSection: 0) - 8 else { return } 
    viewModel.fetchPosts()
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let selectedPost = viewModel.posts.value[indexPath.row]
    performSegue(
      withIdentifier: PostDetailsViewController.identifier,
      sender: selectedPost
    )
  }
}
