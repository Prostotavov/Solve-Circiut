//
//  DataManager.swift
//  Solve Circiut
//
//  Created by MacBook Pro on 30.11.21.
//

import UIKit

protocol DataManager {
    
    var board: BoardDataManager {get}
    var devices: DevicesDataManager {get}
}

class DataManagerImplementation: DataManager {
    
    var board: BoardDataManager = BoardDataManagerImplementation()
    var devices: DevicesDataManager = DevicesDataManagerImplementation()
    
}

