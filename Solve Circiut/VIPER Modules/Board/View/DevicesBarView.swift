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
    func add(device: ElectronicDevices, to location: CGPoint)
    func getBoardContentSize() -> CGSize
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
    
    var resistorView: UIImageView = BarResistorView()

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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        resistorView.frame.size = CGSize(width: resistorWidth * currentZoomValue,
                                         height: resistorHeight * currentZoomValue)
    }
}

// extension for drag and drop functions
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
        
        var boardLocation = touch.location(in: delegate.boardView)
        boardLocation.y = boardLocation.y - (resistorView.frame.size.height / 2) * 3.5 / delegate.getCurrentZoomValue()
        
        var barLocation = touch.location(in: self)
        barLocation.x = barLocation.x - (resistorView.frame.size.width / 2)
        barLocation.y = barLocation.y + resistorView.frame.size.height
        - (resistorView.frame.size.height / 2) * 3.5
        
        setResistorLocation(location: &boardLocation)
        
        if barLocation.y < 0 {
            delegate.add(device: .resistor, to: boardLocation)
        }
        returnDeviceOntoBar()
    }
    
    // if the user pulls the device outside the board,
    // then the coordinates of the device take
    // an extreme value on the board
    func setResistorLocation(location: inout CGPoint) {
        
        var settedLocation = CGPoint()
        let distanceBetweenPoints = BoardDataManagerImplementation.distanceBetweenPoints
        let boardSize  = delegate.getBoardContentSize().width
        
        if location.x < distanceBetweenPoints {
            settedLocation.x = distanceBetweenPoints
        }
        if location.y < distanceBetweenPoints {
            settedLocation.y = distanceBetweenPoints
        }
        if location.x > boardSize {
            settedLocation.x = boardSize - distanceBetweenPoints
        }
        if location.y > boardSize {
            settedLocation.y = boardSize - distanceBetweenPoints * 3
        }
    }
    
    func returnDeviceOntoBar() {
        isDragging = false
        currentZoomValue = 1
        layoutSubviews()
        resistorView.frame.origin.x = self.bounds.origin.x + distanceFromLeading
        resistorView.frame.origin.y = self.bounds.origin.y + distanceFromTop
    }
    
}
