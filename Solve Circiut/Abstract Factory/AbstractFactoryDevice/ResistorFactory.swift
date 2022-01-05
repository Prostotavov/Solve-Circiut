//
//  ResistorFactory.swift
//  Solve Circiut
//
//  Created by MacBook Pro on 5.01.22.
//

import Foundation

class ResistorFactory: AbstractFactoryDevices {
    
    static let defaultFactory = ResistorFactory()
    
    func createDeviceButton() -> DeviceButton {
        return ResistorButton()
    }
    
    func createDeviceImageView() -> DeviceImageView {
        return ResistorImageView()
    }
    
}
