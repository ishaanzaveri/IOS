//
//  ViewController.swift
//  Piano keys
//
//  Created by Ishaan  on 05/07/17.
//  Copyright © 2017 Ishaan . All rights reserved.
//

import UIKit
import  AudioKit

class ViewController: UIViewController {
    var octave: Int = 3
    var table = makeTable()
    var frequency:Double = 0.0
    let oscillator = AKOscillator()
    
    
    @IBOutlet var OcatveNum: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func Octave(_ sender: UIStepper) {
        octave = Int(sender.value)
        OcatveNum.text = "Octave:" + String(octave)
        
    }
    @IBAction func key(_ sender: UIButton) {
        let keyNum = Int(sender.currentTitle!)!
        if keyNum != 13{
            frequency = table[octave][keyNum-1]
           
        } else {
            frequency = table[octave+1][1]
        }
        print(frequency)
        
        AudioKit.output = oscillator
        AudioKit.start()
        oscillator.frequency = frequency
        oscillator.start()
    }

    @IBAction func Stop(_ sender: UIButton) {
        oscillator.stop()
    }
    @IBAction func Volume(_ sender: UISlider) {
        oscillator.amplitude = Double(sender.value)
    }
    

}

