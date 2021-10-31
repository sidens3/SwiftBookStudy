//
//  LoginViewController.swift
//  PersonalQuiz
//
//  Created by Михаил Зиновьев on 27.10.2021.
//

import UIKit

private enum Constants {
    static let loginSegueIdentifier = "loginSegueIdentifier"
    static let loginTextFieldTag = 0
    static let passwordTextField = 1
}

class LoginViewController: UIViewController {

     
    //MARK: - IBOutlet
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgotLoginButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    // MARK: - Private properties
    private var user = User()
    private var userLogin = ""
    private var userPassword = ""
    
    //MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 8
        
        loginTextField.delegate = self
        loginTextField.tag = Constants.loginTextFieldTag
        loginTextField.returnKeyType = .next
        
        passwordTextField.delegate = self
        passwordTextField.tag = Constants.passwordTextField
        passwordTextField.returnKeyType = .done
        
        userLogin = user.authData.login
        userPassword = user.authData.password
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        
        hideKeyboard()
    }
    
    //MARK: - IBAction
    @IBAction private func loginButtonPressed() {
        let loginString = loginTextField.text ?? .empty
        let passwordString = passwordTextField.text ?? .empty
        
        view.endEditing(true)
        if authorizationCheck(login: loginString, password: passwordString) {
            self.performSegue(withIdentifier: Constants.loginSegueIdentifier, sender: self)
        }
    }
    
    @IBAction func forgotLoginButtonPressed() {
        showAlert(title: "Forgot login?", message: "Don't worry. Your login is: \(userLogin)")
    }
    
    @IBAction func forgotPasswordButtonPressed() {
        showAlert(title: "Forgot password?", message: "Don't worry. Your password is: \(userPassword)")
    }
    
    @IBAction func unwind (_ seg: UIStoryboardSegue) {
        loginTextField.text = .empty
        passwordTextField.text = .empty
    }
    
    //MARK: - Privite
    private func authorizationCheck(login: String, password: String) -> Bool {
//        if login != .empty {
//            if login == userLogin && password == userPassword {
//                return true
//            } else {
//                showAlert(title: "Authintification error", message: "Incorrect login or password")
//            }
//
//        } else {
//            showAlert(title: "Authintification error", message: "Empty login field")
//            return false
//        }
//        return false
        //todo
//        uncomment after develop
        return true
    }
    
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        guard let tabBarControllers = tabBarController.viewControllers else { return }

        for tabBarController in tabBarControllers {
            if let welcomeViewController = tabBarController as? WelcomeViewController {
                welcomeViewController.userName = user.data.name
                welcomeViewController.userSecondName = user.data.secondName
            } else if let navigationVC = tabBarController as? UINavigationController {
                let aboutMeViewController = navigationVC.topViewController as! AboutMeViewController
                aboutMeViewController.navigationItem.title = "About"
            }
        } 
    }
}

//MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        switch textField.tag {
        
        case Constants.loginTextFieldTag:
            passwordTextField.becomeFirstResponder()
            
        case Constants.passwordTextField:
            textField.endEditing(true)
            
        default:
            hideKeyboard()
        }
        return true
    }
}
