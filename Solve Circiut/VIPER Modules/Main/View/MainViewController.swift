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
    
    var button = UIButton()
    let frame = CGRect(x: 100, y: 100, width: 100, height: 100)
    
    var mainView = MainView()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assembler.assembly(with: self)
        mainView.delegate = self
    }
    
    func showFormattedString(_ string: String) {
        button.setTitle(string, for: .normal)
    }
    
    func goToBoardView() {
        output.goToBoardView()
    }
}

