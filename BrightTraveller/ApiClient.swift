//
//  ApiClient.swift
//  BrightTraveller
//
//  Created by Eliasz Sawicki on 09/06/2017.
//  Copyright © 2017 Eliasz Sawicki. All rights reserved.
//

import Foundation
import CoreLocation

class ApiClient {
    
    static func sendLocation(location: CLLocationCoordinate2D) {
        print("Sending location: \(location)")
    }
    
    static func startRide(from: CLLocationCoordinate2D, to: CLLocationCoordinate2D) {
        print("Starting ride from \(from) to \(to)")
    }
    
}
