//
//  FunctionReturnViewModel.swift
//  DataBindingMethods
//
//  Created by David Molina on 2/08/22.
//

import Combine

class FunctionReturnViewModel {
    
    // MARK: - Internal Properties
    
    var users: [User]?
    
    // MARK: - Internal Methods
    
    func fetchUsers() -> AnyPublisher<[User], Never> {
        // Logic to fetch users from backend o local database
        
        let request: AnyPublisher<[User], Never> = Just<[User]>([]).map { [weak self] users -> [User] in
            self?.users = users
            return users
        }
        .eraseToAnyPublisher()
        
        return request
    }
    
}
