//
//  ResistorView.swift
//  Solve Circiut
//
//  Created by MacBook Pro on 13.12.21.
//

import UIKit

class BarResistorView: UIImageView {

    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 20, height: 60))
        self.image = UIImage(named: "resistor")
        self.translatesAutoresizingMaskIntoConstraints = false
        self.isUserInteractionEnabled = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
