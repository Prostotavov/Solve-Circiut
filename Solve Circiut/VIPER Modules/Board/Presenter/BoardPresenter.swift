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
    
    func getDevices() -> [ElectronicDevice] {
        interactor.getDevices()
    }
    
    func add(device: ElectronicDevices, to location: CGPoint) {
        interactor.add(device: device, to: location)
    }
    
}
