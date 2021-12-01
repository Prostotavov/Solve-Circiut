import Foundation

struct Resistor: ElectronicDevice {
  
  var name: String
  var resistance: Float
  var current: Float
  var voltage: Float
  
  init(){
    name = ""
    resistance = 0
    current = 0
    voltage = 0
  }
  
  init(superElectronicDevice: SuperElectronicDevice){
    name = superElectronicDevice.name
    resistance = superElectronicDevice.resistance
    current = superElectronicDevice.current
    voltage = superElectronicDevice.voltage
  }
  
  func printInfo() {
    print("Resistor \(name) has: R = \(resistance)")
    print("I = \(current), V = \(voltage)")
  }
}
