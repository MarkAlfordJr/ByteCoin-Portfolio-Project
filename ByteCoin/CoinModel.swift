//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Mark Alford on 11/14/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

//TASK D setup MVC method for ViewController's UIPicker, regarding which API price to get from UIpicker (switch statement)
struct CoinModel {
    //D1 initiate vars for decoded data to go into
    let coinName: String
    let currencyPrice: Double
    let currencyType: String
    
    //D2 get acces to the coinManager array
    let coinManager = CoinManager() //with this you now have access to CoinManager's properties
    
    //D3 setup function to round bitcoin Price to 2 decimal place, then return value
    func roundedPrice (with currencyPrice: Double) -> String{ //THIS PARAMETER WILL EQUAL THE coinPrice decoded data
        let roundedalue = String(format: "%.2f", currencyPrice)
        return roundedalue
    }
    
    //D4 setup function to loop through currencyArray to find the item that equals what the UIPicker will have
    func returnArrayIndexValue(searchValue: String) -> String{ //THIS PARAMETER WILL EQUAL the currencyType var, which itself will equal currencyName DECODED DATA
        var currentIndex = 0 //D5 array index starts at 0
        var itemValue = "" //D6 what gets returned
                
        for value in coinManager.currencyArray{ //D7 loop through array with value being array's value
            if value == searchValue { //D8 check if array value equals the parameter's UIPicker value
                itemValue = value //D9 if so assign value to returned itemValue
                break //D10  end if statement
            }
            currentIndex += 1 //D11 if not, keep going through loop
        }
        return itemValue //D12 finally return itemValue
    }
    

}
