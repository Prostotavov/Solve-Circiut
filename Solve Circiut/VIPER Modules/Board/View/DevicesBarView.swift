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
    func add(_ selectedDevice: Devices, to location: CGPoint)
    func getBoardContentSize() -> CGSize
}

class DevicesBarView: UIView {
    
    // Constants
    let resistorHeight: CGFloat = 60
    let resistorWidth: CGFloat = 20
    let distanceFromTop: CGFloat = 20
    let distanceFromLeading: CGFloat = 50
    let distanceBetweenDevices: CGFloat = 50
    var currentZoomValue: CGFloat = 1
    
    var delegate: DevicesBarViewDelegate!
    
    private var isDragging = false
    
    var devicesImageView = [DeviceImageView]()
    
    var resistorImageView = ResistorFactory.defaultFactory.createDeviceImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBrown
        self.addSubview(resistorImageView)
        setResistorView()
        fillDevicesImageView()
        setDevicesView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fillDevicesImageView() {
        
        for device in Devices.allCases {
            
            switch device {
            case .resistor:
                devicesImageView.append(ResistorFactory.defaultFactory.createDeviceImageView())
            case .EMFSource:
                devicesImageView.append( EMFSourceFactory.defaultFactory.createDeviceImageView())
            }
        }
    }
    
    func setDevicesView() {
        
        for (index, device) in devicesImageView.enumerated() {
        
            self.addSubview(device)
            device.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                device.widthAnchor.constraint(equalToConstant: device.width),
                device.heightAnchor.constraint(equalToConstant: device.height),
                device.topAnchor.constraint(equalTo: self.topAnchor, constant: distanceFromTop),
                device.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: distanceFromLeading + 100 + CGFloat(index) * distanceBetweenDevices)
            ])
            
        }
    }

    
    func setResistorView() {
        
        resistorImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        resistorImageView.widthAnchor.constraint(equalToConstant: resistorWidth),
        resistorImageView.heightAnchor.constraint(equalToConstant: resistorHeight),
        resistorImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: distanceFromTop),
        resistorImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: distanceFromLeading)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        resistorImageView.frame.size = CGSize(width: resistorWidth * currentZoomValue,
                                         height: resistorHeight * currentZoomValue)
    }
}

// extension for drag and drop functions
extension DevicesBarView {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {return}
        let location = touch.location(in: resistorImageView)
        if resistorImageView.bounds.contains(location) {
            isDragging = true
            currentZoomValue = delegate.getCurrentZoomValue()
            layoutSubviews()
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard isDragging, let touch = touches.first  else {return}
        let location = touch.location(in: self)
        resistorImageView.frame.origin.x = location.x - (resistorImageView.frame.size.width / 2)
        resistorImageView.frame.origin.y = location.y - (resistorImageView.frame.size.height / 2) * 3.5
        if  delegate.isZooming() {
            returnDeviceOntoBar()
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard isDragging, let touch = touches.first  else {return}
        
        var boardLocation = touch.location(in: delegate.boardView)
        boardLocation.y = boardLocation.y - (resistorImageView.frame.size.height / 2) * 3.5 / delegate.getCurrentZoomValue()
        
        var barLocation = touch.location(in: self)
        barLocation.x = barLocation.x - (resistorImageView.frame.size.width / 2)
        barLocation.y = barLocation.y + resistorImageView.frame.size.height
        - (resistorImageView.frame.size.height / 2) * 3.5
        
        setResistorLocation(location: &boardLocation)
        
        if barLocation.y < 0 {
            delegate.add(.resistor, to: boardLocation)
        }
        returnDeviceOntoBar()
    }
    
    // if the user drop the device outside the board,
    // then the coordinates of the device take
    // an extreme value on the board
    func setResistorLocation(location: inout CGPoint) {
        
        let distanceBetweenPoints = BoardDataManagerImplementation.distanceBetweenPoints
        let boardWidth  = delegate.getBoardContentSize().width
        let boardHeight  = delegate.getBoardContentSize().height
        
        if location.x < distanceBetweenPoints {
            location.x = distanceBetweenPoints
        } else if location.x > boardWidth {
            location.x = boardWidth - distanceBetweenPoints
        }
        if location.y < distanceBetweenPoints {
            location.y = distanceBetweenPoints
        } else if location.y > boardHeight {
            location.y = boardHeight - distanceBetweenPoints * 3
        }
    }
    
    func returnDeviceOntoBar() {
        isDragging = false
        currentZoomValue = 1
        layoutSubviews()
        resistorImageView.frame.origin.x = self.bounds.origin.x + distanceFromLeading
        resistorImageView.frame.origin.y = self.bounds.origin.y + distanceFromTop
    }
    
}
