//
//  FibonacciSequence.swift
//  FibonacciApp
//
//  Created by Gerald Dunn on 2/6/15.
//  Copyright (c) 2015 Gerald Dunn. All rights reserved.
//

import Foundation


class FibonacciSequence {
    
    let includesZero: Bool
    let values: [UInt64]
    
    
    init(maxNumber: UInt64, includesZero: Bool) {
        self.includesZero = includesZero
        //TODO: Create an array which contains the numbers in the Fibonacci sequence, but don't add any numbers to the array which exceed the maxNumber. For example, if the maxNumber is 10 then the array should contain [0,1,1,2,3,5,8] because the next number is 13 which is higher than the maxNumber. If includesZero is false then you should not include the number 0 in the sequence.
        var fibArray = [UInt64]()
        if (includesZero) {
            fibArray.append(0)
            fibArray.append(1)
        }
        else
        {
            fibArray.append(1)
            fibArray.append(1)
        }
        
        var counter = 2
        var newSum : UInt64 = 0
        while (newSum < maxNumber) {
            // println(fibArray.count)
            //println(counter)
            var lastNum = fibArray[counter-1]
            var secondLastNum = fibArray[counter-1]
            newSum = lastNum + secondLastNum
            let (newSum, didOverflow) = UInt64.addWithOverflow(lastNum, secondLastNum)
            if didOverflow {
                println("Red Alert - Overflow!")
            }
            if (newSum <= maxNumber) {
                fibArray.append(newSum)
            }
            ++counter
        }
        self.values = fibArray
    }
    
    init(numberOfItemsInSequence: UInt64, includesZero: Bool) {
        self.includesZero = includesZero
        //TODO: Create an array which contains the numbers in the Fibonacci sequence, and the array should contain this many items: numberOfItemsInSequence. For example, if numberOfItemsInSequence is 10 then the array should contain [0,1,1,2,3,5,8,13,21,34] if inlcudesZero is true, or [1,1,2,3,5,8,13,21,34,55] if includesZero is false.
        
        var fibArray = [UInt64]()
        if (includesZero) {
            fibArray.append(0)
            fibArray.append(1)
        }
        else
        {
            fibArray.append(1)
            fibArray.append(1)
        }
        
        for var index = 2; index < numberOfItemsInSequence-3; ++index {
            fibArray.append(fibArray[index-2]+fibArray[index-1])
            //println(fibArray.last)
        }
        
        self.values = fibArray
        
    }
}
