// 
//  BoardViewController.swift
//  Solve Circiut
//
//  Created by MacBook Pro on 30.11.21.
//

import UIKit

class BoardViewController: UIViewController, BoardViewInput, BoardViewDelegate {

    var output: BoardViewOutput!
    var assembler: BoardAssemblyProtocol = BoardAssembly()
    
    var boardScrollView = BoardScrollView()
    var boardView = BoardView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBlue
        assembler.assembly(with: self)
        boardView.delegate = self
        setBoardView()
        
    }

    func setBoardView() {
        let boardViewContentSize: CGSize = output.getBoardContentSize()
        let origin: CGPoint = CGPoint(x: 0, y: 0)
        boardView.showPoints()
        
        boardScrollView = BoardScrollView(frame: view.bounds)
        view.addSubview(boardScrollView)
        setupImageScrollView()
        
        boardView.frame = CGRect(origin: origin, size: view.bounds.size)
        boardScrollView.setBoardView(view: boardView)
        
        boardView.bounds.size = boardViewContentSize
        boardScrollView.contentSize = boardViewContentSize
    }
    
    func setupImageScrollView() {
        
        boardScrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            boardScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            boardScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            boardScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            boardScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

}

// extension for delegate functions
extension BoardViewController {
    
    func createPoints() -> [[PointProtocol]] {
        return output.createPoints()
    }
    
    func getPointSize() -> CGSize {
        output.getPointSize()
    }
    
    func getDistance() -> Int {
        output.getDistance()
    }
}
