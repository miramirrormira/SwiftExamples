//
//  AccountVerificationView.swift
//  anony
//
//  Created by Mira Young on 11/22/19.
//  Copyright © 2019 Snaap. All rights reserved.
//

// MARK: - Preview
//
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
//        let view = AccountVerificationView()
//        let preview = Preview(view, displayName: "Account Verification")
//
//        return [
//            preview
//        ]
//    }()
//}
//#endif


import UIKit

class AccountVerificationView: UIView {

    lazy var pinCodeView: PinCodeView = {
        let view = PinCodeView()
        return view
    }()
    
    let sendVerificationCodeButton = UIButton()
    let resendVerificationCodeButton = UIButton()

    var isPINcomplete: Bool = false
    var pinCode: String = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //TODO: set the background
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        
        preparePinCodeView()
        setupStyle()
        setupViews()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        endEditing(true)
    }
    
    private func preparePinCodeView() {
        self.pinCodeView.onPinInputComplete = {[unowned self] (completed, pinCode) in
            self.isPINcomplete = completed
            self.pinCode = pinCode
        }
        self.pinCodeView.pinDigits = 6
    }
    
    private func setupStyle() {
        
        // sendVerificationCodeButton
        sendVerificationCodeButton
            |> Design.roundedOrangeStyle
            <> UI.View.shadow
            <> UI.Button.title(title: "Send Verification Code")
        
        // resendVerificationCodeButton
        resendVerificationCodeButton
            |> Design.smallTextButton
            <> UI.Button.title(title: "Resend Verification Code")
        
    }
    
    private func setupViews() {

        addSubview(pinCodeView)
        addSubview(sendVerificationCodeButton)
        addSubview(resendVerificationCodeButton)
        
        // pinCodeView
        pinCodeView.topAnchor.constraint(
            equalTo: self.topAnchor,
            constant: 150
        ).isActive = true
        pinCodeView.widthAnchor.constraint(
            equalToConstant: UIScreen.main.bounds.width
        ).isActive = true
        pinCodeView.centerXAnchor.constraint(
            equalTo: self.centerXAnchor
        ).isActive = true
        pinCodeView.heightAnchor.constraint(
            equalToConstant: 50
        ).isActive = true
        
        // sendVerificationCodeButton
        sendVerificationCodeButton.topAnchor.constraint(
            equalTo: pinCodeView.bottomAnchor, constant: 20
        ).isActive = true
        sendVerificationCodeButton.widthAnchor.constraint(
            equalToConstant: UIScreen.main.bounds.width * 0.7
        ).isActive = true
        sendVerificationCodeButton.heightAnchor.constraint(
            equalToConstant: 40
        ).isActive = true
        sendVerificationCodeButton.centerXAnchor.constraint(
            equalTo: self.centerXAnchor
        ).isActive = true
        
        
        // resendVerificationCodeButton
        resendVerificationCodeButton.topAnchor.constraint(
            equalTo: sendVerificationCodeButton.bottomAnchor,
            constant: 20
        ).isActive = true
        resendVerificationCodeButton.heightAnchor.constraint(
            equalToConstant: 20
        ).isActive = true
        resendVerificationCodeButton.widthAnchor.constraint(
            equalToConstant: UIScreen.main.bounds.width * 0.7
        ).isActive = true
        resendVerificationCodeButton.centerXAnchor.constraint(
            equalTo: self.centerXAnchor
        ).isActive = true
        
//        resendVerificationCodeButton.bottomAnchor.constraint(
//            equalTo: self.bottomAnchor
//        ).isActive = true
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
