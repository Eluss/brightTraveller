//
//  RideInitializer.swift
//  BrightTraveller
//
//  Created by Eliasz Sawicki on 09/06/2017.
//  Copyright © 2017 Eliasz Sawicki. All rights reserved.
//

import Foundation
import Alamofire
import CoreLocation

class RideInitializer {
    
    func initializeRide(coordinates: [CLLocationCoordinate2D], steps: [String]) {
        print("Initializing ride")        
        ApiClient.sharedInstance.startRide(coordinates: coordinates, steps: steps)
    }
    
}
