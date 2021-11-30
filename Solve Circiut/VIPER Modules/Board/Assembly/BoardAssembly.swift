// 
//  BoardAssembly.swift
//  Solve Circiut
//
//  Created by MacBook Pro on 30.11.21.
//

import UIKit

class BoardAssembly: NSObject, BoardAssemblyProtocol {
    
    func assembly(with viewController: BoardViewController) {
        
        let presenter = BoardPresenter()
        let interactor = BoardInteractor()
        let router = BoardRouter()
        let dataManager = DataManagerImplementation()
        
        viewController.output = presenter
        
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.dataManager = dataManager
        interactor.output = presenter
        
        router.view = viewController
        
    }
    
}
