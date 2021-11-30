// 
//  BoardViewController.swift
//  Solve Circiut
//
//  Created by MacBook Pro on 30.11.21.
//

import UIKit

class BoardViewController: UIViewController, BoardViewInput {

    var output: BoardViewOutput!
    var assembler: BoardAssemblyProtocol = BoardAssembly()
    
    var boardScrollView = BoardScrollView()
    var boardView = BoardView()

    // эти константы должны быть равны константам из PlateView
    let distance = 30
    let pointsCount = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assembler.assembly(with: self)
        view.backgroundColor = UIColor.systemBlue
        boardScrollView = BoardScrollView(frame: self.view.bounds)
        
        view.addSubview(boardScrollView)
        setupImageScrollView()
        
        let size = CGFloat(distance * (pointsCount + 1))
        boardView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        self.boardScrollView.setPlateView(view: boardView)
        boardView.frame = CGRect(x: 0, y: 0, width: size, height: size)
        
        boardScrollView.contentSize = self.boardView.bounds.size
        
    }
    
    func setupImageScrollView() {
        boardScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        boardScrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        boardScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        boardScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        boardScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

}

