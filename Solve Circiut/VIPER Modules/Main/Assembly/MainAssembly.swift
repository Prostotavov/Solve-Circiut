// 
//  MainAssembly.swift
//  Solve Circiut
//
//  Created by MacBook Pro on 30.11.21.
//

import UIKit

class MainAssembly: NSObject, MainAssemblyProtocol {
    
    func assembly(with viewController: MainViewController) {
        
        let presenter = MainPresenter()
        let interactor = MainInteractor()
        let router = MainRouter()
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
