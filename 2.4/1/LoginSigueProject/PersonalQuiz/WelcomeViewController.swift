//
//  WelcomeViewController.swift
//  PersonalQuiz
//
//  Created by Михаил Зиновьев on 27.10.2021.
//

import UIKit

private enum Constants {
    static let unwindToLoginSegueIdentifier = "unwindToLoginVC"
}

class WelcomeViewController: UIViewController {
    var userName: String = .empty
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var logoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoutButton.layer.cornerRadius = 8
        welcomeLabel.text = "Welcome to screen, \n \(userName)"
    }
    
    @IBAction func logoutButtonPressed() {
        print("Logout pressed")
        
        performSegue(withIdentifier: Constants.unwindToLoginSegueIdentifier, sender: self)
    }
}
