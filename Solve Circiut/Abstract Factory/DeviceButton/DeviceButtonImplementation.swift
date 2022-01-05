//
//  DeviceButtonImplementation.swift
//  Solve Circiut
//
//  Created by MacBook Pro on 5.01.22.
//

import UIKit

class DeviceButtonImplementation: UIButton, DeviceButton {
    
    var name: String = ""
    var resistance: Float = 0
    var current: Float = 0
    var voltage: Float = 0
    var emf: Float = 0
    
    var leadingPin: CGPoint = CGPoint(x: 0, y: 0)
    var trailingPin: CGPoint = CGPoint(x: 0, y: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func printInfo() {
        
    }
    
}
