//
//  ObservableViewController.swift
//  DataBindingMethods
//
//  Created by David Molina on 2/08/22.
//

import Foundation
import UIKit

class ObservableViewController: UIViewController {
    
    // MARK: - Internal Properties
    
    let viewModel: ObservableViewModel
    
    // MARK: - Initializers
    
    init(viewModel: ObservableViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle ViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.users.bind { _ in
            // Do something with the users
            // self.showTableView
        }
    }
}
