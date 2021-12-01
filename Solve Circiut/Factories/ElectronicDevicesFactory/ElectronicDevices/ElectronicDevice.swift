import Foundation

protocol ElectronicDevice {
  
  var name: String {get set}
  var resistance: Float {get set}
  var current: Float {get set}
  var voltage: Float {get set}
  
  func printInfo()
}
