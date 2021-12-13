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
    
    func getBoardContentSize() -> CGSize {
        let distance = Int(BoardDataManagerImplementation.distanceBetweenPoints)
        let size = CGSize(width: (dataManager.board.pointsCountInRow + 1) * distance,
                          height: (dataManager.board.pointsCountInColumn + 1) * distance)
        return size
    }

    func createPoints() -> [[Point]] {
        
        var points = dataManager.board.points
        for x in 0..<dataManager.board.pointsCountInRow {
            
            var linePoints = [PointImplementation]()
            
            for y in 0..<dataManager.board.pointsCountInColumn {
                let point = PointImplementation()
                
                point.x = x
                point.y = y
                
                linePoints.append(point)
            }
            points.append(linePoints)
        }
        return points
    }
    
    func add(device: ElectronicDevices, to location: CGPoint) {
        let distanceBetweenPoints = BoardDataManagerImplementation.distanceBetweenPoints
        let device = FactoryElectronicDevices.defaultFactory.createElectronicDevice(selectedDevice: device)
        device.leadingPin.x = round(location.x / CGFloat(distanceBetweenPoints)) - 1
        device.leadingPin.y = round(location.y / CGFloat(distanceBetweenPoints)) - 1
        dataManager.devices.add(device: device)
        print(device.leadingPin)
    }
    
    func getDevices() -> [ElectronicDevice] {
        dataManager.devices.devices
    }
    
}
