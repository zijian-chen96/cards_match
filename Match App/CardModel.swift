//
//  CardModel.swift
//  Match App
//
//  Created by Micejian on 2019-01-17.
//  Copyright © 2019 Micejian. All rights reserved.
//

import Foundation

class CardModel {
    
    func getCards() -> [Card] {
        
        //Declare an array to store number we've already generated
        var generatedNumbersArray = [Int]()
        
        //Declare an array to store the generated cards
        var generatedCardsArray = [Card]()
        
        //Randomly generate pairs of cards
        while generatedNumbersArray.count < 8 {
            
            let randomNumber = arc4random_uniform(13) + 1
            
            //Ensure that the random number isn't onw we already have
            if generatedNumbersArray.contains(Int(randomNumber)) == false {
                
                //Log the number
                //print(randomNumber)
                
                //Store the number into the generatedNumberArray
                generatedNumbersArray.append(Int(randomNumber))
                
                //Create the first card object
                let cardOne = Card()
                cardOne.imageName = "card\(randomNumber)"
                
                generatedCardsArray.append(cardOne)
                
                //Create the second card object
                let cardTwo = Card()
                cardTwo.imageName = "card\(randomNumber)"
                
                generatedCardsArray.append(cardTwo)
            }
            
            // OPTIONAL: Make it so we only have unique pairs of cards
        }
        
        //Randomize the array
        for i in 0...generatedCardsArray.count - 1 {
            
            //Find a random index to swap with
            let randomNumber = Int(arc4random_uniform(UInt32(generatedCardsArray.count)))
            
            //Swap the two cards
            let temporaryStorage = generatedCardsArray[i]
            generatedCardsArray[i] = generatedCardsArray[randomNumber]
            generatedCardsArray[randomNumber] = temporaryStorage
        }
        
        //Return the array
        return generatedCardsArray
    }
    
}
