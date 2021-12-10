//
//  DataManager.swift
//  Solve Circiut
//
//  Created by MacBook Pro on 30.11.21.
//

import UIKit

protocol DataManager {
    
    var pointsCountInRow: Int {get set}
    var pointsCountInColumn: Int {get set}
    var pointImage: UIImage {get set}
    var pointSize: CGSize {get set}
    var distanceBetweenPoints: Int {get set}
    var points: [[Point]] {get set}
    var resistors: [Resistor] {get set}
    var resistorsCount: Int {get set}
    
    func addResistor()
    func createResistor(i: Int) -> Resistor
    func createResistors()
}

class DataManagerImplementation: DataManager {
    
    var pointsCountInRow: Int = 50
    var pointsCountInColumn: Int = 50
    var pointImage: UIImage = UIImage(systemName: "seal")!
    var pointSize: CGSize = CGSize(width: 5, height: 5)
    var distanceBetweenPoints: Int = 30
    var points: [[Point]] = [[Point]]()
    var resistors: [Resistor] = [Resistor]()
    var resistorsCount: Int = 3
    
    init() {
        createResistors()
    }
    
    func createResistors() {
        
        for i in 1...resistorsCount {
            resistors.append(createResistor(i: i))
        }
    }
    
    func createResistor(i: Int) -> Resistor {
        let resistorImage = UIImage(named: "resistor")
        let resistor = Resistor()
        resistor.leadingPin = CGPoint(x: 2, y: i * 2 + 1)
        resistor.trailingPin = CGPoint(x: 2, y: i * 2 + 3)
        resistor.setImage(resistorImage, for: .normal)
        return resistor
    }
    
    func addResistor() {
        resistorsCount += 1
        resistors.append(createResistor(i: resistorsCount))
    }
    
}
