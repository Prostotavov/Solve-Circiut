// 
//  BoardViewInput.swift
//  Solve Circiut
//
//  Created by MacBook Pro on 30.11.21.
//

import Foundation

protocol BoardViewInput: AnyObject {
    
    func createPoints() -> [[Point]]
    func setBoardView()
    
    func setupImageScrollViewConstraints()
    func setupDevicesViewConstraints()
}
