//
//  ResistorView.swift
//  Solve Circiut
//
//  Created by MacBook Pro on 3.12.21.
//

import UIKit

class ResistorView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let resistorImage = UIImage(named: "resistor")
        let imageView = UIImageView(image: resistorImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
