//
//  ForgotPasswordView.swift
//  anony
//
//  Created by Mira Young on 11/24/19.
//  Copyright © 2019 Snaap. All rights reserved.
//

// MARK: - Preview

// Its important that you wrap your preview logic in this `#if`

//#if canImport(SwiftUI) && DEBUG
//
//import SwiftUI
//
//// Create a struct conforming to `UIViewPreviewProvider` and `PreviewProvider`
//@available(iOS 13.0, *)
//struct ProfileView_Preview: PreviewProvider, UIViewPreviewProvider {
//
//    // Provide some views to preview
//    static let uiPreviews: [Preview] = {
//
//        let view = RequestResetPasswordView()
//        let preview = Preview(view, displayName: "Account Verification")
//
//        return [
//            preview
//        ]
//    }()
//}
//#endif


import UIKit

class RequestResetPasswordView: UIView {
    
    let emailInputView = TextInputWithUnderline(placeHolder: "Email", height: 40, keyboardType: .emailAddress, isSecureTextEntry: false)
    let RequestResetPasswordButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //TODO: set the background
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        
        setupStyle()
        setupViews()
    }
    
    private func setupStyle() {
        
        // RequestResetPasswordButton
        RequestResetPasswordButton
            |> Design.roundedOrangeStyle
            <> UI.View.shadow
            <> UI.Button.title(title: "Reset my password")
        
    }
    
    private func setupViews() {
        
        addSubview(emailInputView)
        addSubview(RequestResetPasswordButton)
        
        // emailTextField
        emailInputView.topAnchor.constraint(
            equalTo: self.topAnchor, constant: 150
        ).isActive = true
        emailInputView.widthAnchor.constraint(
            equalToConstant: UIScreen.main.bounds.width * 0.9
        ).isActive = true
        emailInputView.centerXAnchor.constraint(
            equalTo: self.centerXAnchor
        ).isActive = true
        emailInputView.heightAnchor.constraint(
            equalToConstant: 40
        ).isActive = true
        
        // RequestResetPasswordButton
        RequestResetPasswordButton.topAnchor.constraint(
            equalTo: emailInputView.bottomAnchor, constant: 20
        ).isActive = true
        RequestResetPasswordButton.heightAnchor.constraint(
            equalToConstant: 40
        ).isActive = true
        RequestResetPasswordButton.widthAnchor.constraint(
            equalToConstant: UIScreen.main.bounds.width * 0.6
        ).isActive = true
        RequestResetPasswordButton.centerXAnchor.constraint(
            equalTo: self.centerXAnchor
        ).isActive = true
        
//        RequestResetPasswordButton.bottomAnchor.constraint(
//            equalTo: self.bottomAnchor
//        ).isActive = true
    }
    
    func ifEnteredEmail() -> Bool? {
        return Helpers.isTextFieldEmpty(textField: emailInputView.textField)
    }
    
    func isEmailAddressValid() -> Bool? {
        guard let emailString = emailInputView.textField.text else { return nil}
        return Helpers.isEmailAddressValid(emailString: emailString)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
