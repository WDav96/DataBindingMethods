//
//  UsersEvent.swift
//  DataBindingMethods
//
//  Created by David Molina on 2/08/22.
//

import Foundation

class UsersEvent: NSObject {
    
    // MARK: - Internal Properties
    
    var error: Bool
    var errorMessage: String?
    var users: [User]?
    
    // MARK: - Initializers
    
    init(error: Bool, errorMessage: String? = nil, users: [User]? = nil) {
        self.error = error
        self.errorMessage = errorMessage
        self.users = users
    }
    
}
 
