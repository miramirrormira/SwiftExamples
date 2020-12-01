//
//  operator.swift
//  anony
//
//  Created by Mira Young on 11/22/19.
//  Copyright © 2019 Snaap. All rights reserved.
//

precedencegroup ForwardApplication {
  associativity: left
  higherThan: LogicalConjunctionPrecedence
}

infix operator |>: ForwardApplication
func |> <A, B>(a: A, f: (A) -> B) -> B {
    return f(a)
}

precedencegroup SingleTypeComposition  {
    associativity: left
    higherThan: ForwardApplication
}

infix operator <>: SingleTypeComposition
func <> <A: AnyObject>(f: @escaping (A) -> Void, g: @escaping (A) -> Void) -> (A) -> Void {
    return{ a in
        f(a)
        g(a)
    }
}

infix operator !!
func !! <T>(wrapped: T?, failureText: @autoclosure() -> String)->T{
    if let x = wrapped {return x}
    fatalError(failureText())
}
