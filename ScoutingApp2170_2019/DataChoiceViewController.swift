//
//  DataChoiceViewController.swift
//  ScoutingApp2170_2019
//
//  Created by Leonard Liu on 1/15/19.
//  Copyright © 2019 Leonard Liu. All rights reserved.
//

import UIKit

class DataChoiceViewController: UIViewController {

    @IBOutlet weak var superScoutButton: UIButton!
    @IBOutlet weak var matchButton: UIButton!
    @IBOutlet weak var scoutButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBAction func matchPressed(_ sender: Any) {
        performSegue(withIdentifier: "segueToMatchEnterData", sender: nil)
        
    }
    @IBAction func scoutPressed(_ sender: Any) {
        performSegue(withIdentifier: "segueToPitData", sender: nil)
        
    }
    @IBAction func superScoutPressed(_ sender: Any) {
        performSegue(withIdentifier: "segueToSuperScout", sender: nil)
    }
    @IBAction func backPressed(_ sender: Any) {
        performSegue(withIdentifier: "segueBackToMenu", sender: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if runType == 1{
            matchButton.titleLabel!.font = UIFont.init(name: "Optima-BoldItalic", size: 65)
            scoutButton.titleLabel!.font = UIFont.init(name: "Optima-BoldItalic", size: 65)
            superScoutButton.titleLabel!.font = UIFont.init(name: "Optima-BoldItalic", size: 65)
        }
        else{
            matchButton.titleLabel!.font = UIFont.init(name: "Optima-BoldItalic", size: 40)
            scoutButton.titleLabel!.font = UIFont.init(name: "Optima-BoldItalic", size: 40)
            superScoutButton.titleLabel!.font = UIFont.init(name: "Optima-BoldItalic", size: 40)
        }
        matchButton.titleLabel!.minimumScaleFactor = 0.01
        matchButton.titleLabel!.numberOfLines = 2
        matchButton.titleLabel!.adjustsFontSizeToFitWidth = true
        matchButton.titleLabel!.textAlignment = NSTextAlignment.center
        
        matchButton.setTitleColor(UIColor.init(red: 0.0431372549, green: 0.1294117647, blue: 0.50196078431, alpha: 1.0), for: .normal)
        
        scoutButton.titleLabel!.minimumScaleFactor = 0.01
        scoutButton.titleLabel!.numberOfLines = 2
        scoutButton.titleLabel!.adjustsFontSizeToFitWidth = true
        scoutButton.titleLabel!.textAlignment = NSTextAlignment.center
        
        scoutButton.setTitleColor(UIColor.init(red: 0.0431372549, green: 0.1294117647, blue: 0.50196078431, alpha: 1.0), for: .normal)
        superScoutButton.titleLabel!.minimumScaleFactor = 0.01
        superScoutButton.titleLabel!.numberOfLines = 2
        superScoutButton.titleLabel!.adjustsFontSizeToFitWidth = true
        superScoutButton.titleLabel!.textAlignment = NSTextAlignment.center
        
        superScoutButton.setTitleColor(UIColor.init(red: 0.0431372549, green: 0.1294117647, blue: 0.50196078431, alpha: 1.0), for: .normal)
        

        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
