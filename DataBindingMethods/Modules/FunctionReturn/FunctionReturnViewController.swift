//
//  FunctionReturnViewController.swift
//  DataBindingMethods
//
//  Created by David Molina on 2/08/22.
//

import UIKit
import Combine

class FunctionReturnViewController: UIViewController {

    // MARK: - Internal Properties
    
    let viewModel: FunctionReturnViewModel
    
    var cancellables = Set<AnyCancellable>()
    
    // MARK: - Initializers
    
    init(viewModel: FunctionReturnViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle ViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchUsers().sink { complete in
            switch complete {
            case let .failure(error):
                print(error)
            default:
                break
            }
        } receiveValue: { users in
            // Do something with the users
            print(users)
        }.store(in: &cancellables)
    }

}
