// 
//  BoardInteractorOutput.swift
//  Solve Circiut
//
//  Created by MacBook Pro on 30.11.21.
//

import UIKit

protocol BoardInteractorOutput: AnyObject {
    
    func createPoints() -> [[Point]]
    func getBoardContentSize() -> CGSize
    func getPointSize() -> CGSize
    func getDistanceBetweenPoints() -> Int
    func getDevices() -> [ElectronicDevices]
}
