// 
//  BoardViewInput.swift
//  Solve Circiut
//
//  Created by MacBook Pro on 30.11.21.
//

import UIKit

protocol BoardViewInput: AnyObject {
    
    func createPoints() -> [[Point]]
    func setBoardView()
    func getResistors() -> [Resistor]
    func addResistor()
    func addResistorIn(location: CGPoint)
    
    func setupImageScrollViewConstraints()
    func setupDevicesViewConstraints()
}
