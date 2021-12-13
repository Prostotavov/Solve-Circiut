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
    func getDevices() -> [ElectronicDevice]
    func add(device: ElectronicDevices, to location: CGPoint)
    
    func setupImageScrollViewConstraints()
    func setupDevicesBarViewConstraints()
}
