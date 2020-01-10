//
//  SuperScout2ViewController.swift
//  ScoutingApp2170_2019
//
//  Created by Leonard Liu on 3/2/19.
//  Copyright © 2019 Leonard Liu. All rights reserved.
//

import UIKit
var team1Notes = ""
var team2Notes = ""
var team3Notes = ""
var team1Ranking: Int!
var team2Ranking: Int!
var team3Ranking: Int!

class SuperScout2ViewController: UIViewController {
    @IBOutlet weak var team1Label: UILabel!
    @IBOutlet weak var team1SegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var notes1Label: UILabel!
    @IBOutlet weak var team1TextField: UITextView!
    
    @IBOutlet weak var team2Label: UILabel!
    @IBOutlet weak var team2SegmentedControl: UISegmentedControl!
    @IBOutlet weak var notes2Label: UILabel!
    @IBOutlet weak var team2TextField: UITextView!
    @IBOutlet weak var team3Label: UILabel!
    @IBOutlet weak var team3SegmentedControl: UISegmentedControl!
    @IBOutlet weak var notes3Label: UILabel!
    @IBOutlet weak var team3TextField: UITextView!
    @IBOutlet weak var enterDataButton: UIButton!
    
    @IBAction func backButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "segueBackToSuperScout1", sender: nil)
    }
    @IBAction func enterDataPressed(_ sender: Any) {
        
        team1Ranking = team1SegmentedControl.selectedSegmentIndex + 1
        team2Ranking = team2SegmentedControl.selectedSegmentIndex + 1
        team3Ranking = team3SegmentedControl.selectedSegmentIndex + 1
        
        team1Notes = team1TextField.text
        team2Notes = team2TextField.text
        team3Notes = team3TextField.text
        
        firstSet = "\(superMatchNum), \(superAlliance), \(superTeam1), \(team1Ranking!), \(team1Notes), \(superTeam2), \(team2Ranking!), \(team2Notes), \(superTeam3), \(team3Ranking!), \(team3Notes)"
        
        
        UserDefaults.standard.set(firstSet, forKey: "\(superMatchNum); \(superAlliance)")
        
        print(firstSet)
        
        if superMatchNum != ""{
            if UserDefaults.standard.array(forKey: "superScoutList") == nil{
                // teamList = UserDefaults.standard.object(forKey: "teamList") as! [String]
                superScoutList.append("\(superMatchNum); \(superAlliance)")
                //print("teamlist is \(teamList)!")
                UserDefaults.standard.set(superScoutList, forKey: "superScoutList")
                
            }
            else if UserDefaults.standard.array(forKey: "superScoutList")!.isEmpty == false{
                
                //commented code overwrites previous entries with same team number
                superScoutList = UserDefaults.standard.array(forKey: "superScoutList") as! [String]
                breakLoop = false
                for index in 0...superScoutList.count - 1 {
                    let testString = "\(superMatchNum); \(superAlliance)"
                    if testString == superScoutList[index]{
                        breakLoop = true
                        //
                    }
                }
                print("breakLoop is \(breakLoop!)")
                if breakLoop == false{
                    superScoutList.append("\(superMatchNum); \(superAlliance)")
                    //print(teamList)
                    UserDefaults.standard.set(superScoutList, forKey: "superScoutList")
                }
                else if breakLoop == true{
                    let indexOfElement = superScoutList.index(of: "\(superMatchNum); \(superAlliance)")
                    superScoutList.remove(at: indexOfElement!)
                    superScoutList.append("\(superMatchNum); \(superAlliance)")
                //    print(teamList)
                    UserDefaults.standard.set(superScoutList, forKey: "superScoutList")
                    
                }
                
                
                //comment below code to when you uncomment the above
                //  teamList = UserDefaults.standard.array(forKey: "teamList") as! [String]
                //  teamList.append("\(teamNumber); \(matchNumber)")
                //  UserDefaults.standard.set(teamList, forKey: "teamList")
            }
            else{
                superScoutList = UserDefaults.standard.array(forKey: "superScoutList") as! [String]
                superScoutList.append("\(superMatchNum); \(superAlliance)")
                //print("teamlist is \(teamList)")
                UserDefaults.standard.set(superScoutList, forKey: "superScoutList")
            }
            
            
            
        }
        
        performSegue(withIdentifier: "segueAfterSuperData", sender: nil)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        hideKeyboardWhenTappedAround()
        //view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer =     UITapGestureRecognizer(target: self, action:    #selector(SuperScout2ViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if runType == 1{
            team1Label.font = UIFont.init(name: "Futura-MediumItalic", size: 65)
            team2Label.font = UIFont.init(name: "Futura-MediumItalic", size: 65)
            team3Label.font = UIFont.init(name: "Futura-MediumItalic", size: 65)
            notes1Label.font = UIFont.init(name: "Futura-MediumItalic", size: 65)
            notes2Label.font = UIFont.init(name: "Futura-MediumItalic", size: 65)
            notes3Label.font = UIFont.init(name: "Futura-MediumItalic", size: 65)
            enterDataButton.titleLabel!.font = UIFont.init(name: "Futura-MediumItalic", size: 60)
            
            team1SegmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.init(name: "Futura-MediumItalic", size: 65)], for: .normal)
            team2SegmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.init(name: "Futura-MediumItalic", size: 65)], for: .normal)
            team3SegmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.init(name: "Futura-MediumItalic", size: 65)], for: .normal)
            
        }
            
        else{
                team1Label.font = UIFont.init(name: "Futura-MediumItalic", size: 40)
                team2Label.font = UIFont.init(name: "Futura-MediumItalic", size: 40)
                team3Label.font = UIFont.init(name: "Futura-MediumItalic", size: 40)
                notes1Label.font = UIFont.init(name: "Futura-MediumItalic", size: 40)
                notes2Label.font = UIFont.init(name: "Futura-MediumItalic", size: 40)
                notes3Label.font = UIFont.init(name: "Futura-MediumItalic", size: 40)
                enterDataButton.titleLabel!.font = UIFont.init(name: "Futura-MediumItalic", size: 40)
                
                team1SegmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.init(name: "Futura-MediumItalic", size: 40)], for: .normal)
                team2SegmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.init(name: "Futura-MediumItalic", size: 40)], for: .normal)
                team3SegmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.init(name: "Futura-MediumItalic", size: 40)], for: .normal)
                
            
        }
        
        team1Label.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        team2Label.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        team3Label.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        notes1Label.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        notes2Label.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        notes3Label.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        
        team3TextField.text = ""
        team2TextField.text = ""
        team1TextField.text = ""
        
        
        enterDataButton.titleLabel!.minimumScaleFactor = 0.01
        enterDataButton.titleLabel!.numberOfLines = 2
        enterDataButton.titleLabel!.adjustsFontSizeToFitWidth = true
        enterDataButton.titleLabel!.textAlignment = NSTextAlignment.center
        
        enterDataButton.setTitleColor(UIColor.init(red: 0.0431372549, green: 0.1294117647, blue: 0.50196078431, alpha: 1.0), for: .normal)
        
        team1Label.text = "Team \(superTeam1) Ranking:"
        team2Label.text = "Team \(superTeam2) Ranking:"
        team3Label.text = "Team \(superTeam3) Ranking:"
        notes1Label.text = "Team \(superTeam1) Notes:"
        notes2Label.text = "Team \(superTeam2) Notes:"
        notes3Label.text = "Team \(superTeam3) Notes:"
        
       // let tapGestureReconizer = UITapGestureRecognizer(target: self, action: "tap:")
      //  tapGestureReconizer.cancelsTouchesInView = false
     //   view.addGestureRecognizer(tapGestureReconizer)
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
