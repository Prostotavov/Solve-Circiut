import Foundation
import UIKit

enum ElectronicDevices: String, CaseIterable {
    case resistor
    case emfSourse
}


class FactoryElectronicDevices {
    static let defaultFactory = FactoryElectronicDevices()
    
    func createElectronicDevice(selectedDevice: ElectronicDevices,
                                device: ElectronicDevice) -> ElectronicDevice {
        switch selectedDevice {
        case .resistor: return Resistor(device: device)
        case .emfSourse: return EMFSource(device: device)
        }
    }
}





