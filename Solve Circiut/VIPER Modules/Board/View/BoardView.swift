//
//  PlateView.swift
//  Plate
//
//  Created by MacBook Pro on 9.11.21.
//

import UIKit

class BoardView: UIView {
    
    // -MARK: constants
    let pointSize = 5
    let distance = 30
    let image = UIImage(systemName: "seal")
    let pointsCount = 50
    
    var points = [[Point]]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
        createPoints()
        layer.masksToBounds = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createPoints() {
        
        for x in 0..<pointsCount {
            
            var linePoints = [Point]()
            
            for y in 0..<pointsCount {

                let point = Point()
                point.image = image
                
                point.bounds.size = CGSize(width: pointSize, height: pointSize)
                point.center = CGPoint(x: (x + 1) * distance, y: (y + 1) * distance)
                
                self.addSubview(point)
                
                point.x = x
                point.y = y
                
                linePoints.append(point)
            }
            points.append(linePoints)
        }
    }
    
}

