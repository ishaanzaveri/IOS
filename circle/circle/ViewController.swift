//
//  ViewController.swift
//  circle
//
//  Created by Ishaan  on 02/07/17.
//  Copyright © 2017 Ishaan . All rights reserved.
//

import UIKit
 var angle: CGFloat = CGFloat.pi
var area:CGRect = CGRect(
    origin: CGPoint(x: 0, y: 0),
    size: UIScreen.main.bounds.size
)

class ViewController: UIViewController {
    var num:Int = 0

    @IBAction func slider(_ sender: UISlider) {
        angle = CGFloat(sender.value)
        circle.setNeedsDisplay()
        num = Int(((sender.value - Float.pi)  / (2*Float.pi))*100)
        label.text = String(num)+"%"
		
    }
    @IBOutlet var circle: Circle_view!
    @IBOutlet var label: UILabel!
  
    
    

}

