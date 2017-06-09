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
        let gdansk = CLLocationCoordinate2D(latitude: 54.382283, longitude: 18.605526)
        let krakow = CLLocationCoordinate2D(latitude: 50.068025, longitude: 19.947044)
        ApiClient.startRide(from: gdansk, to: krakow)
    }
    
}
