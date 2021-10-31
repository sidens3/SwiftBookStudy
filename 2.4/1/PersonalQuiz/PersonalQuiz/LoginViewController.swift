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
        showAlert(title: "Forgot login?", message: "Don't worry. Don't use any login to enter")
    }
    
    @IBAction func forgotPasswordButtonPressed() {
        showAlert(title: "Forgot password?", message: "Don't worry. Don't use any password")
    }
    
    @IBAction func unwind (_ seg: UIStoryboardSegue) {
        loginTextField.text = .empty
        passwordTextField.text = .empty
    }
    
    //MARK: - Privite
    private func authorizationCheck(login: String, password: String) -> Bool {
        if login != .empty {
            return true
        } else {
            showAlert(title: "Error", message: "Empty login field")
            return false
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.loginSegueIdentifier {
            let vc = segue.destination as! WelcomeViewController
            vc.userName = loginTextField.text ?? .empty
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
