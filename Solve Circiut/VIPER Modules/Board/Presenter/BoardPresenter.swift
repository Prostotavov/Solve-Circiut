// 
//  BoardPresenter.swift
//  Solve Circiut
//
//  Created by MacBook Pro on 30.11.21.
//

import Foundation

class BoardPresenter: BoardViewOutput, BoardInteractorOutput {

    weak var view: BoardViewInput!
    var interactor: BoardInteractorInput!
    var router: BoardRouterInput!
    
}
