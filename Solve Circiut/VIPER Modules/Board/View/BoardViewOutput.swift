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
    func getDevices() -> [ElectronicDevice]
    func add(device: ElectronicDevices, to location: CGPoint)
}
