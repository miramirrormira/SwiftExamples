//
//  Design.swift
//  anony
//
//  Created by Mira Young on 11/22/19.
//  Copyright © 2019 Snaap. All rights reserved.
//

import UIKit

struct Design {
    static let base: (UIView) -> Void = UI.View.translatesAutoResizingMask()
    static let orangeStyle: (UIView) -> Void = UI.View.background(.orange)
    static let roundedCornerStyle: (UIView) -> Void = UI.View.cornerRadius(10)
    static let roundedOrangeStyle: (UIView) -> Void =
        base
            <> orangeStyle
            <> roundedCornerStyle
    
    static let smallTextButton: (UIButton) -> Void =
        base
            <> UI.Button.setTitleColor(color: .darkGray, for: .normal)
            <> UI.Button.setTitleFont(font: .systemFont(ofSize: 10))
    
    static let whiteRoundedTextField: (UITextField) -> Void =
        base
            <> UI.View.borderColor(.lightText)
            <> UI.View.borderWidth(1.0)
            <> UI.View.cornerRadius(2.0)
            <> UI.View.background(.white)
            <> UI.TextField.borderStyle(.none)
    
    static let lightGraySeparator : (UIView) -> Void =
        base
            <> UI.View.background(.lightGray)
            <> { $0.heightAnchor.constraint(equalToConstant: 1.0).isActive = true }
    
    static let smallTextLabel: (UILabel) -> Void =
        base
            <> UI.Label.textColor(.darkGray)
            <> UI.Label.setTextFont(font: .systemFont(ofSize: 10))
    
    static let verticalFillEquallyStackView: (UIStackView) -> Void =
        base
            <> UI.StackView.distribution(.fillEqually)
            <> UI.StackView.backgroundColor(.clear)
            <> UI.StackView.setAxis(.vertical)
    
    
}

struct UI {
    struct View {
        
        static let shadow: (UIView) -> Void = {
            $0.layer.shadowOffset = CGSize(width: 1, height: 1)
            $0.layer.shadowRadius = 2.0
            $0.layer.shadowOpacity = 1.0
        }
        
        
        static func background<T: UIView>(_ color: UIColor) -> (T) -> Void {
            return {
                $0.layer.backgroundColor = color.cgColor
            }
        }
        
        static func tintColor<T: UIView>(_ color: UIColor) -> (T) -> Void {
            return {
                $0.tintColor = color
            }
        }
        
        static func cornerRadius<T: UIView>(_ radius: CGFloat) -> (T) -> Void {
            return {
                $0.layer.cornerRadius = radius
            }
        }
        
        static func borderColor<T: UIView>(_ color: UIColor) -> (T) -> Void {
            return {
                $0.layer.borderColor = color.cgColor
            }
        }
        
        static func borderWidth<T: UIView>(_ width: CGFloat) -> (T) -> Void {
            return {
                $0.layer.borderWidth = width
            }
        }
        
        static func translatesAutoResizingMask<T: UIView>(_ translates: Bool = false) -> (T) -> Void {
            return {
                $0.translatesAutoresizingMaskIntoConstraints = translates
            }
        }
        
    }
    
    struct Button {
        static func title<T: UIButton>(title: String, for state: UIControl.State = .normal) -> (T) -> Void {
            return {
                $0.setTitle(title, for: state)
            }
        }
        static func setTitleColor<T: UIButton>(color: UIColor, for state: UIControl.State) -> (T) -> Void {
            return {
                $0.setTitleColor(color, for: state)
            }
        }
        
        static func setTitleFont<T: UIButton>(font: UIFont) -> (T) -> Void {
            return {
                $0.titleLabel?.font = font
            }
        }
        
        
    }
    
    struct TextField {
        static func textColor<T: UITextField>(_ color: UIColor) -> (T) -> Void {
            return {
                $0.textColor = color
            }
        }
        
        static func borderStyle<T: UITextField>(_ style: UITextField.BorderStyle) -> (T) -> Void {
            return {
                $0.borderStyle = style
            }
        }
    }
    
    struct Label {
        static func text<T: UILabel>(_ text: String) -> (T) -> Void {
            return {
                $0.text = text
            }
        }
        
        static func textColor<T: UILabel>(_ color: UIColor) -> (T) -> Void {
            return {
                $0.textColor = color
            }
        }
        static func setTextFont<T: UILabel>(font: UIFont) -> (T) -> Void {
            return {
                $0.font = font
            }
        }
    }
    
    struct StackView {
        static func setAxis<T: UIStackView>(_ axis: NSLayoutConstraint.Axis) -> (T) -> Void {
            return {
                $0.axis = axis
            }
        }
        static func backgroundColor<T: UIStackView>(_ color: UIColor) -> (T) -> Void {
            return {
                $0.backgroundColor = color
            }
        }
        static func distribution<T: UIStackView>(_ distribution: UIStackView.Distribution) -> (T) -> Void {
            return {
                $0.distribution = distribution
            }
        }
    }
    
    struct Layer {
        static func anchorPoint<T: CALayer>(_ anchorPoint: CGPoint) -> (T) -> Void {
            return {
               $0.anchorPoint = anchorPoint
            }
        }
        static func name<T: CALayer>(_ name: String) -> (T) -> Void {
            return {
               $0.name = name
            }
        }
        static func frame<T: CALayer>(_ frame: CGRect) -> (T) -> Void {
            return {
                $0.frame = frame
            }
        }
        static func position<T: CALayer>(_ position: CGPoint) -> (T) -> Void {
            return {
                $0.position = position
            }
        }
        static func frameSize<T: CALayer>(_ size: CGSize) -> (T) -> Void {
            return {
                $0.frame.size = size
            }
        }
    }
    
//    struct BezierPath {
//        static func flipHorizonally<T: UIBezierPath>(_ width: CGFloat) -> (T) -> Void {
//            let mirrorOverXOrigin = CGAffineTransform(scaleX: -1, y: 1)
//            let translate = CGAffineTransform(translationX: width, y: 0)
//            return {
//                $0.apply(mirrorOverXOrigin)
//                $0.apply(translate)
//            }
//        }
//    }
}
