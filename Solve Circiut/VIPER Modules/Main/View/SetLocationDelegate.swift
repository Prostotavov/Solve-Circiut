//
//  SetLocationDelegate.swift
//  Solve Circiut
//
//  Created by MacBook Pro on 30.11.21.
//

import UIKit

protocol SetLocationDelegate: class {
    func getLocation(loc: String)
}

class LocationVC: UIViewController {

    weak var delegate: SetLocationDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .cyan
        self.delegate?.getLocation(loc: "Sam")


    }

}
