//
//  brains.swift
//  Convertor
//
//  Created by Ishaan  on 07/07/17.
//  Copyright © 2017 Ishaan . All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class ReturingData{
    var json:JSON = []
    private var num: Double = 1.0
    var rates = [String:Double]()
    func callAlmo(url: String){
        
        Alamofire.request(url).responseJSON { response in
            if let data = response.data {
                self.json = JSON(data: data)
                self.rates = self.json["rates"].dictionaryObject! as! [String : Double]
                //print(self.rates)
            }
        }
    }
    //INR
    func INRV (num: Double ) -> Double{
        var y = num
        if let l = rates["INR"]{
            let z = l
            
            y = z * y
            
        }
        return y
    }
    //USD
    func USDV (num: Double ) -> Double{
        var y = num
        if let l = rates["USD"]{
            let z = l
            
            y = z * y
            
        }
        return y
    }
    //INR
    func GBPV (num: Double ) -> Double{
        var y = num
        if let l = rates["GBP"]{
            let z = l
            
            y = z * y
            
        }
        return y
    }
    //INR
    func JPYV (num: Double ) -> Double{
        var y = num
        if let l = rates["JPY"]{
            let z = l
            
            y = z * y
            
        }
        return y
    }
    //INR
    func CHFV (num: Double ) -> Double{
        var y = num
        if let l = rates["CHF"]{
            let z = l
            
            y = z * y
            
        }
        return y
    }
    //INR
    func ZARV (num: Double ) -> Double{
        var y = num
        if let l = rates["ZAR"]{
            let z = l
            
            y = z * y
            
        }
        return y
    }
    //INR
    
    
    
    
    
}
