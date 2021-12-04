//
//  BoardEntity.swift
//  Solve Circiut
//
//  Created by MacBook Pro on 1.12.21.
//

import UIKit

protocol Point: UIImageView{
    var x: Int {set get}
    var y: Int {set get}
}

class PointImplementation: UIImageView, Point {
    var x: Int = 0
    var y: Int = 0
}

protocol Resistor: UIButton {
    
    var leadingPin: CGPoint {get set}
    var trailingPin: CGPoint {get set}
}

class ResistorImplementation: UIButton, Resistor {
    
    var leadingPin: CGPoint = CGPoint(x: 0, y: 0)
    var trailingPin: CGPoint = CGPoint(x: 0, y: 0)
    
    init(frame: CGRect, leadingPin: CGPoint) {
        super.init(frame: frame)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


