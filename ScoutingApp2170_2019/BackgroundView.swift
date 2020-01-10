//
//  BackgroundView.swift
//  ScoutingApp2170_2019
//
//  Created by Leonard Liu on 1/15/19.
//  Copyright © 2019 Leonard Liu. All rights reserved.
//

import UIKit

@IBDesignable
class BackgroundView: UIView {
    
    //1
    //@IBInspectable var lightColor: UIColor = UIColor.init(red: 0.8, green: 0.8, blue: 1.0, alpha: 1.0)
    //@IBInspectable var darkColor: UIColor = UIColor.init(red: 1.0, green: 0.75294117647, blue: 0.79607843137, alpha: 1.0)
    //@IBInspectable var lightColor: UIColor = UIColor.init(red: 0.6431372549, green: 0.866666666, blue: 0.9294117647, alpha: 1.0)
    // @IBInspectable var darkColor: UIColor = UIColor.init(red: 0.58823529411, green: 0.78431372549, blue: 0.63529411764, alpha: 1.0)
    @IBInspectable var lightColor: UIColor = UIColor.init(red: 0.87058823529, green: 0.87058823529, blue: 0.87058823529, alpha: 1.0)
    @IBInspectable var darkColor: UIColor = UIColor.init(red: 0.87058823529, green: 0.87058823529, blue: 0.87058823529, alpha: 1.0)
    @IBInspectable var patternSize: CGFloat = 40
    
    override func draw(_ rect: CGRect) {
        //2
        let context = UIGraphicsGetCurrentContext()!
        
        //3
        context.setFillColor(darkColor.cgColor)
        
        //4
        context.fill(rect)
        
        
        let drawSize = CGSize(width: patternSize, height: patternSize)
        
        //insert code here
        UIGraphicsBeginImageContextWithOptions(drawSize, true, 0.0)
        let drawingContext = UIGraphicsGetCurrentContext()!
        
        //set the fill color for the new context
        darkColor.setFill()
        drawingContext.fill(CGRect(x: 0, y: 0, width: drawSize.width, height: drawSize.height))
        
        
        let trianglePath = UIBezierPath()
        //1
        trianglePath.move(to: CGPoint(x: drawSize.width/2, y: 0))
        //2
        trianglePath.addLine(to: CGPoint(x: 0, y: drawSize.height/2))
        //3
        trianglePath.addLine(to: CGPoint(x: drawSize.width, y: drawSize.height/2))
        
        //4
        trianglePath.move(to: CGPoint(x: 0,y: drawSize.height/2))
        //5
        trianglePath.addLine(to: CGPoint(x: drawSize.width/2, y: drawSize.height))
        //6
        trianglePath.addLine(to: CGPoint(x: 0, y: drawSize.height))
        
        //7
        trianglePath.move(to: CGPoint(x: drawSize.width, y: drawSize.height/2))
        //8
        trianglePath.addLine(to: CGPoint(x: drawSize.width/2, y: drawSize.height))
        //9
        trianglePath.addLine(to: CGPoint(x: drawSize.width, y: drawSize.height))
        
        lightColor.setFill()
        trianglePath.fill()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        
        UIColor(patternImage: image).setFill()
        context.fill(rect)
        
        
    }
}
