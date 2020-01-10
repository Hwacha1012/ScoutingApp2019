//
//  PitScoutingViewController.swift
//  ScoutingApp2170_2019
//
//  Created by Leonard Liu on 1/18/19.
//  Copyright © 2019 Leonard Liu. All rights reserved.
//

import UIKit

class PitScoutingViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var drivetrainLabel: UILabel!
    @IBOutlet weak var climbingLabel: UILabel!
    
    @IBOutlet weak var tankButton: UIButton!
    @IBOutlet weak var swerveButton: UIButton!
    @IBOutlet weak var hdriveButton: UIButton!
    @IBOutlet weak var mechanumButton: UIButton!
    @IBOutlet weak var otherButton: UIButton!
    
    @IBOutlet weak var climbSegementedControl: UISegmentedControl!
    @IBAction func climbSegmentChanged(_ sender: Any) {
        if climbSegementedControl.selectedSegmentIndex != 0{
            climbTextView.isHidden = false
        }
        else{
            climbTextView.isHidden = true
        }
    }
    @IBAction func tankButtonPressed(_ sender: Any) {
        clearDrivetrainColors()
        pSdrivetrain = "Tank"
        tankButton.backgroundColor = UIColor.init(red: 0.27451, green: 0.776471, blue: 0.2431273, alpha: 1.0)
        tankButton.setTitleColor(UIColor.white, for: .normal)
    }
    @IBAction func swerveButtonPressed(_ sender: Any) {
        clearDrivetrainColors()
        pSdrivetrain = "Swerve"
        swerveButton.backgroundColor = UIColor.init(red: 0.27451, green: 0.776471, blue: 0.2431273, alpha: 1.0)
        swerveButton.setTitleColor(UIColor.white, for: .normal)
    }
    
    @IBAction func hButtonPressed(_ sender: Any) {
        clearDrivetrainColors()
        pSdrivetrain = "H-Drive"
        hdriveButton.backgroundColor = UIColor.init(red: 0.27451, green: 0.776471, blue: 0.2431273, alpha: 1.0)
        hdriveButton.setTitleColor(UIColor.white, for: .normal)
    }
    @IBAction func mechanumButtonPressed(_ sender: Any) {
        clearDrivetrainColors()
        pSdrivetrain = "Mechanum"
        mechanumButton.backgroundColor = UIColor.init(red: 0.27451, green: 0.776471, blue: 0.2431273, alpha: 1.0)
        mechanumButton.setTitleColor(UIColor.white, for: .normal)
    }
    @IBAction func otherButtonPressed(_ sender: Any) {
        clearDrivetrainColors()
        pSdrivetrain = "Other"
        otherButton.backgroundColor = UIColor.init(red: 0.27451, green: 0.776471, blue: 0.2431273, alpha: 1.0)
        otherButton.setTitleColor(UIColor.white, for: .normal)
        drivetrainTextField.isHidden = false
    }
    @IBOutlet weak var drivetrainTextField: UITextField!
    @IBOutlet weak var teamTextField: UITextField!
    @IBOutlet weak var climbTextView: UITextView!
    @IBAction func backButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "seguePitToData", sender: nil)
        
    }
    @IBAction func forwardButtonPressed(_ sender: Any) {
        if pSdrivetrain == "Other"{
            pSdrivetrain = "Other: \(drivetrainTextField.text!)"
            
        }
        pSclimbing = climbSegementedControl.selectedSegmentIndex + 1
        if pSclimbing != 1{
            pSclimber = climbTextView.text
        }
        
        pSteamNum = teamTextField.text!
        
        
        
        performSegue(withIdentifier: "segueToPit2", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        clearDrivetrainColors()
        pSdrivetrain = "Tank"
        tankButton.backgroundColor = UIColor.init(red: 0.27451, green: 0.776471, blue: 0.2431273, alpha: 1.0)
        tankButton.setTitleColor(UIColor.white, for: .normal)
        
        climbTextView.isHidden = true
        drivetrainTextField.isHidden = true
        
        // Do any additional setup after loading the view.
        
        if runType == 1{
            titleLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 120)
            teamLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 80)
            drivetrainLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 80)
            climbingLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 80)
            tankButton.titleLabel!.font = UIFont.init(name: "Futura-MediumItalic", size: 40)
            swerveButton.titleLabel!.font = UIFont.init(name: "Futura-MediumItalic", size: 40)
            hdriveButton.titleLabel!.font = UIFont.init(name: "Futura-MediumItalic", size: 40)
            mechanumButton.titleLabel!.font = UIFont.init(name: "Futura-MediumItalic", size: 40)
            otherButton.titleLabel!.font = UIFont.init(name: "Futura-MediumItalic", size: 40)
            climbSegementedControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.init(name: "Futura-MediumItalic", size: 30)], for: .normal)
            
            
        }
        else if runType == 2{
            titleLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 60)
            teamLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 40)
            drivetrainLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 40)
            climbingLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 40)
            tankButton.titleLabel!.font = UIFont.init(name: "Futura-MediumItalic", size: 20)
            swerveButton.titleLabel!.font = UIFont.init(name: "Futura-MediumItalic", size: 20)
            hdriveButton.titleLabel!.font = UIFont.init(name: "Futura-MediumItalic", size: 20)
            mechanumButton.titleLabel!.font = UIFont.init(name: "Futura-MediumItalic", size: 20)
            otherButton.titleLabel!.font = UIFont.init(name: "Futura-MediumItalic", size: 20)
            climbSegementedControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.init(name: "Futura-MediumItalic", size: 15)], for: .normal)
        }
        
        titleLabel.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        teamLabel.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        drivetrainLabel.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        climbingLabel.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        
        
        
    }
    
    func clearDrivetrainColors(){
        tankButton.setTitleColor(UIColor.init(red: 0.0431372549, green: 0.1294117647, blue: 0.50196078431, alpha: 1.0), for: .normal)
        tankButton.backgroundColor = UIColor.clear
        
        swerveButton.setTitleColor(UIColor.init(red: 0.0431372549, green: 0.1294117647, blue: 0.50196078431, alpha: 1.0), for: .normal)
        swerveButton.backgroundColor = UIColor.clear
        
        hdriveButton.setTitleColor(UIColor.init(red: 0.0431372549, green: 0.1294117647, blue: 0.50196078431, alpha: 1.0), for: .normal)
        hdriveButton.backgroundColor = UIColor.clear
        
        mechanumButton.setTitleColor(UIColor.init(red: 0.0431372549, green: 0.1294117647, blue: 0.50196078431, alpha: 1.0), for: .normal)
        mechanumButton.backgroundColor = UIColor.clear
        
        otherButton.setTitleColor(UIColor.init(red: 0.0431372549, green: 0.1294117647, blue: 0.50196078431, alpha: 1.0), for: .normal)
        otherButton.backgroundColor = UIColor.clear
        
        drivetrainTextField.isHidden = true
        
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
