

//
//  Tiger.swift
//  LionsAndTigers
//
//  Created by Hermann Weder on 2014/10/02.
//  Copyright (c) 2014 Hermann. All rights reserved.
//

import Foundation
import UIkit


struct Tiger
{
    var age = 0
    var name = ""
    var breed = ""
    var image = UIImage(named: "")
    
    // instance function
    
    func chuff() {
        println("Tiger: Chuff Chuff")
    }
    
    func chuffANumberOfTimes (numberOfTimes: Int) {
        for var chuff = 0; chuff < numberOfTimes; ++chuff {
            self.chuff()
        }
    }
    
    
    func chuffANumberOfTimes (numberOfTimes: Int, isLoud: Bool) {
        for var chuffTimes = 1; chuffTimes <= numberOfTimes; chuffTimes++ {
            if isLoud {
                chuff()
            }
            else {
                println("Tiger: purr purr:")
            }
        }
    }
    
    func ageInTigerYearsFromAge(regularAge: Int) -> Int {
        let newAge = regularAge * 3
        return newAge
    }
    
    func randomFact() -> String {
        let randomNumber = Int(arc4random_uniform(UInt32(3)))
        var randomFact : String
        if randomNumber == 0 {
            randomFact = "The tiger is the biggest species in the cat family"
        } else if randomNumber == 1 {
            randomFact = "Tiger's can reach a length of 3.3 m"
        } else  {
            randomFact = "A group of tigers is known as an 'ambush' or 'streak'"
        }
        
        return randomFact
    }
}
