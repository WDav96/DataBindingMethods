//
//  EventBusesViewController.swift
//  DataBindingMethods
//
//  Created by David Molina on 2/08/22.
//

import UIKit
import SwiftEventBus

class EventBusViewController: UIViewController {
    
    // MARK: - Internal Properties
    
    var viewModel: EventBusViewModel
    
    // MARK: - Initializers
    
    init(viewModel: EventBusViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle ViewController Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        setupEventBusSubscriber()
    }
    
    // MARK: - Internal Methods
    
    func setupEventBusSubscriber() {
        _ = SwiftEventBus.onMainThread(self, name: "fetchUsers") { result in
            if let event = result!.object as? UsersEvent {
                if event.users != nil {
                    // Do something with the users
                } else if let message = event.errorMessage {
                    print(message)
                }
            }
        }
    }
    

}
