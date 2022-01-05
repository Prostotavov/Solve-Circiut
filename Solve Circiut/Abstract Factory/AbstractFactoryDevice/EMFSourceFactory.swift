//
//  EMFSourceFactory.swift
//  Solve Circiut
//
//  Created by MacBook Pro on 5.01.22.
//

import Foundation

class EMFSourceFactory: AbstractFactoryDevices {
    
    static let defaultFactory = EMFSourceFactory()
    
    func createDeviceButton() -> DeviceButton {
        return EMFSourceButton()
    }
    
    func createDeviceImageView() -> DeviceImageView {
        return EMFSourceImageView()
    }
}
