//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

//MARK: - Custom Delegate
//TASK F setup methods for delegate ViewController, to show the prices in the UILabel
protocol CoinManagerDelegate { //F1 setup protocol
    //F2 setup delegate function for ViewController to update its UI with decoded data
    func didUpdateCoin(_ coinManager: CoinManager, coin: CoinModel) //these parameters are needed, acces to coinManger and access to CoinModel
    //F3 setup delegate function for an error
    func didFailWithError(error: Error)
}

struct CoinManager {
    
    //TASK A setup BitCoin query
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC" //A1 get base query
    let apiKey = Constants.apiKey //A2 get apiKey
    
    //A3 setup array for currency names that go into query
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    
    //TASK B setup networking
    //B1 setup func to call networking request
    func fetchCoin(countryName: String){
        let coinString = "\(baseURL)/\(countryName)?apikey=\(apiKey)" //the currencyArray index will take the return value of the countryName array loop in CoinModel
        performRequest(with: coinString)
    }
    
    //F4 setup delegator var for delegates to use
    var delegate: CoinManagerDelegate?
    
    //MARK: - Networking
    //B2 setup func for networking request
    func performRequest (with urlString: String){
        //B3 create url
        if let url = URL(string: urlString) {
            //B4 create the urlSession
            let session = URLSession(configuration: .default)
            //B5 give the urlSession a task
            let task = session.dataTask(with: url) { (data, urlResponse, error) in //trailing closure
                //B6 if there is an error in getting back the data, print the error
                if error != nil{
                    print(error!)
                    return
                }
                //B8 if the data from the webserver is good, print and store data
                if let safeData = data {
                    //B9 refer to the data parsing function
                    if let coin = self.parseJSON(safeData){ //this gets access to decoded data
                        //F5 when calling performRequest, it will call the delegator function didUpdateCoin
                        self.delegate?.didUpdateCoin(self, coin: coin)
                    }
                }
            }
            //B7 perform the task
            task.resume()
        }
    }
    
    //MARK: - Parsing Data
    //TASK C get access to retrieved query data
    func parseJSON (_ coinData: Data) -> CoinModel?  { //C8 return the model (once you make it)
        //C1 access the Json decoding class
        let decoder = JSONDecoder()
        //C2 MAKE CoinData struct in CoinData.swift file
        //C3 make do and catch to retrieve data
        do{
            //C4 setup decodeData to access bitCoin web server data
            let decodedData = try decoder.decode(CoinData.self, from: coinData) //this gets access to CoinData struct, where we intialize ALL properties. these properties are where the web server data properties will go into.
            //C5 setup codable data in CoinData.swift
            //C6 get access to data we need with variables
            let coinBase = decodedData.asset_id_base
            let coinPrice = decodedData.rate
            let currencyName = decodedData.asset_id_quote
            //C7 hook up to the CoinModel
            let coinModel = CoinModel(coinName: coinBase, currencyPrice: coinPrice, currencyType: currencyName)
            //C9 return the model's var
            return coinModel
            
        }catch{
            //C10 return and print error
            print(error)
            return nil
        }
        
    }
}



