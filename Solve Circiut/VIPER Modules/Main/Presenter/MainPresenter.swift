// 
//  MainPresenter.swift
//  Solve Circiut
//
//  Created by MacBook Pro on 30.11.21.
//

import Foundation

class MainPresenter: MainViewOutput, MainInteractorOutput {

    weak var view: MainViewInput!
    var interactor: MainInteractorInput!
    var router: MainRouterInput!
    
    //MARK: - View Output
    func didPressedAtcion() {
        interactor.obtainFormatterString()
    }
    
    func goToBoardView() {
        router.showBoardView()
    }
    
    //MARK: - Interactor Output
    func didFinishObtainingFormattedString(_ string: String) {
        
        view.showFormattedString(string)
        router.showOkAlert()
    }
}
