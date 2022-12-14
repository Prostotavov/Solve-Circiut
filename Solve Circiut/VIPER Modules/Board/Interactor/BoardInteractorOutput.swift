// 
//  BoardInteractorOutput.swift
//  Solve Circiut
//
//  Created by MacBook Pro on 30.11.21.
//

import UIKit

protocol BoardInteractorOutput: AnyObject {
    
    func createPoints() -> [[Point]]
    func getBoardContentSize() -> CGSize
    func getDevices() -> [DeviceButton]
    func add(_ selectedDevice: Devices, to location: CGPoint)
}
