// 
//  BoardInteractor.swift
//  Solve Circiut
//
//  Created by MacBook Pro on 30.11.21.
//

import UIKit

class BoardInteractor: BoardInteractorInput {
    
    weak var output: BoardInteractorOutput!
    var dataManager: DataManager!
    
    func getPointSize() -> CGSize {
        dataManager.pointSize
    }
    
    func getDistanceBetweenPoints() -> Int {
        dataManager.distanceBetweenPoints
    }
    
    func getBoardContentSize() -> CGSize {
        let distance = dataManager.distanceBetweenPoints
        let size = CGSize(width: (dataManager.pointsCountInRow + 1) * distance,
                          height: (dataManager.pointsCountInColumn + 1) * distance)
        return size
    }

    func createPoints() -> [[Point]] {
        
        var points = dataManager.points
        for x in 0..<dataManager.pointsCountInRow {
            
            var linePoints = [PointImplementation]()
            
            for y in 0..<dataManager.pointsCountInColumn {
                let point = PointImplementation()
                point.image = dataManager.pointImage
                
                point.x = x
                point.y = y
                
                linePoints.append(point)
            }
            points.append(linePoints)
        }
        return points
    }
    
    func addResistorIn(location: CGPoint) {
        dataManager.addResistorIn(location: location)
    }
    
    func getResistors() -> [Resistor] {
        dataManager.resistors
    }
    
    func addResistor() {
        dataManager.addResistor()
    }
    
}
