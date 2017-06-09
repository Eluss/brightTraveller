//
//  ApiClient.swift
//  BrightTraveller
//
//  Created by Eliasz Sawicki on 09/06/2017.
//  Copyright © 2017 Eliasz Sawicki. All rights reserved.
//

import Foundation
import CoreLocation
import Alamofire

class ApiClient {
    
    let host = "http://35.187.160.105"
    let accessToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjU5M2E4NGU0NmZkMzdjMDA5YzFmNjZkZiIsImlhdCI6MTQ5NzAwNzQxMn0.5WgPKL7pvksheDrv1r1Dox9to2eLRQtVMdD4YZ6jNRU"
    static let sharedInstance = ApiClient()
    
    func sendLocation(location: CLLocationCoordinate2D) {
//        lon, lat in array
        let parameters = [
            "location": [location.longitude, location.latitude],
            "access_token": accessToken
        ] as [String : Any]
        let url = URL(string: host + "/users/me")!
        Alamofire.request(url, method: .put, parameters: parameters, encoding: URLEncoding.httpBody, headers: nil).response { response in
            if response.response?.statusCode != 200 {
                print("!!!!Location sending: FAILED!!!!")
            } else {
                print("Location sending: OK")
            }
        }
    }
    
    func startRide(from: CLLocationCoordinate2D, to: CLLocationCoordinate2D) {
        
        print("Starting ride from \(from) to \(to)")
    }
    
}
