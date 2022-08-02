//
//  AsyncAwaitViewController.swift
//  DataBindingMethods
//
//  Created by David Molina on 2/08/22.
//

import UIKit

class AsyncAwaitViewController: UIViewController {
    
    // MARK: - Internal Properties
    
    let viewModel: AsyncAwaitViewModel
    
    // MARK: - Initializers
    
    init(viewModel: AsyncAwaitViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle ViewController Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            await loadUsers()
        }

    }
    
    // MARK: - Internal Methods
    
    func loadUsers() async {
        guard let users = await viewModel.fetchUsers() else { return }
        print(users)
    }
    
    

}
