//
//  ViewController.swift
//  BrightTraveller
//
//  Created by Eliasz Sawicki on 09/06/2017.
//  Copyright © 2017 Eliasz Sawicki. All rights reserved.
//

import UIKit
import PureLayout
import CoreLocation

class MainViewController: UIViewController, UITextFieldDelegate {
    
    var locationService = LocationService()
    var rideInitializer = RideInitializer()
    var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    var startCityTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Początkowa stacja"
        return field
    }()
    
    var endCityTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Końcowa stacja"
        return field
    }()
    
    var endAddressTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Końcowy adres"
        return field
    }()
    
    var okButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Rozpocznij podróż", for: .normal)
        return button
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTextFields()
        
    }
    
    private func setupTextFields() {
        startCityTextField.delegate = self
        endAddressTextField.delegate = self
        endCityTextField.delegate = self
        view.addSubview(stackView)
        stackView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsetsMake(100, 0, 0, 0))
        okButton.addTarget(self, action: #selector(startRide), for: .touchUpInside)
        
        stackView.addArrangedSubview(startCityTextField)
        stackView.addArrangedSubview(endCityTextField)
        stackView.addArrangedSubview(endAddressTextField)
        stackView.addArrangedSubview(okButton)
        
    }
    
    
    func startRide() {
        let geocoder = CLGeocoder()
        let address1 = "Gdansk Glowny"
        let address2 = "Krakow Glowny"
        let address3 = "Krakow Podole 60"
        geocoder.geocodeAddressString(address1) { (placemark1, error) in
            print(placemark1!.first!.location!.coordinate)
            geocoder.geocodeAddressString(address2) { (placemark2, error) in
                print(placemark2!.first!.location!.coordinate)
                geocoder.geocodeAddressString(address3) { (placemark3, error) in
                print(placemark3!.first!.location!.coordinate)
                    let coord1 = placemark1!.first!.location!.coordinate
                    let coord2 = placemark2!.first!.location!.coordinate
                    let coord3 = placemark3!.first!.location!.coordinate
                    let coords = [coord1, coord2, coord3]
                    self.rideInitializer.initializeRide(coordinates: coords)
                    
                    let alert = UIAlertController(title: "Zgłoszenie przyjęte, zaraz będzie taxi", message: "", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { ok in
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        startCityTextField.resignFirstResponder()
        endCityTextField.resignFirstResponder()
        endAddressTextField.resignFirstResponder()
        return true
    }
    
}

