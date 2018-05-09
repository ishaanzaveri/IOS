//
//  Circle view.swift
//  circle
//
//  Created by Ishaan  on 02/07/17.
//  Copyright © 2017 Ishaan . All rights reserved.
//

import UIKit

class Circle_view: UIView {

    
    override func draw(_ rect: CGRect) {
        let  Radius = (min(bounds.size.width, bounds.size.height)/2) * 0.95
        let circleCenter = CGPoint(x:bounds.midX,y:bounds.midY)
        let path = UIBezierPath(arcCenter: circleCenter, radius: Radius, startAngle: CGFloat.pi, endAngle: angle, clockwise: true)
        path.lineWidth = 7.0
        UIColor.white.set()
        path.stroke()
    
    }
    

}
