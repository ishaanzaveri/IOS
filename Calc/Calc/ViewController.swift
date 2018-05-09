//
//  ViewController.swift
//  Calc
//
//  Created by Ishaan  on 19/06/17.
//  Copyright © 2017 Ishaan . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var Label1: UILabel!
    var DecimalIsEntered = false
    var UserIsEnteringNumber = false
    
    @IBAction func Numbers(_ sender: UIButton) {
        let TextCurrentlyInDisplay = Label1.text!
        let digit = sender.currentTitle!
        if digit == "C"{  // Clearing
            Label1.text! = "0"
            UserIsEnteringNumber=false
            DecimalIsEntered=false
        }
        else if digit == "."{
            if !DecimalIsEntered{
                Label1.text = TextCurrentlyInDisplay + digit
                DecimalIsEntered = true
            }
        }
        else  {
            
            if UserIsEnteringNumber {
                Label1.text = TextCurrentlyInDisplay + digit
            } else {
                Label1.text = digit
                UserIsEnteringNumber=true
            }
        }
        
    }
    private var brain = brainCalc()
    
    @IBAction func PerformOpperarion(_ sender: UIButton) {
        if UserIsEnteringNumber{
            brain.setOperand(DisplayValue)
            UserIsEnteringNumber = false
        }
        if let mathematicalSymbol = sender.currentTitle{
            brain.PerformOperation(mathematicalSymbol)
        }
        if let result = brain.result {
            DisplayValue = result
        }
    }
    var DisplayValue :Double {
        get {
            return Double (Label1.text!)!
        }
        set {
            Label1.text = String (newValue)
        }
    }
}
