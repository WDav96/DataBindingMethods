//
//  EventBusViewModel.swift
//  DataBindingMethods
//
//  Created by David Molina on 2/08/22.
//

import Foundation
import SwiftEventBus

protocol EventBusModelProtocol {
    var users: [User] { get  set }
    var errorMessage: String? { get set }
    var error: Bool { get set }
    func fetchUsers()
    func setError(_ message: String)
}

class EventBusViewModel: EventBusModelProtocol {
    
    // MARK: - Internal Properties
    
    var manager: APIManager?
    
    // MARK: - Internal Observable Properties
    
    var users: [User] = []
    
    var errorMessage: String?
    
    var error: Bool = false
    
    // MARK: - Initializers
    
    init(manager: APIManager) {
        self.manager = manager
    }
    
    // MARK: - Internal Methods
    
    func fetchUsers() {
        self.manager!.fetchUsers { (result: Result<[User], Error>) in
            switch result {
            case .success(let users):
                self.users = users
                self.callEvent()
            case .failure(let error):
                print(error.localizedDescription)
                self.callEvent()
            }
        }
    }
    
    func setError(_ message: String) {
        self.errorMessage = message
        self.error = true
    }
    
    func callEvent() {
        SwiftEventBus.post("fetchUsers", sender: UsersEvent(error: error, errorMessage: errorMessage, users: users))
    }
    
}
