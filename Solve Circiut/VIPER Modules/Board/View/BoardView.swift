//
//  PlateView.swift
//  Solve Circuit
//
//  Created by MacBook Pro on 9.11.21.
//

import UIKit

protocol BoardViewDelegate {
    func createPoints() -> [[Point]]
    func getPointSize() -> CGSize
    func getDistanceBetweenPoints() -> Int
    func getResistors() -> [Resistor]
}

class BoardView: UIView {
    
    var delegate: BoardViewDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
        layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showPoints() {
        
        let pointSize: CGSize = delegate.getPointSize()
        let distance: Int = delegate.getDistanceBetweenPoints()
        let points = delegate.createPoints()
        
        for rowPoints in points {
            for point in rowPoints {
                point.bounds.size = pointSize
                point.center = CGPoint(x: (point.x + 1) * distance, y: (point.y + 1) * distance)
                self.addSubview(point)
            }
        }
    }
    
    func showResistors() {
        let distance: CGFloat = CGFloat(delegate.getDistanceBetweenPoints())
        let resistors = delegate.getResistors()
        
        for resistor in resistors {
            
            resistor.bounds.size = CGSize(width: 20, height: 60)
            resistor.center = CGPoint(x: resistor.leadingPin.x * distance, y: resistor.leadingPin.y * distance)
            self.addSubview(resistor)
        }
    }
    
}
