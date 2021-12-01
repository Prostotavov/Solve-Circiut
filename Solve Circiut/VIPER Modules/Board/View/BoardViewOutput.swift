// 
//  BoardViewOutput.swift
//  Solve Circiut
//
//  Created by MacBook Pro on 30.11.21.
//

import UIKit

protocol BoardViewOutput: AnyObject {
    
    func createPoints() -> [[Point]]
    func getBoardContentSize() -> CGSize
    func getPointSize() -> CGSize
    func getDistance() -> Int
}
