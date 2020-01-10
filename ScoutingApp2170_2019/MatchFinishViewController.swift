//
//  MatchFinishViewController.swift
//  ScoutingApp2170_2019
//
//  Created by Leonard Liu on 1/29/19.
//  Copyright © 2019 Leonard Liu. All rights reserved.
//

import UIKit
var breakLoop:Bool!

class MatchFinishViewController: UIViewController {
    @IBOutlet weak var enterDataButton: UIButton!
    @IBOutlet weak var climbingLabel: UILabel!
    @IBOutlet weak var climberNotesLabel: UILabel!
    @IBOutlet weak var additionalNotesLabel: UILabel!
    @IBOutlet weak var climbingSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var climbingNotesTextField: UITextView!
    @IBOutlet weak var additionalNotesTextField: UITextView!
    @IBAction func backButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "segueBackToScoringScreen", sender: nil)
    }
    @IBAction func enterDataPressed(_ sender: Any) {
        
        //for loop goes out of bounds with the cargo (set to 0...2)
        
        if additionalNotesTextField.text != nil{
            additionalNotes = additionalNotesTextField.text!
        }
        if climbingNotesTextField.text != nil{
            climberNotes = climbingNotesTextField.text!
        }
        
        climbing = climbingSegmentedControl.selectedSegmentIndex
        
        
        
        for i in 0...7{
            if(cargoShipCargo[i] == 1){
                cargoShipCargoCount += 1
            }
            else if cargoShipCargo[i] == -1{
                cargoShipCargoAuto += 1
            }
            
            if cargoShipHatches[i] == 1{
                cargoShipHatchCount += 1
            }
            else if cargoShipHatches[i] == -1{
                cargoShipHatchAuto += 1
            }
        }
        
        if rocket1Cargo[0] == -4{
            rocketLevel3CargoAuto += 2
        }
        else if rocket1Cargo[0] == -2{
            rocketLevel3CargoAuto += 1
        }
        else if rocket1Cargo[0] == -1{
            rocketLevel3CargoAuto += 1
            rocketLevel3CargoCount += 1
        }
        else if rocket1Cargo[0] == 1{
            rocketLevel3CargoCount += 1
        }
        else if rocket1Cargo[0] == 2{
            rocketLevel3CargoCount += 2
        }
        
        if rocket2Cargo[0] == -4{
            rocketLevel3CargoAuto += 2
        }
        else if rocket2Cargo[0] == -2{
            rocketLevel3CargoAuto += 1
        }
        else if rocket2Cargo[0] == -1{
            rocketLevel3CargoAuto += 1
            rocketLevel3CargoCount += 1
        }
        else if rocket2Cargo[0] == 1{
            rocketLevel3CargoCount += 1
        }
        else if rocket2Cargo[0] == 2{
            rocketLevel3CargoCount += 2
        }
        
        if rocket1Cargo[1] == -4{
            rocketLevel2CargoAuto += 2
        }
        else if rocket1Cargo[1] == -2{
            rocketLevel2CargoAuto += 1
        }
        else if rocket1Cargo[1] == -1{
            rocketLevel2CargoAuto += 1
            rocketLevel2CargoCount += 1
        }
        else if rocket1Cargo[1] == 1{
            rocketLevel2CargoCount += 1
        }
        else if rocket1Cargo[1] == 2{
            rocketLevel2CargoCount += 2
        }
        
        if rocket2Cargo[1] == -4{
            rocketLevel2CargoAuto += 2
        }
        else if rocket2Cargo[1] == -2{
            rocketLevel2CargoAuto += 1
        }
        else if rocket2Cargo[1] == -1{
            rocketLevel2CargoAuto += 1
            rocketLevel2CargoCount += 1
        }
        else if rocket2Cargo[1] == 1{
            rocketLevel2CargoCount += 1
        }
        else if rocket2Cargo[1] == 2{
            rocketLevel2CargoCount += 2
        }
        
        if rocket1Cargo[2] == -4{
            rocketLevel1CargoAuto += 2
        }
        else if rocket1Cargo[2] == -2{
            rocketLevel1CargoAuto += 1
        }
        else if rocket1Cargo[2] == -1{
            rocketLevel1CargoAuto += 1
            rocketLevel1CargoCount += 1
        }
        else if rocket1Cargo[2] == 1{
            rocketLevel1CargoCount += 1
        }
        else if rocket1Cargo[2] == 2{
            rocketLevel1CargoCount += 2
        }
        
        if rocket2Cargo[2] == -4{
            rocketLevel1CargoAuto += 2
        }
        else if rocket2Cargo[2] == -2{
            rocketLevel1CargoAuto += 1
        }
        else if rocket2Cargo[2] == -1{
            rocketLevel1CargoAuto += 1
            rocketLevel1CargoCount += 1
        }
        else if rocket2Cargo[2] == 1{
            rocketLevel1CargoCount += 1
        }
        else if rocket2Cargo[2] == 2{
            rocketLevel1CargoCount += 2
        }
        
        
        
        for i in 0...1{
            
            
            if rocket1Hatches[i] == 1{
                rocketLevel3HatchCount += 1
            }
            else if rocket1Hatches[i] == -1{
                rocketLevel3HatchAuto += 1
            }
            
            if rocket2Hatches[i] == 1{
                rocketLevel3HatchCount += 1
            }
            else if rocket2Hatches[i] == -1{
                rocketLevel3HatchAuto += 1
            }
            
        }
        
        for i in 2...3{
           
            
            if rocket1Hatches[i] == 1{
                rocketLevel2HatchCount += 1
            }
            else if rocket1Hatches[i] == -1{
                rocketLevel2HatchAuto += 1
            }
            
            if rocket2Hatches[i] == 1{
                rocketLevel2HatchCount += 1
            }
            else if rocket2Hatches[i] == -1{
                rocketLevel2HatchAuto += 1
            }
            
        }
        
        for i in 4...5{
            
            if rocket1Hatches[i] == 1{
                rocketLevel1HatchCount += 1
            }
            else if rocket1Hatches[i] == -1{
                rocketLevel1HatchAuto += 1
            }
            
            if rocket2Hatches[i] == 1{
                rocketLevel1HatchCount += 1
            }
            else if rocket2Hatches[i] == -1{
                rocketLevel1HatchAuto += 1
            }
            
            
        }
        
        
        
        
        
        firstSet = "\(teamNum), \(matchNum), \(scoutName), \(startLevel!), \(fieldPiece!), \(robotPiece!), \(sandstormVision!), \(cargoShipCargoCount), \(cargoShipHatchCount), \(cargoShipCargoAuto), \(cargoShipHatchAuto), \(rocketLevel3CargoCount), \(rocketLevel3HatchCount), \(rocketLevel2CargoCount), \(rocketLevel2HatchCount), \(rocketLevel1CargoCount), \(rocketLevel1HatchCount), \(rocketLevel3CargoAuto), \(rocketLevel3HatchAuto), \(rocketLevel2CargoAuto), \(rocketLevel2HatchAuto), \(rocketLevel1CargoAuto), \(rocketLevel1HatchAuto), \(climbing!), \(climberNotes), \(additionalNotes)"
        
        UserDefaults.standard.set(firstSet, forKey: "\(teamNum); \(matchNum)")
        
        print(firstSet)
        
        if teamNum != ""{
            if UserDefaults.standard.array(forKey: "teamList") == nil{
                // teamList = UserDefaults.standard.object(forKey: "teamList") as! [String]
                teamList.append("\(teamNum); \(matchNum)")
                print("teamlist is \(teamList)!")
                UserDefaults.standard.set(teamList, forKey: "teamList")
                
            }
            else if UserDefaults.standard.array(forKey: "teamList")!.isEmpty == false{
                
                //commented code overwrites previous entries with same team number
                teamList = UserDefaults.standard.array(forKey: "teamList") as! [String]
                breakLoop = false
                for index in 0...teamList.count - 1 {
                    let testString = "\(teamNum); \(matchNum)"
                    if testString == teamList[index]{
                        breakLoop = true
                        
                    }
                }
                print("breakLoop is \(breakLoop!)")
                if breakLoop == false{
                    teamList.append("\(teamNum); \(matchNum)")
                    print(teamList)
                    UserDefaults.standard.set(teamList, forKey: "teamList")
                }
                else if breakLoop == true{
                    let indexOfElement = teamList.index(of: "\(teamNum); \(matchNum)")
                    teamList.remove(at: indexOfElement!)
                    teamList.append("\(teamNum); \(matchNum)")
                    print(teamList)
                    UserDefaults.standard.set(teamList, forKey: "teamList")
                    
                }
                
                
                //comment below code to when you uncomment the above
                //  teamList = UserDefaults.standard.array(forKey: "teamList") as! [String]
                //  teamList.append("\(teamNumber); \(matchNumber)")
                //  UserDefaults.standard.set(teamList, forKey: "teamList")
            }
            else{
                teamList = UserDefaults.standard.array(forKey: "teamList") as! [String]
                teamList.append("\(teamNum); \(matchNum)")
                print("teamlist is \(teamList)")
                UserDefaults.standard.set(teamList, forKey: "teamList")
            }
            
            
        }
        
        cargoShipCargo = Array(repeating: 0, count: 8)
        cargoShipHatches = Array(repeating: 0, count: 8)
        rocket1Cargo = Array(repeating: 0, count: 3)
        rocket2Cargo = Array(repeating: 0, count: 3)
        rocket1Hatches = Array(repeating: 0, count: 6)
        rocket2Hatches = Array(repeating: 0, count: 6)
        
        
        //segue back to main menu
        performSegue(withIdentifier: "segueAfterMatchScout", sender: nil)
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

        // Do any additional setup after loading the view.
        if runType == 1{
            climbingLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 65)
            climberNotesLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 120)
            additionalNotesLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 120)
            enterDataButton.titleLabel!.font = UIFont.init(name: "Futura-MediumItalic", size: 65)
            climbingSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.init(name: "Futura-MediumItalic", size: 80)], for: .normal)
        }
        else{
            climbingLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 40)
            climberNotesLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 40)
            additionalNotesLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 40)
            enterDataButton.titleLabel!.font = UIFont.init(name: "Futura-MediumItalic", size: 40)
            climbingSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.init(name: "Futura-MediumItalic", size: 40)], for: .normal)
        }
        climbingLabel.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        climberNotesLabel.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        additionalNotesLabel.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        climberNotesLabel.adjustsFontSizeToFitWidth = true
        additionalNotesLabel.adjustsFontSizeToFitWidth = true
        
        climberNotesLabel.minimumScaleFactor = 0.01
        additionalNotesLabel.minimumScaleFactor = 0.01

        climbingNotesTextField.text = ""
        additionalNotesTextField.text = ""
        
        enterDataButton.titleLabel!.minimumScaleFactor = 0.01
        enterDataButton.titleLabel!.numberOfLines = 2
        enterDataButton.titleLabel!.adjustsFontSizeToFitWidth = true
        enterDataButton.titleLabel!.textAlignment = NSTextAlignment.center
        
        enterDataButton.setTitleColor(UIColor.init(red: 0.0431372549, green: 0.1294117647, blue: 0.50196078431, alpha: 1.0), for: .normal)
        
       /* if furthestPointMoved >= 2{
            climbingSegmentedControl.selectedSegmentIndex = climbing
            climberNotesLabel.text = climber
            additionalNotesLabel.text = additionalNotes
            
        }
        else{
            climbingSegmentedControl.selectedSegmentIndex = 0
            climberNotesLabel.text = ""
            additionalNotesLabel.text = ""
            climbing = 0
            climber = ""
            additionalNotes = ""
            furthestPointMoved = 2
            
        }
 */
        
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
