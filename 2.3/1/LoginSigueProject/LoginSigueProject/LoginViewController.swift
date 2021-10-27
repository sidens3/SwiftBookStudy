//
//  ViewController.swift
//  LoginSigueProject
//
//  Created by Михаил Зиновьев on 27.10.2021.
//

import UIKit

private enum Constants {
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
        
        loginButton.layer.cornerRadius = 8
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        
        hideKeyboard()
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
    
    @IBAction func unwind (_ seg: UIStoryboardSegue) {
        loginTextField.text = .empty
        passwordTextField.text = .empty
    }
    
    //MARK: - Privite
    private func authorizationCheck(login: String, password: String) -> Bool {
        //todo
        if login != .empty {
            // Тут выполняется авторизация, где false - неудачная автоизация, а true - удачная
            return true
        } else {
            showErrorAlert(with: "Empty login field")
            return false
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.loginSegueIdentifier {
            let vc = segue.destination as! WelcomeViewController
            vc.userName = loginTextField.text ?? .empty
        }
    }
    
    private func showErrorAlert(with message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil ))
        self.present(alert, animated: true, completion: nil)
    }
}

//MARK: - String
extension String {
    static let empty = ""
}

//MARK: - UIViewController
extension UIViewController
{
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))

        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}
