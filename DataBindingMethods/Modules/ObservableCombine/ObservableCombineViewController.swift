//
//  ObservableCombineViewController.swift
//  DataBindingMethods
//
//  Created by David Molina on 2/08/22.
//

import UIKit
import Combine

class ObservableCombineViewController: UIViewController {
    
    // MARK: - Internal Properties
    
    let viewModel: ObservableCombineViewModel
    
    var cancellables = Set<AnyCancellable>()
    
    // MARK: - Initializers
    
    init(viewModel: ObservableCombineViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle ViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewLoaded()
        viewModel.users.sink { users in
            // Do something with the users
            print(users)
        }.store(in: &cancellables)
        
        viewModel.$usersPublished.sink { users in
            print(users)
        }.store(in: &cancellables)
    }

}
