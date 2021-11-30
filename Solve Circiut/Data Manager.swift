//
//  DataManager.swift
//  Solve Circiut
//
//  Created by MacBook Pro on 30.11.21.
//

import UIKit

protocol DataManager {
    func obtainNumbers() -> [Int]
}

class DataManagerImplementation: DataManager {
    
    func obtainNumbers() -> [Int] {
        
        return [1,2,3,4,5]
    }
}

class Point: UIImageView {
    
    var x = 0
    var y = 0
}
