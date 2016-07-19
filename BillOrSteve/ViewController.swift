//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var whichBossMan: [String : [String]] = [:]
    
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var scoreCounter: UILabel!
    @IBOutlet weak var steveButton: UIButton!
    @IBOutlet weak var billButton: UIButton!
    
    var personAndFact: (String, String) = ("","")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFacts()
        showFact()
    }
    
    func randomNumberFromZeroTo(number: Int) -> Int {
        return Int(arc4random_uniform(UInt32(number)))
    }
    
    func randomPerson() -> String {
        let randomNumber = arc4random_uniform(2)
        
        if randomNumber == 0 {
            return "Steve Jobs"
        } else {
            return "Bill Gates"
        }
    }
    
    
    func createFacts() {
        
        whichBossMan = ["Steve Jobs":["He took a calligraphy course, which he says was instrumental in the future company products'  attention to typography and font.",
            "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.",
            "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.",
            "He was a pescetarian, meaning he ate no meat except for fish."],
                        "Bill Gates" : [ "He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.",
                            "He scored 1590 (out of 1600) on his SATs.",
                            "His foundation spends more on global health each year than the United Nation's World Health Organization.",
                            "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.",
                            "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]
        ]
    }
    
    func getRandomFact() -> (String, String)? { //methods can have no arguments and return something, even optional tuples
        
        //always default to let until you know that value change
        
        let steveOrBill = randomPerson() //capturing return of randomPerson method
        
        let keysBossMan = Array(whichBossMan.keys)
        
        if keysBossMan.contains(steveOrBill){
            
            if let allFacts = whichBossMan[steveOrBill] {// array of dictionary values (which are facts) so that afterwards we can access individual facts in the array using index which is acquired through randomNumberFromZeroTo method and passed in max number argument (to get the max number possible use array.count - 1 ).
                
                let randomFact = allFacts[randomNumberFromZeroTo(allFacts.count - 1)] //accessing indv fact in array of facts which are dictionary values
            
                //print("here's my \(randomFact)")
                return(steveOrBill, randomFact)// return whatever person/fact pair we get...whenever hit return, the code stops/ method breaks out
            }
            
        }
        return nil //not adding anything to dictionary if keys don't exist because it's not purpose of this function
    }
    
    
    @IBAction func steveButtonTapped(sender: AnyObject) {
        if personAndFact.0 == "Steve Jobs"{
            
            if let scoreString = scoreCounter.text {
                if var scoreInteger = Int(scoreString) {
                    scoreInteger += 1
                    scoreCounter.text = String(scoreInteger)
                    print(scoreCounter.text)
                }
            }
            
          // for example var two = "2"
            //var num : Int = int(two)
            //num= 2 +1 
            // num = 3
            //var two = string(num) => "3" string(num)
        }
        showFact()
    }
    
    
    @IBAction func billButtonTapped(sender: AnyObject) {
        if personAndFact.0 == "Bill Gates" {
        
            
            if let scoreString = scoreCounter.text {
                if var scoreInteger = Int(scoreString) {
                    scoreInteger += 1
                    scoreCounter.text = String(scoreInteger)
                }
            }
            //if let scoreCounter.text.toInt() += 1 {
            
            //convert text into number and then add 1 and then convert back into a string to save as a label
            //
        }
        showFact()
    }


    func showFact() {
        if let temporaryPair = getRandomFact() {
            personAndFact = temporaryPair
        }
        
        factLabel.text = personAndFact.1
       
    }
    
}
