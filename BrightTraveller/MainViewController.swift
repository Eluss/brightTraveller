//
//  ViewController.swift
//  BrightTraveller
//
//  Created by Eliasz Sawicki on 09/06/2017.
//  Copyright © 2017 Eliasz Sawicki. All rights reserved.
//

import UIKit
import PureLayout

class MainViewController: UIViewController {
    
    var locationService = LocationService()
    var rideInitializer = RideInitializer()
    let startRideButton = UIButton()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.darkColor
        setupButton()
    }
    
    private func setupButton() {
        startRideButton.setTitle("Rozpocznij podróż z Gdańska do Krakowa", for: .normal)
        startRideButton.setTitleColor(UIColor.lightColor, for: .normal)
        startRideButton.addTarget(self, action: #selector(startRide), for: .touchUpInside)
        
        view.addSubview(startRideButton)
        startRideButton.autoCenterInSuperview()
    }
    
    func startRide() {
        let alert = UIAlertController(title: "Uwaga", message: "Czy chcesz rozpocząć podróż", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tak", style: .default, handler: { ok in
            self.rideInitializer.initializeRide()            
            self.present(SuccessViewController(), animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Nie", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}

