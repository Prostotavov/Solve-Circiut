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
}

class DataManagerImplementation: DataManager {
    
    var pointsCountInRow: Int = 50
    var pointsCountInColumn: Int = 50
    var pointImage: UIImage = UIImage(systemName: "seal")!
    var pointSize: CGSize = CGSize(width: 5, height: 5)
    var distanceBetweenPoints: Int = 30
    var points: [[Point]] = [[Point]]()
}




