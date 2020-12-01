//
//  ResetPasswordView.swift
//  anony
//
//  Created by Mira Young on 11/25/19.
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
//        let view = ResetPasswordView()
//        let preview = Preview(view, displayName: "Account Verification")
//
//        return [
//            preview
//        ]
//    }()
//}
//#endif



import UIKit

class ResetPasswordView: UIView {
    
    let newPasswordInputView = TextInputWithUnderline(placeHolder: "New password", height: 40, keyboardType: .default, isSecureTextEntry: true)
    let confirmPasswordInputView = TextInputWithUnderline(placeHolder: "Confirm new password", height: 40, keyboardType: .default, isSecureTextEntry: true)
    
    lazy var pinCodeView: PinCodeView = {
        let view = PinCodeView()
        return view
    }()

    var isPINcomplete: Bool = false
    
    let resetPasswordButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //TODO: set the background
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        
        preparePinCodeView()
        setupStyle()
        setupViews()
    }
    
    private func preparePinCodeView() {
        self.pinCodeView.onPinInputComplete = {[unowned self] (completed, pinCode) in
            self.isPINcomplete = completed
         }
        self.pinCodeView.pinDigits = 6
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        endEditing(true)
    }
    
    private func setupStyle() {
        
        resetPasswordButton
            |> Design.roundedOrangeStyle
            <> UI.View.shadow
            <> UI.Button.title(title: "Reset my password")
    }
    
    private func setupViews() {
        
        addSubview(newPasswordInputView)
        addSubview(confirmPasswordInputView)
        addSubview(pinCodeView)
        addSubview(resetPasswordButton)
        
        // newPasswordInput
        newPasswordInputView.topAnchor.constraint(
            equalTo: self.topAnchor, constant: 150
        ).isActive = true
        newPasswordInputView.widthAnchor.constraint(
            equalToConstant: UIScreen.main.bounds.width * 0.9
        ).isActive = true
        newPasswordInputView.centerXAnchor.constraint(
            equalTo: self.centerXAnchor
        ).isActive = true
        
        
        // confirmPasswordInputView
        confirmPasswordInputView.topAnchor.constraint(
            equalTo: newPasswordInputView.bottomAnchor
        ).isActive = true
        confirmPasswordInputView.widthAnchor.constraint(
            equalToConstant: UIScreen.main.bounds.width * 0.9
        ).isActive = true
        confirmPasswordInputView.centerXAnchor.constraint(
            equalTo: self.centerXAnchor
        ).isActive = true

        
        // pinCodeView
        pinCodeView.topAnchor.constraint(
            equalTo: confirmPasswordInputView.bottomAnchor,
            constant: 20
        ).isActive = true
        pinCodeView.widthAnchor.constraint(
            equalToConstant: UIScreen.main.bounds.width
        ).isActive = true
        pinCodeView.heightAnchor.constraint(
            equalToConstant: 60
        ).isActive = true
        
        // resetPasswordButton
        resetPasswordButton.topAnchor.constraint(
            equalTo: pinCodeView.bottomAnchor,
            constant: 20
        ).isActive = true
        resetPasswordButton.widthAnchor.constraint(
            equalToConstant: UIScreen.main.bounds.width * 0.5
        ).isActive = true
        resetPasswordButton.centerXAnchor.constraint(
            equalTo: self.centerXAnchor
        ).isActive = true
        resetPasswordButton.heightAnchor.constraint(
            equalToConstant: 40
        ).isActive = true
        
//        resetPasswordButton.bottomAnchor.constraint(
//            equalTo: self.bottomAnchor
//        ).isActive = true
    }
    
    func ifPasswordsMatched() -> Bool? {
        return Helpers.ifEntriesMatch(firstTextField: newPasswordInputView.textField, secondTextField: confirmPasswordInputView.textField)
    }
    
    func ifEnteredNewPassword() -> Bool? {
        return Helpers.isTextFieldEmpty(textField: newPasswordInputView.textField)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
