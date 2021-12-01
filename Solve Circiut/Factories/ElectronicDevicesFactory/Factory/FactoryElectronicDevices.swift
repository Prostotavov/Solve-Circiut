import Foundation
import UIKit

enum ElectronicDevices: String, CaseIterable {
  case resistor
  case emfSourse
}


class FactoryElectronicDevices {
  static let defaultFactory = FactoryElectronicDevices()
  
  func createElectronicDevice(electronicDevice: ElectronicDevices,
                              superElectronicDevice: SuperElectronicDevice) -> ElectronicDevice {
    switch electronicDevice {
    case .resistor: return Resistor(superElectronicDevice: superElectronicDevice)
    case .emfSourse: return EMFSource(superElectronicDevice: superElectronicDevice)
    }
  }
}





