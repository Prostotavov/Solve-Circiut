//
//  MainView.swift
//  Solve Circiut
//
//  Created by MacBook Pro on 30.11.21.
//

import UIKit

protocol MainViewDelegate {
    func goToBoardView()
}

class MainView: UIView {
    
    let buttonHeight: CGFloat = 50
    let buttonWidth: CGFloat = 100
    
    var goToBoardButton = UIButton()
    var delegate: MainViewDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setGoToBoardButton()
        goToBoardButton.addTarget(self, action: #selector(goToBoardView), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setGoToBoardButton() {
        
        self.addSubview(goToBoardButton)
        
        goToBoardButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            goToBoardButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            goToBoardButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100),
            goToBoardButton.heightAnchor.constraint(equalToConstant: buttonHeight),
            goToBoardButton.widthAnchor.constraint(equalToConstant: buttonWidth)
        ])
        
        goToBoardButton.backgroundColor = .systemBlue
        goToBoardButton.setTitle("Go To Board", for: .normal)
    }
    
    @objc func goToBoardView() {
        delegate.goToBoardView()
    }
}
