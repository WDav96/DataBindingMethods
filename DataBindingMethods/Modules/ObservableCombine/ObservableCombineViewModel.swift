//
//  ObservableCombineViewModel.swift
//  DataBindingMethods
//
//  Created by David Molina on 2/08/22.
//

import Combine
import Foundation

class ObservableCombineViewModel {
    
    // MARK: - Internal Properties
    
    var users = CurrentValueSubject<[User], Never>([])
    @Published var usersPublished: [User] = []
    
    // MARK: - Internal Methods
    
    func viewLoaded() {
        // Logic to fetch users from backend o local database
        
        let result: Result<[User], Error> = .success([])
        
        switch result {
        case let .success(users):
            self.users.send(users)
            self.usersPublished = users
        case let .failure(error):
            print(error.localizedDescription)
        }
    }
    
}
