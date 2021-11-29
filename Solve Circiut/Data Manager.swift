//
//  DataManager.swift
//  Solve Circiut
//
//  Created by MacBook Pro on 30.11.21.
//

import Foundation

protocol DataManager {
    func obtainNumbers() -> [Int]
}

class DataManagerImplementation: DataManager {
    
    func obtainNumbers() -> [Int] {
        
        return [1,2,3,4,5]
    }
}
