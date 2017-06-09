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

    var viewModel: MainViewModel!
    let actionLabel = UILabel()
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.lightColor]
        view.backgroundColor = UIColor.darkColor
        setupView()
        viewModel = MainViewModel(onSwitchToMode: onSwitchToMode)
        viewModel.currentMode = .idle
        AudioPlayer.sharedInstance.playWelcomeAudio()
    }
    
    func onSwitchToMode(mode: MainScreenMode) {
        switch mode {
        case .idle:
            print("Setting UI to idle state")
            self.setupIdleMode()
        case .initializeRide:
            print("Setting UI to ride decision state")
            self.setupRideDecisionMode()
        }
    }
    
    func setupView() {
        setupActionLabel()
    }
    
    func setupActionLabel() {
        actionLabel.textColor = UIColor.lightColor
        view.addSubview(actionLabel)
        actionLabel.autoCenterInSuperview()
        actionLabel.numberOfLines = 0
    }
    
    func setupRideDecisionMode() {
        clearRecognizers()
        let acceptGesture = UITapGestureRecognizer(target: self, action: #selector(acceptRide))
        acceptGesture.numberOfTapsRequired = 2
        let discardGesture = UITapGestureRecognizer(target: self, action: #selector(discardRide))
        
        discardGesture.require(toFail: acceptGesture)
        
        view.addGestureRecognizer(acceptGesture)
        view.addGestureRecognizer(discardGesture)
        
        actionLabel.text = "Taps twice to accept request \nTap once to discard the request"
    }
    
    func setupIdleMode() {
        clearRecognizers()
        let initializeGesture = UITapGestureRecognizer(target: self, action: #selector(initializeRide))
        view.addGestureRecognizer(initializeGesture)
        actionLabel.text = "Tap to start your ride"        
    }
    
    func clearRecognizers() {
        view.gestureRecognizers?.forEach {
            view.removeGestureRecognizer($0)
        }
    }
    
    func acceptRide() {
        viewModel.acceptRide()
    }
    
    func initializeRide() {
        viewModel.initializeRide()
    }
    
    func discardRide() {
        viewModel.discardRide()
        
    }

}

