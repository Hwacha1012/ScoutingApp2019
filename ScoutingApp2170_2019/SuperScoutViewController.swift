//
//  SuperScoutViewController.swift
//  ScoutingApp2170_2019
//
//  Created by Leonard Liu on 3/2/19.
//  Copyright © 2019 Leonard Liu. All rights reserved.
//

import UIKit
var superTeam1 = ""
var superTeam2 = ""
var superTeam3 = ""
var superAlliance = ""
var superMatchNum = ""

class SuperScoutViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var allianceLabel: UILabel!
    @IBOutlet weak var allianceSegmentedControl: UISegmentedControl!
    @IBOutlet weak var teamLabel1: UILabel!
    @IBOutlet weak var teamLabel2: UILabel!
    @IBOutlet weak var teamLabel3: UILabel!
    @IBOutlet weak var matchLabel: UILabel!
    @IBOutlet weak var team1TextField: UITextField!
    @IBOutlet weak var team2TextField: UITextField!
    @IBOutlet weak var team3TextField: UITextField!
    @IBOutlet weak var matchTextField: UITextField!
    
    @IBAction func segmentedControlChanged(_ sender: Any) {
        if allianceSegmentedControl.selectedSegmentIndex == 0{
            allianceSegmentedControl.tintColor = UIColor.blue
            team1TextField.textColor = UIColor.blue
            team2TextField.textColor = UIColor.blue
            team3TextField.textColor = UIColor.blue
            matchTextField.textColor = UIColor.blue
        }
        else{
            allianceSegmentedControl.tintColor = UIColor.red
            team1TextField.textColor = UIColor.red
            team2TextField.textColor = UIColor.red
            team3TextField.textColor = UIColor.red
            matchTextField.textColor = UIColor.red
            
            
        }
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        furthestPointMoved = 0
        performSegue(withIdentifier: "segueBackToDataChoice", sender: nil)
    }
    @IBAction func forwardButtonPressed(_ sender: Any) {
        superTeam1 = team1TextField.text!
        superTeam2 = team2TextField.text!
        superTeam3 = team3TextField.text!
        superMatchNum = matchTextField.text!
        
        if allianceSegmentedControl.selectedSegmentIndex == 0{
            superAlliance = "Blue"
        }
        else{
            superAlliance = "Red"
        }
        
        furthestPointMoved = 1
        
        
        
        performSegue(withIdentifier: "segueToSuperScout2", sender: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
       

        if runType == 1{
            titleLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 65)
            allianceLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 65)
            teamLabel1.font = UIFont.init(name: "Futura-MediumItalic", size: 65)
            teamLabel2.font = UIFont.init(name: "Futura-MediumItalic", size: 65)
            teamLabel3.font = UIFont.init(name: "Futura-MediumItalic", size: 65)
            matchLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 65)
            allianceSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.init(name: "Futura-MediumItalic", size: 40)], for: .normal)
            
        }
        else{
            titleLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 40)
            allianceLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 40)
            teamLabel1.font = UIFont.init(name: "Futura-MediumItalic", size: 40)
            teamLabel2.font = UIFont.init(name: "Futura-MediumItalic", size: 40)
            teamLabel3.font = UIFont.init(name: "Futura-MediumItalic", size: 40)
            matchLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 40)
            allianceSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.init(name: "Futura-MediumItalic", size: 25)], for: .normal)
            
        }
        
        titleLabel.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        allianceLabel.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        teamLabel3.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        teamLabel2.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        teamLabel1.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        matchLabel.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        
        allianceSegmentedControl.tintColor = UIColor.blue
        
        if furthestPointMoved >= 1{
            if superAlliance == "Blue"{
                allianceSegmentedControl.selectedSegmentIndex = 0
                allianceSegmentedControl.tintColor = UIColor.blue
            }
            else{
                allianceSegmentedControl.selectedSegmentIndex = 1
                allianceSegmentedControl.tintColor = UIColor.red
            }
            
            team1TextField.text = superTeam1
            team2TextField.text = superTeam2
            team3TextField.text = superTeam3
            matchTextField.text = superMatchNum
        }
        else{
            furthestPointMoved = 0
            allianceSegmentedControl.selectedSegmentIndex = 0
            allianceSegmentedControl.tintColor = UIColor.blue
            
            superAlliance = ""
            superTeam1 = ""
            superTeam2 = ""
            superTeam3 = ""
            superMatchNum = ""
            team1TextField.text = ""
            team2TextField.text = ""
            team3TextField.text = ""
            matchTextField.text = ""
        }
            
        
        
        
        // Do any additional setup after loading the view.
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
