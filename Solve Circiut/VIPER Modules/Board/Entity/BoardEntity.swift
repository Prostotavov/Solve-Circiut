//
//  BoardEntity.swift
//  Solve Circiut
//
//  Created by MacBook Pro on 1.12.21.
//

import UIKit

protocol PointProtocol: UIImageView{
    var x: Int {set get}
    var y: Int {set get}
}

class Point: UIImageView, PointProtocol {
    
    var x: Int = 0
    var y: Int = 0
    
}
