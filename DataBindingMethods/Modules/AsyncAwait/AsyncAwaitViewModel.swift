//
//  AsyncAwaitViewModel.swift
//  DataBindingMethods
//
//  Created by David Molina on 2/08/22.
//

import Foundation

class AsyncAwaitViewModel {
    
    // MARK: - Internal Properties
    
    var users: [User]?
    
    // MARK: - Internal Methods
    
    func fetchUsers() async -> [User]? {
        // Logic to fetch users from backend o local database
        
        
        //let users = await userRepository.fetchUsers()
        let users = [User(name: "David", age: 25), User(name: "Wilson", age: 57)]
        
        return users
        
    }
    
}
