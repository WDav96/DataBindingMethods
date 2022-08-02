//
//  CompletionHandlerViewModel.swift
//  DataBindingMethods
//
//  Created by David Molina on 2/08/22.
//

import Foundation

class CompletionHandlerViewModel {
    
    // MARK: - Internal Properties
    
    var users: [User]?
    
    // MARK: - Internal Methods
    
    func loadUsers(completionHandler: @escaping () -> Void) {
        // Logic to fecth users from backend or local database
        
        let result: Result<[User], Error> = .success([])
        
        switch result {
        case let .success(users):
            self.users = users
            completionHandler()
        case let .failure(error):
            print(error.localizedDescription)
        }
        
    }
    
}
