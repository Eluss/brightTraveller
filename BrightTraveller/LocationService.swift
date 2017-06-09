//
//  LocalizationService.swift
//  BrightTraveller
//
//  Created by Eliasz Sawicki on 09/06/2017.
//  Copyright © 2017 Eliasz Sawicki. All rights reserved.
//

import Foundation
import CoreLocation

class LocationService: NSObject, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    var counter = 0
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        counter += 1
        if let location = locations.first, counter == 10 {
//            ApiClient.sharedInstance.sendLocation(location: location.coordinate)
            counter = 0
        }
    }
}
