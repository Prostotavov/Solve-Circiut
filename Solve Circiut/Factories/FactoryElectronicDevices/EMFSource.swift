import UIKit

class EMFSource: ElectronicDeviceImplementation {
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        name = ""
        resistance = 0
        current = 0
        voltage = 0
    }
    
    init(device: ElectronicDevice){
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        name = device.name
        emf = device.emf
        resistance = device.resistance
        current = device.current
        voltage = device.voltage
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func printInfo() {
        print("EMF sourse \(name) has: R = \(resistance)")
        print("I = \(current), V = \(voltage)")
        print("E = \(emf)")
        
    }
}
