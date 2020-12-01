//
//  ViewController.swift
//  ObjC_n_cpp
//
//  Created by Mira Young on 11/30/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
//        var numberArray = (0..<999).map{ _ in Int32(Int.random(in: 1 ... 100))}
//        let arrayPointer = UnsafeMutablePointer(&numberArray)
        
        // call c code
//        bubbleSortC(arrayPointer, Int32(numberArray.count))
        
        
        // call cpp code
//        CppTest_Wrapper().bubbleSort_Wrapper(arrayPointer, Int32(numberArray.count))
        
        
        var numberArray = (0..<999).map{ _ in Int32(Int.random(in: 1 ... 100)) }
        print("🐸 numberArray: \(numberArray)")

        var start = Date()
        bubbleSort(array: numberArray, sizeOfArray: numberArray.count)
        var end = Date()
        print("swift: \(end.timeIntervalSince(start))")


        let arrayPointer = UnsafeMutablePointer(&numberArray)
        start = Date()
        bubbleSortC(arrayPointer, Int32(numberArray.count))
        end = Date()
        print("c: \(end.timeIntervalSince(start))")
        
        start = Date()
        CppTest_Wrapper().bubbleSort_Wrapper(arrayPointer, Int32(numberArray.count))
        end = Date()
        print("c++: \(end.timeIntervalSince(start))")
    }

    
    func bubbleSort(array: [Int32], sizeOfArray: Int) {
        
        var sortedArray = array
        
        var swapped: Bool = false
        
        for i in 0..<sizeOfArray - 1 {
            
            swapped = false
            
            for j in 0..<sizeOfArray - i - 1 {
                
                if sortedArray[j] > sortedArray[j+1] {
                    
                    let temp = sortedArray[j+1]
                    sortedArray[j+1] = sortedArray[j]
                    sortedArray[j] = temp
                    
                    swapped = true
                }
            }
            
            if !swapped {
                break
            }
        }
//        print("🐵 sorted array from swift: \(sortedArray)")
    }

}

