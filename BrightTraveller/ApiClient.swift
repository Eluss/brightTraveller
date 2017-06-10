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
    
    var location: CLLocationCoordinate2D?
    
    func save(location: CLLocationCoordinate2D) {
        self.location = location
    }
    
    func sendLocation() {
        //        lon, lat in array
        let parameters = [
            "location": [self.location!.longitude, self.location!.latitude],
            "access_token": accessToken
            ] as [String : Any]
        let url = URL(string: host + "/users/me")!
        let request = Alamofire.request(url, method: .put, parameters: parameters, encoding: JSONEncoding.default, headers: nil).response { response in
            if response.response?.statusCode != 200 {
                print("!!!!Location sending: FAILED!!!!")
            } else {
                print("Location sending: OK")
            }
        }
        print(request)
    }
    
    func startRide(coordinates: [CLLocationCoordinate2D]) {
        
        let coords = coordinates.map { (x) -> [Double] in
            return [x.longitude, x.latitude]
        }
        
        let parameters = [            
            "steps": coords,
            "access_token": accessToken
            ] as [String : Any]
        let url = URL(string: host + "/calls")!
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).response { response in
            if response.response?.statusCode != 201 {
                print("!!!!Starting ride: FAILED!!!!")
            } else {
                print("Starting ride: OK")
            }
        }
        
        
//        print("Starting ride from \(from) to \(to)")
    }
    
}
