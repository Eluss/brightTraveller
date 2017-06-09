//
//  SuccessViewController.swift
//  BrightTraveller
//
//  Created by Eliasz Sawicki on 09/06/2017.
//  Copyright © 2017 Eliasz Sawicki. All rights reserved.
//

import Foundation
import UIKit

class SuccessViewController: UIViewController {
    
    let backButton = UIButton()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
    }
    
    private func setupButton() {
        backButton.setTitle("Podróż rozpoczęta, naciśnij aby powrócić", for: .normal)
        backButton.setTitleColor(UIColor.lightColor, for: .normal)
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        
        view.addSubview(backButton)
        backButton.autoCenterInSuperview()
    }
    
    func back() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
