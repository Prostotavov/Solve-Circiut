// 
//  BoardPresenter.swift
//  Solve Circiut
//
//  Created by MacBook Pro on 30.11.21.
//

import UIKit

class BoardPresenter: BoardViewOutput, BoardInteractorOutput {

    weak var view: BoardViewInput!
    var interactor: BoardInteractorInput!
    var router: BoardRouterInput!
    
    func createPoints() -> [[Point]] {
        interactor.createPoints()
    }
    
    func getBoardContentSize() -> CGSize {
        interactor.getBoardContentSize()
    }
    
    func getPointSize() -> CGSize {
        interactor.getPointSize()
    }
    
    func getDistanceBetweenPoints() -> Int {
        interactor.getDistanceBetweenPoints()
    }
    
    func getResistors() -> [Resistor] {
        interactor.getResistors()
    }
    
    func addResistor() {
        interactor.addResistor()
    }
    
    func addResistorIn(location: CGPoint) {
        interactor.addResistorIn(location: location)
    }
    
}
