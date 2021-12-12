//
//  DevicesView.swift
//  TestScrollView
//
//  Created by MacBook Pro on 17.11.21.
//

import UIKit

protocol DevicesBarViewDelegate {
    func getCurrentZoomValue() -> CGFloat
    func isZooming() -> Bool
    var boardView: BoardView {get set}
    func addResistor()
    func addResistorIn(location: CGPoint)
    func getDistanceBetweenPoints() -> Int
}

class DevicesBarView: UIView {
    
    // Constants
    let resistorHeight: CGFloat = 60
    let resistorWidth: CGFloat = 20
    let distanceFromTop: CGFloat = 20
    let distanceFromLeading: CGFloat = 50
    var currentZoomValue: CGFloat = 1
    
    var delegate: DevicesBarViewDelegate!
    
    private var isDragging = false
    
    var resistorView: UIImageView = {
        var resistorImage = UIImage(named: "resistor")
        var imageView = UIImageView(image: resistorImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBrown
        self.addSubview(resistorView)
        setResistorView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func setResistorView() {
        
        resistorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        resistorView.widthAnchor.constraint(equalToConstant: resistorWidth),
        resistorView.heightAnchor.constraint(equalToConstant: resistorHeight),
        resistorView.topAnchor.constraint(equalTo: self.topAnchor, constant: distanceFromTop),
        resistorView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: distanceFromLeading)
        ])
    }
    
    func createResistor() -> UIView{
        let resistorImage = UIImage(named: "resistor")
        let imageView = UIImageView(image: resistorImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.bounds.size = CGSize(width: resistorWidth, height: resistorHeight)
        return imageView
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        resistorView.frame.size = CGSize(width: resistorWidth * currentZoomValue,
                                         height: resistorHeight * currentZoomValue)
    }
}


extension DevicesBarView {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return}
        let location = touch.location(in: resistorView)
        if resistorView.bounds.contains(location) {
            isDragging = true
            currentZoomValue = delegate.getCurrentZoomValue()
            layoutSubviews()
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard isDragging, let touch = touches.first  else {return}
        let location = touch.location(in: self)
        resistorView.frame.origin.x = location.x - (resistorView.frame.size.width / 2)
        resistorView.frame.origin.y = location.y - (resistorView.frame.size.height / 2) * 3.5
        if  delegate.isZooming() {
            returnDeviceOntoBar()
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard isDragging, let touch = touches.first  else {return}
        var location = touch.location(in: delegate.boardView)
        location.y = location.y - (resistorView.frame.size.height / 2) * 3.5 / delegate.getCurrentZoomValue()
        
        var barLocation = touch.location(in: self)
        barLocation.x = barLocation.x - (resistorView.frame.size.width / 2)
        barLocation.y = barLocation.y + resistorView.frame.size.height
        - (resistorView.frame.size.height / 2) * 3.5
        
         let distanceBetweenPoints = CGFloat(delegate.getDistanceBetweenPoints())
        print("location \(location)")
        print("         ")
        
        if barLocation.y < 0, location.x > 0, location.y > distanceBetweenPoints {
            delegate.addResistorIn(location: location)
            
        }
        returnDeviceOntoBar()
    }
    
    func returnDeviceOntoBar() {
        isDragging = false
        currentZoomValue = 1
        layoutSubviews()
        resistorView.frame.origin.x = self.bounds.origin.x + distanceFromLeading
        resistorView.frame.origin.y = self.bounds.origin.y + distanceFromTop
    }
    
}
