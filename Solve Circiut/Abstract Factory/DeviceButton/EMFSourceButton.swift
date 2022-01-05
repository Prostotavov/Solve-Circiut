//
//  EMFSourceButton.swift
//  Solve Circiut
//
//  Created by MacBook Pro on 5.01.22.
//

import UIKit

class EMFSourceButton: DeviceButtonImplementation {
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        name = ""
        resistance = 0
        current = 0
        voltage = 0
    }
    
    init(device: DeviceButton){
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        name = device.name
        emf = device.emf
        resistance = device.resistance
        current = device.current
        voltage = device.voltage
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func printInfo() {
        print("EMF sourse \(name) has: R = \(resistance)")
        print("I = \(current), V = \(voltage)")
        print("E = \(emf)")
        
    }
}
