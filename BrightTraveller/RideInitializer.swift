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
    
    func initializeRide() {
        print("Initializing ride")
        let gdansk = CLLocationCoordinate2D(latitude: 1, longitude: 1)
        let krakow = CLLocationCoordinate2D(latitude: 2, longitude: 2)
        ApiClient.startRide(from: gdansk, to: krakow)
    }
    
}
