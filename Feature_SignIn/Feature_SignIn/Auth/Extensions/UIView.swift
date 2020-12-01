//
//  UIView.swift
//  anony
//
//  Created by Mira Young on 11/25/19.
//  Copyright © 2019 Snaap. All rights reserved.
//


import UIKit

extension UIView {
    func addSubViewWithFillConstraints(_ view: UIView) {
        self.addSubview(view)
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            view.topAnchor.constraint(equalTo: self.topAnchor),
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

extension CGPoint {
    func scale(to size: CGSize) -> CGPoint {
        return CGPoint(x: x * size.width, y: y * size.height)
    }
    
    func scale(to rect: CGRect) -> CGPoint {
        return CGPoint(x: x * rect.width, y: y * rect.height)
    }
    
    func scale(to ratio: CGFloat) -> CGPoint {
        return CGPoint(x: x * ratio, y: y * ratio)
    }
}

extension CGSize {
    func scale(to ratio: CGFloat) -> CGSize {
        return CGSize(width: width * ratio, height: height * ratio)
    }
}

