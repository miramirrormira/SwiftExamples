//
//  AccountVerificationViewController.swift
//  anony
//
//  Created by Mira Young on 11/22/19.
//  Copyright © 2019 Snaap. All rights reserved.
//

import UIKit

class AccountVerificationViewController: UIViewController {
    
    let accountVerificationView = AccountVerificationView()
    
    var email: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupViews()
    }
    
    private func setupViews(){
        // add subviews
        view.addSubViewWithFillConstraints(accountVerificationView)
        
        // add target actions
        accountVerificationView.sendVerificationCodeButton.addTarget(self, action: #selector(handleVerifyAccount), for: .touchUpInside)
        accountVerificationView.resendVerificationCodeButton.addTarget(self, action: #selector(handleResendVerificationCode), for: .touchUpInside)
    }
    
    
    
    @objc func handleVerifyAccount() {
        
        guard !self.email.isEmpty else {fatalError("AccountVerificationViewController, func handleVerifyAccount, email is empty")}
        
        //TODO: verify account/email here, link: (https://aws-amplify.github.io/docs/ios/authentication#confirm-signup)
        
        if accountVerificationView.isPINcomplete {
            print("Verify Account")
            
            let pin = accountVerificationView.pinCode
            print("email: \(email)")
            print("verification code: \(pin)")
            
            //TODO: login on success, and show browsing screen
            
        } else {
            
            //TODO: show alert
            print("show alert saying: please put in verification code")
        }
        
    }

    
    
    @objc func handleResendVerificationCode() {
        
        guard !self.email.isEmpty else {fatalError("AccountVerificationViewController, func handleResendVerificationCode, email is empty")}
        
        //TODO: handle user's request to send another verification code, link: (https://aws-amplify.github.io/docs/ios/authentication#re-send-confirmation-code)
        print("Resend Verification Code to \(email)")
        
        //TODO: show alert on success of resending the verification code
    }
    
}
