//
//  SomeFile.swift
//  SomeLibrary
//
//  Created by Masaki Doi on 2023/09/29.
//

import Foundation

public func greeting() {
    print("Hello, world.")
}

public struct Person {
    private let name: String
    private var age: Int
    
    public func getName() -> String { name }
    
    public func getAge() -> Int { age }
    
    public init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
