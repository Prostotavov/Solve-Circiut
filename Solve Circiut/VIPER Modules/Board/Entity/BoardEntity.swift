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
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 5, height: 5))
        self.image = UIImage(systemName: "seal")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



