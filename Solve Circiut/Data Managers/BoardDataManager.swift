//
//  BoardDataManager.swift
//  Solve Circiut
//
//  Created by MacBook Pro on 13.12.21.
//

import UIKit

protocol BoardDataManager {
    
    static var distanceBetweenPoints: CGFloat {get}
    var pointsCountInRow: Int {get}
    var pointsCountInColumn: Int {get}
    var points: [[Point]] {get}
}

class BoardDataManagerImplementation: BoardDataManager {
    
    static var distanceBetweenPoints: CGFloat = 30
    var pointsCountInRow: Int = 50
    var pointsCountInColumn: Int = 50
    var points: [[Point]] = [[Point]]()
}
