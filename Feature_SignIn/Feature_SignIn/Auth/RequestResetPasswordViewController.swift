//
//  ForgotPasswordViewController.swift
//  anony
//
//  Created by Mira Young on 11/24/19.
//  Copyright © 2019 Snaap. All rights reserved.
//

import UIKit

class RequestResetPasswordViewController: UIViewController {
    
    let requestResetPasswordView = RequestResetPasswordView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        setupViews()
    }
    
    
    private func setupViews() {
        view.addSubViewWithFillConstraints(requestResetPasswordView)
        
        // add targets
        requestResetPasswordView.RequestResetPasswordButton.addTarget(self, action: #selector(handleRequestResetPassword), for: .touchUpInside)
    }

    
    @objc func handleRequestResetPassword() {
        
        guard let ifEnteredEmail = requestResetPasswordView.ifEnteredEmail() else {fatalError("RequestResetPasswordViewController, func handleRequestResetPassword, couldn't get ifEnteredEmail")}
        guard let isEmailAddressValid = requestResetPasswordView.isEmailAddressValid() else {fatalError("RequestResetPasswordViewController, func handleRequestResetPassword, couldn't get isEmailAddressValid")}
        
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
        
        //TODO: handle request reset password here (https://aws-amplify.github.io/docs/ios/authentication#forgot-password)
        // this is the 1st step of Forgot Password, which allows users to send their email/username, so we verify if this email has an account with us, if so, we send them a verification code to their email
        print("request reset password for email/username: \(requestResetPasswordView.emailInputView.textField.text ?? "")")
//        AWSMobileClient.default().forgotPassword(username: "my_username") { (forgotPasswordResult, error) in
//            if let forgotPasswordResult = forgotPasswordResult {
//                switch(forgotPasswordResult.forgotPasswordState) {
//                case .confirmationCodeSent:
//                    print("Confirmation code sent via \(forgotPasswordResult.codeDeliveryDetails!.deliveryMedium) to: \(forgotPasswordResult.codeDeliveryDetails!.destination!)")
//                default:
//                    print("Error: Invalid case.")
//                }
//            } else if let error = error {
//                print("Error occurred: \(error.localizedDescription)")
//            }
//        }
        
        //TODO: CURTIS: move this code to success completion handler, to show ResetPasswordViewController
        let email = requestResetPasswordView.emailInputView.textField.text!
        let resetPasswordViewController = ResetPasswordViewController()
        resetPasswordViewController.email = email
        self.navigationController?.pushViewController(resetPasswordViewController, animated: true)
        
    }
}

