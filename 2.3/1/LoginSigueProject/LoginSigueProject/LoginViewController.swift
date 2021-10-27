//
//  ViewController.swift
//  LoginSigueProject
//
//  Created by Михаил Зиновьев on 27.10.2021.
//

import UIKit

enum Constants {
    static let loginSegueIdentifier = "loginSegueIdentifier"
}

class LoginViewController: UIViewController {

     
    //MARK: - IBOutlet
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    //MARK: - Life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        loginButton.layer.cornerRadius = 8
    }
    
    //MARK: - IBAction
    @IBAction private func loginButtonPressed() {
        let loginString = loginTextField.text ?? .empty
        let passwordString = passwordTextField.text ?? .empty
        
        if authorizationCheck(login: loginString, password: passwordString) {
            self.performSegue(withIdentifier: Constants.loginSegueIdentifier, sender: self)
        } else {
            print("Ошибка авторизации")
        }
    }
    
    //MARK: - Privite
    private func authorizationCheck(login: String, password: String) -> Bool {
        //todo
        // Тут выполняется авторизация, где false - неудачная автоизация, а true - удачная и проверка на пустые значения
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.loginSegueIdentifier {
            let vc = segue.destination as! WelcomeViewController
            vc.userName = loginTextField.text ?? .empty
        }
    }
}

//MARK: - String
extension String {
    static let empty = ""
}
