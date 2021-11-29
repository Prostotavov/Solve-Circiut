// 
//  MainViewController.swift
//  Solve Circiut
//
//  Created by MacBook Pro on 30.11.21.
//

import UIKit

class MainViewController: UIViewController, MainViewInput {

    var output: MainViewOutput!
    let assembler: MainAssemblyProtocol = MainAssembly()
    
    var button = UIButton()
    let frame = CGRect(x: 100, y: 100, width: 100, height: 100)
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setButton()
        assembler.assembly(with: self)
        view.backgroundColor = .brown
        print("-0-")
        
    }
    
    func setButton() {
        self.view.addSubview(button)
        button.frame = frame
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.setTitle("Press Me", for: .normal)
        button.backgroundColor = .systemBlue
    }
    
    func showFormattedString(_ string: String) {
        button.setTitle(string, for: .normal)
    }
    
    @objc func buttonPressed() {
        output.didPressedAtcion()
    }
}

