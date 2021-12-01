// 
//  MainRouter.swift
//  Solve Circiut
//
//  Created by MacBook Pro on 30.11.21.
//

import UIKit

class MainRouter: MainRouterInput {
    
    weak var view: UIViewController!
    
    func showBoardView() {
        let boardVC = BoardViewController()
        boardVC.modalPresentationStyle = .fullScreen
        view.present(boardVC, animated: true)
    }
}
