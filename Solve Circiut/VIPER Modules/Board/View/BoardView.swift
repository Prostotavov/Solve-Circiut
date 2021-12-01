//
//  PlateView.swift
//  Plate
//
//  Created by MacBook Pro on 9.11.21.
//

import UIKit

protocol BoardViewDelegate {
    func createPoints() -> [[Point]]
    func getPointSize() -> CGSize
    func getDistance() -> Int
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
        let distance: Int = delegate.getDistance()
        let points = delegate.createPoints()
        for linePoints in points {
            for point in linePoints {
                point.bounds.size = pointSize
                point.center = CGPoint(x: (point.x + 1) * distance, y: (point.y + 1) * distance)
                self.addSubview(point)
            }
        }
    }
    
}

