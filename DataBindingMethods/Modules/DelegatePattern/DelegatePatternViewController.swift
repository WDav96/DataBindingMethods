//
//  ViewController.swift
//  DataBindingMethods
//
//  Created by David Molina on 27/07/22.
//

import UIKit

class DelegatePatternViewController: UIViewController {
    
    // MARK: - Internal Properties
    
    let viewModel: DelegatePatternViewModel
    
    // MARK: - Initializers
    
    init(viewModel: DelegatePatternViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle ViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        viewModel.delegate = self
        viewModel.viewLoaded()
    }

}

extension DelegatePatternViewController: MainViewModelDelegate {
    func fetchData(data: [User]) {
        print(data)
    }
    
    func fetchData(data: Result<[User], Error>) {
        // Do something with the data
    }
    
}

