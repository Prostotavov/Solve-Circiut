// 
//  MainAssembly.swift
//  Solve Circiut
//
//  Created by MacBook Pro on 30.11.21.
//

import UIKit

class MainAssembly: NSObject {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let view = MainViewController()
        let presenter = MainPresenter()
        let interactor = MainInteractor()
        let router = MainRouter()
        let dataManager = DataManagerImplementation()
        
        view.output = presenter
        
        presenter.view = view as? MainViewInput
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.dataManager = dataManager
        interactor.output = presenter
        
        router.view = view
        
    }
    
}
