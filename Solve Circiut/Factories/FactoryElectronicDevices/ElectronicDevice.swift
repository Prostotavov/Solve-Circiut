import UIKit

protocol ElectronicDevice: UIButton {
    
    var name: String {get set}
    var resistance: Float {get set}
    var current: Float {get set}
    var voltage: Float {get set}
    var emf: Float {get set}
    
    var leadingPin: CGPoint {get set}
    var trailingPin: CGPoint {get set}
    
    func printInfo()
}

class ElectronicDeviceImplementation: UIButton, ElectronicDevice {
    
    var name: String = ""
    var resistance: Float = 0
    var current: Float = 0
    var voltage: Float = 0
    var emf: Float = 0
    
    var leadingPin: CGPoint = CGPoint(x: 0, y: 0)
    var trailingPin: CGPoint = CGPoint(x: 0, y: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func printInfo() {
        
    }
    
}
