//
//  MainViewModel.swift
//  BrightTraveller
//
//  Created by Eliasz Sawicki on 09/06/2017.
//  Copyright © 2017 Eliasz Sawicki. All rights reserved.
//

import Foundation
import ReactiveCocoa

enum MainScreenMode {
    case idle
    case initializeRide
}

class MainViewModel {
    
    var rideInitializer = RideInitializer()
    var onSwitchToMode: ((MainScreenMode)->Void)
    var currentMode: MainScreenMode {
        didSet {
            self.onSwitchToMode(currentMode)
        }
    }
    
    init(onSwitchToMode: @escaping (MainScreenMode)->Void) {
        self.onSwitchToMode = onSwitchToMode
        currentMode = .idle
    }

    
    func initializeRide() {
        currentMode = .initializeRide
    }
    
    func acceptRide() {
        rideInitializer.initializeRide()
    }
    
    func discardRide() {
        currentMode = .idle
    }
    
}
