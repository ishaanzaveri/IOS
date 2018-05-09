//
//  ViewController.swift
//  Convertor
//
//  Created by Ishaan  on 07/07/17.
//  Copyright © 2017 Ishaan . All rights reserved.
//

import UIKit


var URL = "https://api.fixer.io/latest?base="


class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var x: UITextField!
    
    @IBOutlet var USD: UILabel!
    @IBOutlet var GBP: UILabel!
    @IBOutlet var INR: UILabel!
    @IBOutlet var JPY: UILabel!
    @IBOutlet var CHF: UILabel!
    @IBOutlet var ZAR: UILabel!
    
    
    
    let Currency = ["INR", "USD", "GBP", "EUR","JPY","CHF","ZAR"]
    private var Retnow = ReturingData()
    
    func numberOfComponents(in: UIPickerView ) -> Int{
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        func amount(_ sender: UITextField) {
        }
        return Currency[row]
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Currency.count
    }
    @IBAction func CalculateMofo(_ sender: UIButton) {
        var a = 1.0
        if let val = x.text {
            a = Double(val)!
        }
        INR.text! = "INR = "+String(Retnow.INRV(num: a))
        USD.text! = "USD = "+String(Retnow.USDV(num: a))
        GBP.text! = "GBP = "+String(Retnow.GBPV(num: a))
        JPY.text! = "JPY = "+String(Retnow.JPYV(num: a))
        CHF.text! = "CHF = "+String(Retnow.CHFV(num: a))
        ZAR.text! = "ZAR = "+String(Retnow.ZARV(num: a))
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        URL = "https://api.fixer.io/latest?base="
        URL+=Currency[row]
        Retnow.callAlmo(url: URL)
        
        
    }
    
    
}

