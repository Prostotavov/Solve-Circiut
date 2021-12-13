import UIKit

class Resistor: ElectronicDeviceImplementation {
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 20, height: 60))
        self.setImage(UIImage(named: "resistor"), for: .normal)
        name = ""
        resistance = 0
        current = 0
        voltage = 0
    }
    
    init(device: ElectronicDevice){
        super.init(frame: CGRect(x: 0, y: 0, width: 20, height: 60))
        self.setImage(UIImage(named: "resistor"), for: .normal)
        name = device.name
        resistance = device.resistance
        current = device.current
        voltage = device.voltage
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func printInfo() {
        print("Resistor \(name) has: R = \(resistance)")
        print("I = \(current), V = \(voltage)")
    }
}

