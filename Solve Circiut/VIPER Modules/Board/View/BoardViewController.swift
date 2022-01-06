// 
//  BoardViewController.swift
//  Solve Circiut
//
//  Created by MacBook Pro on 30.11.21.
//

import UIKit

class BoardViewController: UIViewController, BoardViewInput, BoardViewDelegate, DevicesBarViewDelegate {
    
    var output: BoardViewOutput!
    var assembler: BoardAssemblyProtocol = BoardAssembly()
    
    var boardScrollView = BoardScrollView()
    var boardView = BoardView()
    var devicesBarView = DevicesBarView()
    let devicesViewHeight: CGFloat = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBlue
        assembler.assembly(with: self)
        boardView.delegate = self
        devicesBarView.delegate = self
        setBoardView()
        view.addSubview(devicesBarView)
        setupDevicesBarViewConstraints()
    }
    
    func setBoardView() {
        boardView.showPoints()
        boardView.showDevices()
        
        boardScrollView = BoardScrollView(frame: view.bounds)
        view.addSubview(boardScrollView)
        setupImageScrollViewConstraints()
        
        boardView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: output.getBoardContentSize())
        boardScrollView.addSubview(view: boardView)
    }
    
    func getDevices() -> [DeviceButton] {
        output.getDevices()
        
    }
    
    func add(_ selectedDevice: Devices, to location: CGPoint) {
        output.add(selectedDevice, to: location)
        boardView.showDevices()
    }
    
}

// extension for DevicesBarViewDelegate functions
extension BoardViewController {
    
    func isZooming() -> Bool {
        boardScrollView.isZooming
    }
    
    func getCurrentZoomValue() -> CGFloat {
        boardScrollView.getCurrentZoomValue()
    }
    
    func getBoardContentSize() -> CGSize {
        output.getBoardContentSize()
    }
}

// extension for BoardViewDelegate functions
extension BoardViewController {
    
    func createPoints() -> [[Point]] {
        return output.createPoints()
    }
}

// extension for setup constraints
extension BoardViewController {
    
    func setupImageScrollViewConstraints() {
        
        boardScrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            boardScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            boardScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:  -devicesViewHeight),
            boardScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            boardScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func setupDevicesBarViewConstraints() {
        devicesBarView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        devicesBarView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        devicesBarView.widthAnchor.constraint(equalTo: view.widthAnchor),
        devicesBarView.heightAnchor.constraint(equalToConstant: devicesViewHeight)
        ])
    }
}
