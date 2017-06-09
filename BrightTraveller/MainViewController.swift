//
//  ViewController.swift
//  BrightTraveller
//
//  Created by Eliasz Sawicki on 09/06/2017.
//  Copyright © 2017 Eliasz Sawicki. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    let viewModel = MainViewModel()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setupView()
    }
    
    func setupView() {
        let initializeGesture = UITapGestureRecognizer(target: self, action: #selector(initializeRide))
        let acceptGesture = UITapGestureRecognizer(target: self, action: #selector(acceptRide))
        acceptGesture.numberOfTapsRequired = 2
        let discardGesture = UITapGestureRecognizer(target: self, action: #selector(discardRide))
        
        initializeGesture.require(toFail: acceptGesture)
        discardGesture.require(toFail: acceptGesture)
        
        view.addGestureRecognizer(initializeGesture)
        view.addGestureRecognizer(acceptGesture)
        view.addGestureRecognizer(discardGesture)
    }
    
    func acceptRide() {
        if viewModel.isInitializeRideMode() {
            viewModel.acceptRide()
        }
    }
    
    func initializeRide() {
        if !viewModel.isInitializeRideMode() {
            viewModel.initializeRide()
        }
    }
    
    func discardRide() {
        if viewModel.isInitializeRideMode() {
            viewModel.discardRide()
        }
    }

}

