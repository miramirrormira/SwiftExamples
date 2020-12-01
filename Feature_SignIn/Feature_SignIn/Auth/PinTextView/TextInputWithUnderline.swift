//
//  TextInputWithUnderline.swift
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
//        let view = TextInputWithUnderline(placeHolder: "Email", keyboardType: UIKeyboardType.numberPad)
//        let preview = Preview(view, displayName: "Account Verification")
//
//        return [
//            preview
//        ]
//    }()
//}
//#endif


import UIKit

class TextInputWithUnderline: UIView {
    
    let textField = UITextField()
    let textSeparator = UIView()
    
    var placeHolder: String? {
        didSet { textField.placeholder = placeHolder }
    }
    
    var keyBoardType: UIKeyboardType? {
        didSet {
            if let keyBoardType = keyBoardType {
                textField.keyboardType = keyBoardType
            }
        }
    }
    
    var textFieldHeightConstraint: NSLayoutConstraint?
    var textSeparatorHeightConstraint: NSLayoutConstraint?
    
    init(placeHolder: String, height: CGFloat, keyboardType: UIKeyboardType, isSecureTextEntry: Bool){
        super.init(frame: CGRect.zero)
        
        textField.placeholder = placeHolder
        textField.keyboardType = keyboardType
        textField.isSecureTextEntry = isSecureTextEntry
        
        //TODO: set the background
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false

        setupStyle()
        setupViews(height: height)
    }

    private func setupStyle() {
        textField
            |> UI.View.translatesAutoResizingMask(false)
            <> UI.TextField.textColor(.black)
        
        textSeparator
            |> UI.View.translatesAutoResizingMask(false)
            <> UI.View.background(.lightGray)
    }
    
    private func setupViews(height: CGFloat) {
        addSubview(textField)
        addSubview(textSeparator)
        
        // textField
        textField.topAnchor.constraint(
            equalTo: self.topAnchor
        ).isActive = true
        textField.widthAnchor.constraint(
            equalTo: self.widthAnchor, multiplier: 0.9
        ).isActive = true
        textField.centerXAnchor.constraint(
            equalTo: self.centerXAnchor
        ).isActive = true
        textFieldHeightConstraint = textField.heightAnchor.constraint(equalToConstant: height)
        textFieldHeightConstraint?.isActive = true
        
        // textSeparator
        textSeparator.widthAnchor.constraint(
            equalTo: self.widthAnchor
        ).isActive = true
        textSeparator.bottomAnchor.constraint(
            equalTo: textField.bottomAnchor
        ).isActive = true
        if height > 1 {
            textSeparatorHeightConstraint = textSeparator.heightAnchor.constraint(equalToConstant: 1)
            textSeparatorHeightConstraint?.isActive = true
        } else if height == 0 {
            textSeparatorHeightConstraint = textSeparator.heightAnchor.constraint(equalToConstant: 0)
            textSeparatorHeightConstraint?.isActive = true
        }
        
        textField.bottomAnchor.constraint(
            equalTo: self.bottomAnchor
        ).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
