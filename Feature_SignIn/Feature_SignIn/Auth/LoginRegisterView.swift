//
//  LoginRegisterView.swift
//  anony
//
//  Created by Mira Young on 11/22/19.
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
//        let loginRegisterView = LoginRegisterView()
//        let loginRegisterPreview = Preview(loginRegisterView, displayName: "Login Register")
//
//        return [
//            loginRegisterPreview
//        ]
//    }()
//}
//#endif



import UIKit

class LoginRegisterView: UIView {
    
    struct Constants {
        static let loginTitle = "Login"
        static let emailTitle = "Email"
        static let passwordTitle = "Password"
        static let confirmPasswordTitle = "Confirm Password"
        static let registerTitle = "Register"
        static let forgotPasswordTitle = "Forgot my password"
        static let inputFieldHeight = 40
        static let passwordRequirementHeight = 60
        static let minimumPasswordCharacters = 8
    }
    
    let loginRegisterButton = UIButton()
    let forgotPasswordButton = UIButton()
    let emailInputView = TextInputWithUnderline(placeHolder: Constants.emailTitle, height: 40, keyboardType: .emailAddress, isSecureTextEntry: false)
    let passwordInputView = TextInputWithUnderline(placeHolder: Constants.passwordTitle, height: 40, keyboardType: .default, isSecureTextEntry: true)
    let confirmPasswordInputView = TextInputWithUnderline(placeHolder: Constants.confirmPasswordTitle, height: 0, keyboardType: .default, isSecureTextEntry: true)
    let loginRegisterInputView = UIView()
    let passwordRequirementStackView = UIStackView()
    let mustHaveNumberLabel = UILabel()
    let mustHaveUppercaseLabel = UILabel()
    let mustHaveLowercaseLabel = UILabel()
    let mustHaveMinimumCharactersLabel = UILabel()
    
    lazy var loginRegisterSegmentedControl = UISegmentedControl(items: [Constants.loginTitle, Constants.registerTitle])
    
    var loginRegisterViewHeightConstraint : NSLayoutConstraint?
    var passwordRequirementHeightConstraint: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //TODO: MIRA: set the background
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        
        setupViews()
        setupStyle()
        resetPasswordRequirementLabels()
    }
    
    private func setupStyle() {
        
        // loginRegisterView
        loginRegisterInputView
            |> UI.View.translatesAutoResizingMask(false)
            <> UI.View.background(.clear)
        
        // loginRegisterButton
        //TODO: Restyle this button!
        loginRegisterButton
            |> Design.roundedOrangeStyle
            <> UI.View.shadow
            <> UI.Button.title(title: Constants.loginTitle)
        
        // verifyAccountButton
        forgotPasswordButton
            |> Design.smallTextButton
            <> UI.Button.title(title: Constants.forgotPasswordTitle)
        
        // loginRegisterSegmentedControl
        loginRegisterSegmentedControl
            |> UI.View.translatesAutoResizingMask(false)
            <> UI.View.tintColor(.white)
            <> { $0.selectedSegmentIndex = 0 }
            <> { $0.addTarget(self, action: #selector(self.handleLoginRegisterChange), for: .valueChanged)}
        
        // passwordRequirementStackView
        passwordRequirementStackView
            |> Design.verticalFillEquallyStackView
        
        // mustHaveNumberLabel
        mustHaveNumberLabel
            |> Design.smallTextLabel
        
        // mustHaveUppercaseLabel
        mustHaveUppercaseLabel
            |> Design.smallTextLabel
        
        // mustHaveLowercaseLabel
        mustHaveLowercaseLabel
            |> Design.smallTextLabel
        
        // mushHaveCharactersNumberLabel
        mustHaveMinimumCharactersLabel
            |> Design.smallTextLabel
        
        // passwordInputView
        passwordInputView.textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
    }
    
    private func setupViews() {
        
        addSubview(loginRegisterSegmentedControl)
        addSubview(loginRegisterInputView)
        loginRegisterInputView.addSubview(emailInputView)
        loginRegisterInputView.addSubview(passwordInputView)
        loginRegisterInputView.addSubview(confirmPasswordInputView)
        loginRegisterInputView.addSubview(passwordRequirementStackView)
        passwordRequirementStackView.addArrangedSubview(mustHaveNumberLabel)
        passwordRequirementStackView.addArrangedSubview(mustHaveLowercaseLabel)
        passwordRequirementStackView.addArrangedSubview(mustHaveUppercaseLabel)
        passwordRequirementStackView.addArrangedSubview(mustHaveMinimumCharactersLabel)
        addSubview(loginRegisterButton)
        addSubview(forgotPasswordButton)
        
        // loginRegisterSegmentedControl
        loginRegisterSegmentedControl.topAnchor.constraint(
            equalTo: self.topAnchor,
            constant: 150
        ).isActive = true
        loginRegisterSegmentedControl.heightAnchor.constraint(
            equalToConstant: 40
        ).isActive = true
        loginRegisterSegmentedControl.widthAnchor.constraint(
            equalToConstant: UIScreen.main.bounds.width * 0.8
        ).isActive = true
        loginRegisterSegmentedControl.centerXAnchor.constraint(
            equalTo: self.centerXAnchor
        ).isActive = true
        
        // loginRegisterView
        loginRegisterInputView.topAnchor.constraint(
            equalTo: loginRegisterSegmentedControl.bottomAnchor,
            constant: 20
        ).isActive = true
        loginRegisterInputView.leadingAnchor.constraint(
            equalTo: self.leadingAnchor
        ).isActive = true
        loginRegisterInputView.trailingAnchor.constraint(
            equalTo: self.trailingAnchor
        ).isActive = true
        loginRegisterViewHeightConstraint = loginRegisterInputView.heightAnchor.constraint(equalToConstant: CGFloat(Constants.inputFieldHeight * 2))
        loginRegisterViewHeightConstraint?.isActive = true
        
        // emailInputView
        emailInputView.topAnchor.constraint(
            equalTo: loginRegisterInputView.topAnchor
        ).isActive = true
        emailInputView.centerXAnchor.constraint(
            equalTo: loginRegisterInputView.centerXAnchor
        ).isActive = true
        emailInputView.widthAnchor.constraint(
            equalToConstant: UIScreen.main.bounds.width * 0.9
        ).isActive = true
        
        // passwordInputView
        passwordInputView.topAnchor.constraint(
            equalTo: emailInputView.bottomAnchor
        ).isActive = true
        passwordInputView.centerXAnchor.constraint(
            equalTo: loginRegisterInputView.centerXAnchor
        ).isActive = true
        passwordInputView.widthAnchor.constraint(
            equalToConstant: UIScreen.main.bounds.width * 0.9
        ).isActive = true
        
        // confirmPasswordTextField
        confirmPasswordInputView.bottomAnchor.constraint(
            equalTo: loginRegisterInputView.bottomAnchor
        ).isActive = true
        confirmPasswordInputView.centerXAnchor.constraint(
            equalTo: loginRegisterInputView.centerXAnchor
        ).isActive = true
        confirmPasswordInputView.widthAnchor.constraint(
            equalToConstant: UIScreen.main.bounds.width * 0.9
        ).isActive = true
        
        // passwordRequirementStackView
        passwordRequirementStackView.topAnchor.constraint(
            equalTo: loginRegisterInputView.bottomAnchor,
            constant: 20
        ).isActive = true
        passwordRequirementHeightConstraint = passwordRequirementStackView.heightAnchor.constraint(equalToConstant: 0)
        passwordRequirementHeightConstraint?.isActive = true
        passwordRequirementStackView.widthAnchor.constraint(
            equalToConstant: UIScreen.main.bounds.width * 0.8
        ).isActive = true
        passwordRequirementStackView.centerXAnchor.constraint(
            equalTo: self.centerXAnchor
        ).isActive = true
        
        // loginRegisterButton
        loginRegisterButton.centerXAnchor.constraint(
            equalTo: self.centerXAnchor
        ).isActive = true
        loginRegisterButton.widthAnchor.constraint(
            equalToConstant: UIScreen.main.bounds.width * 0.5
        ).isActive = true
        loginRegisterButton.heightAnchor.constraint(
            equalToConstant: CGFloat(Constants.inputFieldHeight)
        ).isActive = true
        loginRegisterButton.topAnchor.constraint(
            equalTo: passwordRequirementStackView.bottomAnchor,
            constant: 20
        ).isActive = true
        
        // forgotPasswordButton
        forgotPasswordButton.topAnchor.constraint(
            equalTo: loginRegisterButton.bottomAnchor,
            constant: 20
        ).isActive = true
        forgotPasswordButton.centerXAnchor.constraint(
            equalTo: self.centerXAnchor
        ).isActive = true
        forgotPasswordButton.heightAnchor.constraint(
            equalToConstant: 20
        ).isActive = true
        forgotPasswordButton.widthAnchor.constraint(
            equalToConstant: UIScreen.main.bounds.width * 0.5
        ).isActive = true
        
        
//        forgotPasswordButton.bottomAnchor.constraint(
//            equalTo: self.bottomAnchor
//        ).isActive = true
    }
    
    @objc func handleLoginRegisterChange() {
        
        // empty all text field
        emailInputView.textField.text = ""
        passwordInputView.textField.text = ""
        confirmPasswordInputView.textField.text = ""
        
        // reset password requirement labels
        if loginRegisterSegmentedControl.selectedSegmentIndex == 1 {
            resetPasswordRequirementLabels()
        }
        
        // animation
        var animation: UIView.AnimationOptions!
        
        if self.loginRegisterSegmentedControl.selectedSegmentIndex == 0 {
            animation = UIView.AnimationOptions.transitionFlipFromRight
        } else {
            animation = UIView.AnimationOptions.transitionFlipFromLeft
        }
        
        UIView.transition(with: loginRegisterInputView, duration: ANIMATION.FLIP_SHAKE, options: animation, animations: {
            self.loginRegisterViewHeightConstraint?.isActive = false
            self.loginRegisterViewHeightConstraint?.constant = self.loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? CGFloat(Constants.inputFieldHeight * 2) : CGFloat(Constants.inputFieldHeight * 3)
            self.loginRegisterViewHeightConstraint?.isActive = true
            
            self.confirmPasswordInputView.textSeparatorHeightConstraint?.isActive = false
            self.confirmPasswordInputView.textSeparatorHeightConstraint?.constant = self.loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? CGFloat(0) : CGFloat(1)
            self.confirmPasswordInputView.textSeparatorHeightConstraint?.isActive = true
            
            self.confirmPasswordInputView.textFieldHeightConstraint?.isActive = false
            self.confirmPasswordInputView.textFieldHeightConstraint?.constant = self.loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? CGFloat(0) : CGFloat(40)
            self.confirmPasswordInputView.textFieldHeightConstraint?.isActive = true
            
            self.passwordRequirementHeightConstraint?.isActive = false
            self.passwordRequirementHeightConstraint?.constant = self.loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? CGFloat(0) : CGFloat(Constants.passwordRequirementHeight)
            self.passwordRequirementHeightConstraint?.isActive = true
        }, completion: nil)
        
        UIView.transition(with: loginRegisterButton, duration: ANIMATION.FLIP_SHAKE, options: animation, animations: {
            let title = self.loginRegisterSegmentedControl.titleForSegment(at: self.loginRegisterSegmentedControl.selectedSegmentIndex)
            self.loginRegisterButton.setTitle(title, for: .normal)
        }, completion: nil)
        
        UIView.transition(with: forgotPasswordButton, duration: ANIMATION.FLIP_SHAKE, options: animation, animations: nil, completion: nil)
    }
    
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        guard let password = passwordInputView.textField.text else { fatalError("LoginRegisterView, func textFieldDidChange, couldn't get password") }
        
        if loginRegisterSegmentedControl.selectedSegmentIndex == 1 {
            
            let passwordResults = Helpers.ifPasswordMeetRequirements(passwordString: password, minCharacters: Constants.minimumPasswordCharacters)
            
            updatePasswordRequirementLabel(results: passwordResults, for: PasswordRequirements.containsLowercaseLetter, on: mustHaveLowercaseLabel, minCharacter: Constants.minimumPasswordCharacters)
            updatePasswordRequirementLabel(results: passwordResults, for: PasswordRequirements.containsUppercaseLetter, on: mustHaveUppercaseLabel, minCharacter: Constants.minimumPasswordCharacters)
            updatePasswordRequirementLabel(results: passwordResults, for: PasswordRequirements.containsNumber, on: mustHaveNumberLabel, minCharacter: Constants.minimumPasswordCharacters)
            updatePasswordRequirementLabel(results: passwordResults, for: PasswordRequirements.containsMinimumCharacters, on: mustHaveMinimumCharactersLabel, minCharacter: Constants.minimumPasswordCharacters)
            
        }
    }
    
    private func updatePasswordRequirementLabel(results: [PasswordRequirements:Bool], for requirement: PasswordRequirements, on label: UILabel, minCharacter: Int) {
        if results[requirement]! {
            label.textColor = .green
            label.text = "✔︎ \(requirement.message(minCharacter: minCharacter))"
        } else {
            label.textColor = .gray
            label.text = "✖︎ \(requirement.message(minCharacter: minCharacter))"
        }
    }
    
    private func resetPasswordRequirementLabels() {
        resetPasswordRequirementLabel(on: mustHaveMinimumCharactersLabel, for: PasswordRequirements.containsMinimumCharacters, minCharacter: Constants.minimumPasswordCharacters)
        resetPasswordRequirementLabel(on: mustHaveNumberLabel, for: PasswordRequirements.containsNumber, minCharacter: Constants.minimumPasswordCharacters)
        resetPasswordRequirementLabel(on: mustHaveUppercaseLabel, for: PasswordRequirements.containsUppercaseLetter, minCharacter: Constants.minimumPasswordCharacters)
        resetPasswordRequirementLabel(on: mustHaveLowercaseLabel, for: PasswordRequirements.containsLowercaseLetter, minCharacter: Constants.minimumPasswordCharacters)
    }
    
    private func resetPasswordRequirementLabel(on label: UILabel, for requirement: PasswordRequirements, minCharacter: Int) {
        label.textColor = .gray
        label.text = "✖︎ \(requirement.message(minCharacter: minCharacter))"
    }
    
    func ifEnteredEmail() -> Bool? {
        return Helpers.isTextFieldEmpty(textField: emailInputView.textField)
    }
    
    func ifEnteredPassword() -> Bool? {
        return Helpers.isTextFieldEmpty(textField: passwordInputView.textField)
    }
    
    func ifPasswordsMatched() -> Bool? {
        return Helpers.ifEntriesMatch(firstTextField: passwordInputView.textField, secondTextField: confirmPasswordInputView.textField)
    }
    
    func isEmailAddressValid() -> Bool? {
        guard let emailString = emailInputView.textField.text else { return nil }
        return Helpers.isEmailAddressValid(emailString: emailString)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
