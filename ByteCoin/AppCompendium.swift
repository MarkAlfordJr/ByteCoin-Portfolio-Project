//
//  AppCompendium.swift
//  ByteCoin
//
//  Created by Mark Alford on 11/14/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

//MARK: - Features
//1 gives current bitcoin prices in ALL popular traded currencies

//MARK: - Patterns
//MVC pattern.
//all logic and data go into a model folder, through methods and properties
//the ViewController ONLY calls these methods

//DELEGATE pattern
//1 the class (delegator) has methods/things it does. but this delegator ALSO has methods
//2 the methods it TELLS the other classes/structs (delegates) to do are syntaxed like this
    //2.1 delegate?.performProtocolFunc()
//2.1 delegate?.performProtocolFunc() IS THE METHOD that the delegate is told to do by the delegator
//3 this method will also HAVE TO BE IN A PROTOCOL, this protocol is within the same delegator file
//4 within the delegator, make this key. ALL delegates will do the delegator's methods with it
    //4.1 var delegate: ProtocolName?
//4.1 this is the key for the delegate struct/class
//5 within the delegate, in order for it to PERFORM THOSE METHODS OF THE DELEGATOR, have it
    //5.1 take up the protocol, along with func stubs
    //5.2 make var delegator = DelegatorClassName() in top of struct
    //5.3 make delegator.delegate = self within viewDidLoad func
//6 BOOM, now it can delegate!

//MARK: - Goals
//OVERALL GOAL
//1 get bitcoin data back from networking
//2 setup UIPicker with dif country names
//3 have those names go into API query to get specific price
//4 show price in UILabel

//MODEL, VIEW, CONTROLLER
//MODEL- handle bitcoin currency API logic/data
//VIEW- design app screen label and UIpicker
//CONTROLLER- handle price label and UIpicker, which will operate the Model methods

//MODEL-
//A setup bitcoin API query- DONE
//B setup networking- DONE
//C get access to retrieved query data- DONE
//D setup MVC method for ViewController's UIPicker, regarding which API price to get from UIpicker (switch statement)- DONE
//E setup UIPicker's values to connect API query's country name- DONE with H
//F setup methods for delegate ViewController, to show the prices in the UILabel- DONE

//Controller
//G setup UI Picker with values- Done
//H setup UI Picker values to go into UI Label- Done



