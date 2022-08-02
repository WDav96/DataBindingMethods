//
//  CompletionHandlerViewController.swift
//  DataBindingMethods
//
//  Created by David Molina on 2/08/22.
//

import UIKit

class CompletionHandlerViewController: UIViewController {
    
    // MARK: - Internal Properties
    
    let viewModel: CompletionHandlerViewModel
    
    // MARK: - Initializers
    
    init(viewModel: CompletionHandlerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle ViewController Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }
    
    // MARK: - Private Methods
    
    private func setupBindings() {
        viewModel.loadUsers {
            guard let users = self.viewModel.users else { return }
            print(users)
        }
        
    }


}
