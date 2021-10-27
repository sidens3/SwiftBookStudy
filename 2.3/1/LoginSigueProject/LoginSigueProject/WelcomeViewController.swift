//
//  WelcomeViewController.swift
//  LoginSigueProject
//
//  Created by Михаил Зиновьев on 27.10.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    var userName = ""
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var logoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = "Welcome to screen, \n \(userName)"
    }
    
    @IBAction func logoutButtonPressed() {
        print("Logout pressed")
        
        self.dismiss(animated: true, completion: nil)
    }
}
