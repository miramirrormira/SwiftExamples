//
//  ViewController.swift
//  anony
//
//  Created by Curtis Colly on 11/22/19.
//  Copyright © 2019 Snaap. All rights reserved.
//

import UIKit

class LoginRegisterViewController: UIViewController, UITextFieldDelegate {

    var loginRegisterView = LoginRegisterView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupViews()
        
    }
    
    
    private func setupViews(){
        // add subviews
        view.addSubViewWithFillConstraints(loginRegisterView)
        
        // add target actions
        loginRegisterView.loginRegisterButton.addTarget(self, action: #selector(handleLoginRegister), for: .touchUpInside)
        loginRegisterView.forgotPasswordButton.addTarget(self, action: #selector(handleForgotPassword), for: .touchUpInside)
        
    }
    
    @objc func handleLoginRegister(){
        if loginRegisterView.loginRegisterSegmentedControl.selectedSegmentIndex == 0 {
            handleLogin()
        } else {
            handleRegister()
        }
    }
    
    @objc func handleForgotPassword(){
        print("clicked forgot password button")
        let requestResetPasswordViewController = RequestResetPasswordViewController()
        self.navigationController?.pushViewController(requestResetPasswordViewController, animated: true)
    }
    
    //TODO: AWS auth
    func handleLogin() {
        guard let ifEnteredEmail = loginRegisterView.ifEnteredEmail() else {fatalError("LoginRegisterViewController, func handleLogin, couldn't get ifEnteredEmail")}
        guard let isEmailAddressValid = loginRegisterView.isEmailAddressValid() else {fatalError("LoginRegisterViewController, func handleLogin, couldn't get isEmailAddressValid")}
        guard let ifEnteredPassword = loginRegisterView.ifEnteredPassword() else {fatalError("LoginRegisterViewController, func handleLogin, couldn't get ifEnteredPassword")}
        
        if !ifEnteredEmail {
            //TODO: show alert
            print("Please enter your email")
            return
        }
        
        if !isEmailAddressValid {
            //TODO: show alert
            print("Please enter valid email address")
            return
        }
        
        if !ifEnteredPassword {
            //TODO: show alert
            print("Please enter your password")
            return
        }
        
        
        //TODO: handle login here
        let email = loginRegisterView.emailInputView.textField.text!
        let password = loginRegisterView.passwordInputView.textField.text!
        print("login for email: \(email), and password: \(password)")
        
    }
    
    func handleRegister() {
        
        guard let ifEnteredEmail = loginRegisterView.ifEnteredEmail() else {fatalError("LoginRegisterViewController, func hangleRegister, couldn't get ifEnteredEmail")}
        guard let ifEnteredPassword = loginRegisterView.ifEnteredPassword() else {fatalError("LoginRegisterViewController, func hangleRegister, couldn't get ifEnteredPassword")}
        guard let ifPasswordsMatched = loginRegisterView.ifPasswordsMatched() else {fatalError("LoginRegisterViewController, func hangleRegister, couldn't get ifPasswordsMatched")}
        guard let isEmailAddressValid = loginRegisterView.isEmailAddressValid() else {fatalError("LoginRegisterViewController, func hangleRegister, couldn't get isEmailAddressValid")}
        
        if !ifEnteredEmail {
            //TODO: show alert
            print("Please enter your email")
            return
        }
        
        if !isEmailAddressValid {
            //TODO: show alert
            print("Please enter valid email address")
            return
        }
        
        if !ifEnteredPassword {
            //TODO: show alert
            print("Please enter your password")
            return
        }
        
        if !ifPasswordsMatched {
            //TODO: show alert
            print("passwords doesn't match!")
            return
        }
        
        //TODO: handle register here
        let email = loginRegisterView.emailInputView.textField.text!
        let password = loginRegisterView.passwordInputView.textField.text!
        print("register for email: \(email), and password: \(password)")
        
        
        //TODO: move this code to register success completion closer, in order to show accountVerificationViewController on success
        let accountVerificationViewController = AccountVerificationViewController()
        accountVerificationViewController.email = email
        self.navigationController?.pushViewController(accountVerificationViewController, animated: true)
        
    }
    
}

