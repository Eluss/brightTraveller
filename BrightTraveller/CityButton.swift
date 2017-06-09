//
//  CityButton.swift
//  BrightTraveller
//
//  Created by Eliasz Sawicki on 09/06/2017.
//  Copyright © 2017 Eliasz Sawicki. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class CityButton: UIButton {
    
    private var viewController: UIViewController
    private var title: String
    private var coord: CLLocationCoordinate2D
    private var rideInitializer = RideInitializer()
    
    init(viewController: UIViewController, title: String, coordinates: CLLocationCoordinate2D) {
        self.viewController = viewController
        self.title = title
        self.coord = coordinates
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.addTarget(self, action: #selector(tap), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tap() {
        let alert = UIAlertController(title: "Uwaga", message: "Czy chcesz rozpocząć podróż", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tak", style: .default, handler: { ok in
            self.rideInitializer.initializeRide(coordinates: self.coord)
            self.viewController.present(SuccessViewController(), animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Nie", style: .cancel, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
    
}
