//
//  AbstractFactoryElectronicDevices.swift
//  Solve Circiut
//
//  Created by MacBook Pro on 25.12.21.
//

import UIKit

protocol AbstractFactoryDevices {
    
    func createDeviceButton() -> DeviceButton
    func createDeviceImageView() -> DeviceImageView
}

