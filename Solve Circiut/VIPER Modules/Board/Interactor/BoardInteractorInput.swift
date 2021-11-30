// 
//  BoardInteractorInput.swift
//  Solve Circiut
//
//  Created by MacBook Pro on 30.11.21.
//

import UIKit

protocol BoardInteractorInput: AnyObject {

    func createPoints() -> [[PointProtocol]]
    func getBoardContentSize() -> CGSize
    func getPointSize() -> CGSize
    func getDistance() -> Int
}
