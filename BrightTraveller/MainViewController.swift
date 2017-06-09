//
//  ViewController.swift
//  BrightTraveller
//
//  Created by Eliasz Sawicki on 09/06/2017.
//  Copyright © 2017 Eliasz Sawicki. All rights reserved.
//

import UIKit
import PureLayout

class MainViewController: UIViewController, UITextFieldDelegate {
    
    var locationService = LocationService()
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
//        let rideInit = RideInitializer()
//        rideInit.initializeRide(coordinates: <#T##CLLocationCoordinate2D#>)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        startCityTextField.resignFirstResponder()
        endCityTextField.resignFirstResponder()
        endAddressTextField.resignFirstResponder()
        return true
    }
    
}

