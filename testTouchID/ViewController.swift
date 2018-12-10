//
//  ViewController.swift
//  testTouchID
//
//  Created by kaww on 18/11/2018.
//  Copyright © 2018 Kaww. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var accessLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        let context: LAContext = LAContext()
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Login with touchID") { (wasSuccessfull, error) in
                // "DispatchQueue.main" used to execute the code below in the main thread...
                DispatchQueue.main.async {
                    if wasSuccessfull {
                        self.accessLabel.text = "🔓"
                    } else {
                        self.accessLabel.text = "Authentication Error !"
                    }
                }
            }
        }
    }
}

