//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by Hermann Weder on 2014/10/02.
//  Copyright (c) 2014 Hermann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!

    @IBOutlet weak var randomFactLabel: UILabel!
    // set property array myTigers hold Tiger instances set array equal to empty array : we know array exists, so we can add to array that exists, not optional that might be nil, array not existing
    
    var myTigers:[Tiger] = []
    
    
    var currentIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var myTiger = Tiger()
        myTiger.name = "Tigger"
        myTiger.breed = "Bengal"
        myTiger.age = 3
        myTiger.image = UIImage(named: "BengalTiger.jpg")
        
        myTiger.age = myTiger.ageInTigerYearsFromAge(myTiger.age)
        myTiger.chuff()
        myTiger.chuffANumberOfTimes(5, isLoud: false)
        
        // Add myTiger instance to array
        self.myTigers.append(myTiger)
        
        // This is a local variable only in viewDidLoad
        // var tigers:[Tiger] = [myTiger]
        
        
        
        println("My Tiger's name is :\(myTiger.name), it's age is  \(myTiger.age), its' breed is \(myTiger.breed) and it's image is \(myTiger.image)")
        
        self.myImageView.image = myTiger.image
        self.nameLabel.text = myTiger.name
        self.ageLabel.text = "\(myTiger.age)"
        self.breedLabel.text = myTiger.breed
        self.randomFactLabel.text = myTiger.randomFact()
        
        
        var secondTiger = Tiger()
        secondTiger.name = "Tigress"
        secondTiger.breed = "Indochinese Tiger"
        secondTiger.age = 2
        secondTiger.image = UIImage(named: "IndochineseTiger.jpg")
        
        secondTiger.age = secondTiger.ageInTigerYearsFromAge(secondTiger.age)
        
        secondTiger.chuff()

        var thirdTiger = Tiger()
        thirdTiger.name = "Jacob"
        thirdTiger.breed = "Malayan Tiger"
        thirdTiger.age = 4
        thirdTiger.image = UIImage(named: "MalayanTiger.jpg")
        
        thirdTiger.age = thirdTiger.ageInTigerYearsFromAge(thirdTiger.age)
        
        var fourthTiger = Tiger()
        fourthTiger.name = "Spar"
        fourthTiger.breed = "Siberian Tiger"
        fourthTiger.age = 5
        fourthTiger.image = UIImage(named: "SiberianTiger.jpg")
        
        fourthTiger.age = fourthTiger.ageInTigerYearsFromAge(fourthTiger.age)
        
        self.myTigers += [secondTiger, thirdTiger, fourthTiger]
        
        myTiger.chuffANumberOfTimes(3)
        secondTiger.chuffANumberOfTimes(2)
        
        
        
       // self.printHelloWorld()
        
        // Self is the implicit instance of the class or struct your currently work in
        
        println("myTigers has \(myTigers.count) tigers")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBarButtonItemPressed(sender: UIBarButtonItem) {
        
        var randomIndex :Int
        
        do {
            randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
        } while self.currentIndex == randomIndex
        
       self.currentIndex = randomIndex
        
       let tiger = self.myTigers[randomIndex]
        
//        myImageView.image = tiger.image
//        nameLabel.text = tiger.name
//        ageLabel.text = "\(tiger.age)"
//        breedLabel.text = tiger.breed
        
        println("My Tiger's name is :\(tiger.name), it's age is  \(tiger.age), its' breed is \(tiger.breed) and it's image is \(tiger.image)")
        
        
        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            self.myImageView.image = tiger.image
            self.nameLabel.text = tiger.name
            self.ageLabel.text = "\(tiger.age)"
            self.breedLabel.text = tiger.breed
            self.randomFactLabel.text = tiger.randomFact()
            
            }, completion: {
                (finished: Bool) -> () in
        })
        
    }
    
   // func printHelloWorld() {
   // println("Hello World")
   // }

}

