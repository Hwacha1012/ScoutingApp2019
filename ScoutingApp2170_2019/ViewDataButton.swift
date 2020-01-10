//
//  ViewDataButton.swift
//  ScoutingApp
//
//  Created by Leonard Liu on 2/23/18.
//  Copyright © 2018 Leonard Liu. All rights reserved.
//

import UIKit


class ViewDataButton: UIButton {

    override func didMoveToSuperview() {
        print("hi")
        if runType == 1{
            titleLabel!.font = UIFont.init(name: "Futura-MediumItalic", size: 55)
            
        }
        else if runType == 2{
            titleLabel!.font = UIFont.init(name: "Futura-MediumItalic", size: 30)
            
        }
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
