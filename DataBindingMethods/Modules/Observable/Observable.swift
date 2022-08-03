//
//  Observable.swift
//  DataBindingMethods
//
//  Created by David Molina on 2/08/22.
//

import Foundation

class Observable<T> {
    
    // MARK: - Internal Properties
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    // MARK: - Private Properties
    
    private var listener: ((T) -> Void)?
    
    // MARK: - Initializers
    
    init(_ value: T) {
        self.value = value
    }
    
    // MARK: - Internal Methods
    
    func bind(_ closure: @escaping (T) -> Void) {
        closure(value)
        listener = closure
    }
    
    
}
