//
//  ObservableViewModel.swift
//  DataBindingMethods
//
//  Created by David Molina on 2/08/22.
//

import Foundation

protocol ObservableViewModelProtocol {
    var users: Observable<[User]> { get set }
    var errorMessage: Observable<String?> { get set }
    var error: Observable<Bool> { get set }
    func fetchUsers()
    func setError(_ message: String)
}

class ObservableViewModel: ObservableViewModelProtocol {
    
    // MARK: - Internal Properties
    
    var manager: APIManager?
    
    // MARK: - Internal Observable Properties
    
    var users: Observable<[User]> = Observable([])
    
    var errorMessage: Observable<String?> = Observable(nil)
    
    var error: Observable<Bool> = Observable(false)
    
    // MARK: - Initializers
    
    init(manager: APIManager) {
        self.manager = manager
    }
    
    // MARK: - Internal Methods
    
    func fetchUsers() {
        self.manager!.fetchUsers { (result: Result<[User], Error>) in
            switch result {
            case .success(let users):
                self.users = Observable(users)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func setError(_ message: String) {
        self.errorMessage = Observable(message)
        self.error = Observable(true)
    }
    
    
}
