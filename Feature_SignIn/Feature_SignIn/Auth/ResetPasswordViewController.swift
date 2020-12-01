//
//  ResetPasswordViewController.swift
//  anony
//
//  Created by Mira Young on 11/25/19.
//  Copyright © 2019 Snaap. All rights reserved.
//

import UIKit

class ResetPasswordViewController: UIViewController {

    let resetPasswordView = ResetPasswordView()
    var email: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupViews()
    }
    
    private func setupViews() {
        view.addSubViewWithFillConstraints(resetPasswordView)
        
        // add target
        resetPasswordView.resetPasswordButton.addTarget(self, action: #selector(handleResetPassword), for: .touchUpInside)
    }
    
    @objc func handleResetPassword(){
        
        guard let enteredPassword = resetPasswordView.ifEnteredNewPassword() else { fatalError("ResetPasswordViewController, func handleResetPassword, couldn't get enteredPassword")}
        guard let isPasswordMatched = resetPasswordView.ifPasswordsMatched() else { fatalError("ResetPasswordViewController, func handleResetPassword, couldn't get isPasswordMatched") }
        
        if !enteredPassword {
            //TODO: show alert "No Password Entered"
            
            print("No Password Entered")
            return
        }
        
        
        if !isPasswordMatched {
            //TODO: show alert "Passwords does NOT match"
            
            print("passwords does NOT match")
            return
        }
        
        if !resetPasswordView.isPINcomplete {
            //TODO: show alert "enter PIN"
            
            print("neet to enter PIN number")
            return
        }
        
        
        
        //TODO: reset password (https://aws-amplify.github.io/docs/ios/authentication#forgot-password)
        // this is the 2nd step of Forgot Password, where we send email/username, new password, and verification code, to change the password
        
        print("reset password")
//        AWSMobileClient.default().confirmForgotPassword(username: "my_username", newPassword: "MyNewPassword123!!", confirmationCode: "ConfirmationCode") { (forgotPasswordResult, error) in
//            if let forgotPasswordResult = forgotPasswordResult {
//                switch(forgotPasswordResult.forgotPasswordState) {
//                case .done:
//                    print("Password changed successfully")
//                default:
//                    print("Error: Could not change password.")
//                }
//            } else if let error = error {
//                print("Error occurred: \(error.localizedDescription)")
//            }
//        }
        
        
    }


}
