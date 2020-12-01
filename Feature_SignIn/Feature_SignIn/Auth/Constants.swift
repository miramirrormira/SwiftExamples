//
//  Constant.swift
//  anony
//
//  Created by Mira Young on 11/22/19.
//  Copyright © 2019 Snaap. All rights reserved.
//

import Foundation

struct ANIMATION {
    static let SLOW = 0.5
    static let NORMAL = 0.4
    static let FAST = 0.3
    static let SHAKE_COUNT: Float = 3.0
    static let SHAKE_TRANSLATION: Float = 3.0
    static let SHAKE_TIME = 0.2
    static let FLIP_SHAKE = 0.3
}

enum PasswordRequirements {
    case containsLowercaseLetter
    case containsUppercaseLetter
    case containsNumber
    case containsMinimumCharacters
    
    func message(minCharacter: Int) -> String{
        switch self {
            case .containsLowercaseLetter:
                return "must contains one lowercase letter"
            case .containsUppercaseLetter:
                return "must contains one uppercase letter"
            case .containsNumber:
                return "must contains one number"
            case .containsMinimumCharacters:
                return "must contains at least \(minCharacter) characters"
        }
    }
}
