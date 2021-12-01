// 
//  MainViewController.swift
//  Solve Circiut
//
//  Created by MacBook Pro on 30.11.21.
//

import UIKit

class MainViewController: UIViewController, MainViewInput, MainViewDelegate {

    var output: MainViewOutput!
    let assembler: MainAssemblyProtocol = MainAssembly()
    
    var mainView = MainView()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assembler.assembly(with: self)
        mainView.delegate = self
    }
    
    func goToBoardView() {
        output.goToBoardView()
    }
}

