//
//  ResistorImageView.swift
//  Solve Circiut
//
//  Created by MacBook Pro on 5.01.22.
//

import UIKit

class ResistorImageView: UIImageView, DeviceImageView {
    
    var height: CGFloat = 60
    var width: CGFloat = 20

    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: width, height: height))
        self.image = UIImage(named: "resistor")
        self.translatesAutoresizingMaskIntoConstraints = false
        self.isUserInteractionEnabled = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
