import Foundation

struct EMFSource: ElectronicDevice {
  
  var name: String
  var emf: Float
  var resistance: Float
  var current: Float
  var voltage: Float
  
  init(){
    name = ""
    emf = 0
    resistance = 0
    current = 0
    voltage = 0
  }
  
  init(superElectronicDevice: SuperElectronicDevice){
    name = superElectronicDevice.name
    emf = superElectronicDevice.emf
    resistance = superElectronicDevice.resistance
    current = superElectronicDevice.current
    voltage = superElectronicDevice.voltage
  }
  
  func printInfo() {
    print("EMF sourse \(name) has: R = \(resistance)")
    print("I = \(current), V = \(voltage)")
    print("E = \(emf)")
    
  }
}
