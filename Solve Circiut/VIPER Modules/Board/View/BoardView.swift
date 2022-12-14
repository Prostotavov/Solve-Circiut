//
//  PlateView.swift
//  Solve Circuit
//
//  Created by MacBook Pro on 9.11.21.
//

import UIKit

protocol BoardViewDelegate {
    func createPoints() -> [[Point]]
    func getDevices() -> [DeviceButton]
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
        
        let distance: Int = Int(BoardDataManagerImplementation.distanceBetweenPoints)
        let points = delegate.createPoints()
        
        for rowPoints in points {
            for point in rowPoints {
                point.center = CGPoint(x: (point.x + 1) * distance, y: (point.y + 1) * distance)
                self.addSubview(point)
            }
        }
    }
    
    func showDevices() {
        let distance: CGFloat = BoardDataManagerImplementation.distanceBetweenPoints
        let devices = delegate.getDevices()
        
        for device in devices {
            
            let x = (device.leadingPin.x + 1) * distance - device.bounds.width/2
            let y = (device.leadingPin.y + 1) * distance
            device.frame.origin = CGPoint(x: x, y: y)
            self.addSubview(device)
        }
    }
    
}
