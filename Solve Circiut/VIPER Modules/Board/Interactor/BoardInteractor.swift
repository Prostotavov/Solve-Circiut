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
    
    //constants
    let pointsCountInRow: Int = 50
    let pointsCountInColumn: Int = 50
    let pointImage = UIImage(systemName: "seal")
    let pointSize: CGSize = CGSize(width: 5, height: 5)
    let distance = 30
    
    func getPointSize() -> CGSize {
        pointSize
    }
    
    func getDistance() -> Int {
        distance
    }
    
    func getBoardContentSize() -> CGSize {
        let size: CGSize =  CGSize(width: (pointsCountInRow + 1) * distance, height: (pointsCountInColumn + 1) * distance)
        return size
    }

    func createPoints() -> [[PointProtocol]] {
        
        var points = [[PointProtocol]]()
        for x in 0..<pointsCountInRow {
            
            var linePoints = [Point]()
            
            for y in 0..<pointsCountInColumn {
                let point = Point()
                point.image = pointImage
                
                point.x = x
                point.y = y
                
                linePoints.append(point)
            }
            points.append(linePoints)
        }
        return points
    }
    
}
