//
//  PostDetailsViewController.swift
//  Posts
//
//  Created by Gaurav Tiwari on 25/04/24.
//

import UIKit

final class PostDetailsViewController: UIViewController {
  
  var viewModel: PostDetailsViewModel?
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var bodyLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.title = viewModel?.navigationTitle
    titleLabel.text = viewModel?.title
    bodyLabel.text = viewModel?.body
  }
}
