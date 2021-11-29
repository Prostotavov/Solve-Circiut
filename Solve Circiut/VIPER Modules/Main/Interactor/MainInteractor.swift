// 
//  MainInteractor.swift
//  Solve Circiut
//
//  Created by MacBook Pro on 30.11.21.
//

import Foundation

class MainInteractor: MainInteractorInput {
    
    weak var output: MainInteractorOutput!
    var dataManager: DataManager!
    
    func obtainFormatterString() {
        
        let numbers = dataManager.obtainNumbers()
        let numbersStrnig = numbers.map({"\($0)"}).joined(separator: ",")
        output.didFinishObtainingFormattedString(numbersStrnig)
    }
    
}
