//
//  DevicesDataManager.swift
//  Solve Circiut
//
//  Created by MacBook Pro on 13.12.21.
//

import UIKit

protocol DevicesDataManager {
    
    var devices: [ElectronicDevice] {get}
    var devicesCount: Int {get}
    
    func add(device: ElectronicDevice)
}

class DevicesDataManagerImplementation: DevicesDataManager {
    
    var devices: [ElectronicDevice] = [ElectronicDevice]()
    var devicesCount: Int = 0
    
    func add(device: ElectronicDevice) {
        devicesCount += 1
        devices.append(device)
    }
}
