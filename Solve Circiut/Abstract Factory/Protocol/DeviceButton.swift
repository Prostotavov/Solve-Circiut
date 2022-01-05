//
//  ElectronicDeviceButton.swift
//  Solve Circiut
//
//  Created by MacBook Pro on 5.01.22.
//

import UIKit

protocol DeviceButton: UIButton {
    
    var name: String {get set}
    var resistance: Float {get set}
    var current: Float {get set}
    var voltage: Float {get set}
    var emf: Float {get set}
    
    var leadingPin: CGPoint {get set}
    var trailingPin: CGPoint {get set}
    
    func printInfo()
}
