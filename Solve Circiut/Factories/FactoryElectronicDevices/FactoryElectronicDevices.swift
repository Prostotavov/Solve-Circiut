import Foundation
import UIKit

enum ElectronicDevices: String, CaseIterable {
    case resistor
    case emfSourse
}


class FactoryElectronicDevices {
    static let defaultFactory = FactoryElectronicDevices()
    
    func createElectronicDevice(selectedDevice: ElectronicDevices) -> ElectronicDevice {
        switch selectedDevice {
        case .resistor: return Resistor()
        case .emfSourse: return EMFSource()
        }
    }
}





