//
//  AbstractFactoryElectronicDevices.swift
//  Solve Circiut
//
//  Created by MacBook Pro on 25.12.21.
//

import UIKit

enum Devices: String, CaseIterable {
    case resistor
    case EMFSource
}

protocol AbstractFactoryDevices {
        
    func createDeviceButton() -> DeviceButton
    func createDeviceImageView() -> DeviceImageView
}

