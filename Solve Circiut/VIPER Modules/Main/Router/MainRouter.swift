// 
//  MainRouter.swift
//  Solve Circiut
//
//  Created by MacBook Pro on 30.11.21.
//

import UIKit

class MainRouter: MainRouterInput {
    
    weak var view: UIViewController!
    
    func showOkAlert() {
        
        let alert = UIAlertController(title: "Hi", message: nil, preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(okButton)
        
        view.present(alert, animated: true, completion: nil)
    }
}
