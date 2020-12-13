//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //setup UI elements
    @IBOutlet weak var currencyUIPicker: UIPickerView!
    @IBOutlet weak var currencyValue: UILabel!
    @IBOutlet weak var currencyType: UILabel!
    
    //initialzes object for CoinManager code
    var coinManager = CoinManager()
    
    //TASK G setup UI Picker with values from decodeData
    //G1 intialize picker data
    var pickerData: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coinManager.delegate = self
        
        //G2 setup picker data with currencyArray
        pickerData = coinManager.currencyArray
        //G4 setup the delegate for currencyUIPicker Functionality and Data
        self.currencyUIPicker.delegate = self
        self.currencyUIPicker.dataSource = self
    }
   
}

//MARK: - UIpicker Functionality and Data

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource { //G3 setup UIPickerView Delegate to acces pickerView's functionality and data
    
    //G5 setup this method excatly as is
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //G6 setup Number of columns of data, in this case its just one column, for the currencyName
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //G7 setup The number of rows of data, as in the numbers os rows will equal the number of items from the currency array
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    //G8 The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    //G9 Capture the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        //G10 print to make sure it works, if so then this is methods that starts it all
        print(pickerData[row])
        //THIS IS THE METHOD TO WHERE WE MUST CALL THE fetchCoin Method, which starts it all
        
        //H5 CALL THE fetchCoin Method, which will have the countryName parameter equal to the UiPicker's array string value
        coinManager.fetchCoin(countryName: pickerData[row])
    }
    
}



//MARK: - CoinManager Delegate

//TASK H setup UI Picker values to go into UI Label
extension ViewController: CoinManagerDelegate {
    func didUpdateCoin(_ coinManager: CoinManager, coin: CoinModel) {
        //H1 set the UI changing method
        DispatchQueue.main.async {
            //H2 set the currency value UILabel to be the rounded value of the decoded data from CoinModel
            self.currencyValue.text = coin.roundedPrice(with: coin.currencyPrice)
            //H3 set the currency type UILabel to be the chosen array String from the switch statement
            self.currencyType.text = coin.returnArrayIndexValue(searchValue: coin.currencyType)
        }
      
    }
    
    func didFailWithError(error: Error) {
        //H4 setup error to be print, if so
        print(error)
    }
}
