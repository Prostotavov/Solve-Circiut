//
//  BoardEntity.swift
//  Solve Circiut
//
//  Created by MacBook Pro on 1.12.21.
//

import UIKit

protocol Point: UIImageView{
    var x: Int {set get}
    var y: Int {set get}
}

class PointImplementation: UIImageView, Point {
    var x: Int = 0
    var y: Int = 0
}
