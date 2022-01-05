//
//  DevicesDataManager.swift
//  Solve Circiut
//
//  Created by MacBook Pro on 13.12.21.
//

import UIKit

protocol DevicesDataManager {
    
    var devices: [DeviceButton] {get}
    var devicesCount: Int {get}
    
    func add(device: DeviceButton)
}

class DevicesDataManagerImplementation: DevicesDataManager {
    
    var devices: [DeviceButton] = [DeviceButton]()
    var devicesCount: Int = 0
    
    func add(device: DeviceButton) {
        devicesCount += 1
        devices.append(device)
    }
}
