//
//  MainViewModel.swift
//  DataBindingMethods
//
//  Created by David Molina on 27/07/22.
//

import Foundation

protocol MainViewModelDelegate: AnyObject {
    //func fetchData(data: Result<[User], Error>)
    func fetchData(data: [User])
}

class DelegatePatternViewModel {
    
    // MARK: - Internal Properties
    
    weak var delegate: MainViewModelDelegate?
    
    var users: [User]?
    
    // MARK: - Internal Methods
    
    func viewLoaded() {
        //let users: Result<[User], Error> = .success([])
        
        let users = [User(name: "David", age: 25), User(name: "Wilson", age: 57)]
        
        delegate?.fetchData(data: users)
    }
    
}
