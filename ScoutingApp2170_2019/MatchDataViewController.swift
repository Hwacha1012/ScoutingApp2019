//
//  MatchDataViewController.swift
//  ScoutingApp2170_2019
//
//  Created by Leonard Liu on 1/18/19.
//  Copyright © 2019 Leonard Liu. All rights reserved.
//

import UIKit

class MatchDataViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var scoutNameLabel: UILabel!
    @IBOutlet weak var teamNumLabel: UILabel!
    @IBOutlet weak var matchNumLabel: UILabel!
    @IBOutlet weak var sandstormLabel: UILabel!
    @IBOutlet weak var startLevelLabel: UILabel!
    @IBOutlet weak var startFieldLabel: UILabel!
    @IBOutlet weak var startRobotLabel: UILabel!
    @IBOutlet weak var sandstormVisionLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var teamTextField: UITextField!
    @IBOutlet weak var matchTextField: UITextField!
    
    @IBOutlet weak var startSegmentedControl: UISegmentedControl!
    @IBOutlet weak var startFieldSegmentedControl: UISegmentedControl!
    @IBOutlet weak var sandstormSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var startRobotSegmentedControl: UISegmentedControl!
    @IBAction func backButton(_ sender: Any) {
        performSegue(withIdentifier: "segueBackToData", sender: nil)
    }
    @IBAction func forwardButton(_ sender: Any) {
        scoutName = nameTextField.text!
        matchNum = matchTextField.text!
        teamNum = teamTextField.text!
        
        startLevel = startSegmentedControl.selectedSegmentIndex
        fieldPiece = startFieldSegmentedControl.selectedSegmentIndex
        robotPiece = startRobotSegmentedControl.selectedSegmentIndex
        
        switch sandstormSegmentedControl.selectedSegmentIndex{
        case 0:
            sandstormVision = true;
        default:
            sandstormVision = false;
        }
        performSegue(withIdentifier: "segueToScoring", sender: nil)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // sandstormSegmentedControl.selectedSegmentIndex
//        sandstormSegmentedControl.
        
        if runType == 1{
            titleLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 120)
            scoutNameLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 80)
            teamNumLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 80)
            matchNumLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 80)
            sandstormLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 120)
            startLevelLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 80)
            startFieldLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 80)
            startRobotLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 80)
            sandstormVisionLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 80)
           
            sandstormSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.init(name: "Futura-MediumItalic", size: 30)], for: .normal)
            startFieldSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.init(name: "Futura-MediumItalic", size: 40)], for: .normal)
            startSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.init(name: "Futura-MediumItalic", size: 80)], for: .normal)
            startRobotSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.init(name: "Futura-MediumItalic", size: 40)], for: .normal)
            
        }
        else{
                titleLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 60)
                scoutNameLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 40)
                teamNumLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 40)
                matchNumLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 40)
                sandstormLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 60)
                startLevelLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 40)
                startFieldLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 40)
                startRobotLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 40)
                sandstormVisionLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 40)
            
              //  let font = UIFont.init(name: "Futura-MediumItalic", size: 40)
              //  let font2 = UIFont.init(name: "Futura-MediumItalic", size: 20)
                sandstormSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.init(name: "Futura-MediumItalic", size: 15)], for: .normal)
                startFieldSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.init(name: "Futura-MediumItalic", size: 20)], for: .normal)
                startSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.init(name: "Futura-MediumItalic", size: 40)], for: .normal)
                startRobotSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.init(name: "Futura-MediumItalic", size: 20)], for: .normal)
        }
        
        titleLabel.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        scoutNameLabel.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        teamNumLabel.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        matchNumLabel.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        sandstormLabel.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        startLevelLabel.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        startFieldLabel.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        startRobotLabel.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        sandstormVisionLabel.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        titleLabel.adjustsFontSizeToFitWidth = true
        
        titleLabel.minimumScaleFactor = 0.01
        
        if furthestPointMoved >= 1{
            nameTextField.text = scoutName
            teamTextField.text = teamNum
            matchTextField.text = matchNum
            startSegmentedControl.selectedSegmentIndex = startLevel
            startFieldSegmentedControl.selectedSegmentIndex = fieldPiece
            startRobotSegmentedControl.selectedSegmentIndex = robotPiece
            
            if sandstormVision{
                sandstormSegmentedControl.selectedSegmentIndex = 0
            }
            else{
                sandstormSegmentedControl.selectedSegmentIndex = 1
            }
            
            
        }
        else{
            scoutName = ""
            teamNum = ""
            matchNum = ""
            
            startLevel = 0
            fieldPiece = 0
            robotPiece = 0
            sandstormVision = false
            
            nameTextField.text = ""
            teamTextField.text = ""
            matchTextField.text = ""
            startSegmentedControl.selectedSegmentIndex = 0
            startFieldSegmentedControl.selectedSegmentIndex = 0
            startRobotSegmentedControl.selectedSegmentIndex = 0
            sandstormSegmentedControl.selectedSegmentIndex = 0
            
            furthestPointMoved = 1
        }
        
        
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
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
