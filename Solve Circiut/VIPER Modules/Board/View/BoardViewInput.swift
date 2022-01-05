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
    func getDevices() -> [DeviceButton]
    func add(_ selectedDevice: Devices, to location: CGPoint)
    
    func setupImageScrollViewConstraints()
    func setupDevicesBarViewConstraints()
}
