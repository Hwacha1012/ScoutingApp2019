//
//  PitScouting2ViewController.swift
//  ScoutingApp2170_2019
//
//  Created by Leonard Liu on 1/19/19.
//  Copyright © 2019 Leonard Liu. All rights reserved.
//

import UIKit
var photoNumberFromButton = 0

class PitScouting2ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    @IBOutlet weak var intakeLabel: UILabel!
    @IBOutlet weak var sandstormLabel: UILabel!
    @IBOutlet weak var intakeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var sandstormSegmentedControl: UISegmentedControl!
    @IBOutlet weak var intakeTextView: UITextView!
    @IBOutlet weak var sandstormTextView: UITextView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var cameraButton: UIButton!
    @IBAction func cameraButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "segueToTakePhoto", sender: nil)
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "seguePit2ToPit", sender: nil)
    }
    

    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var enterDataButton: UIButton!
    @IBAction func enterDataPressed(_ sender: Any) {
        
        if intakeSegmentedControl.selectedSegmentIndex == 0{
            pSIntake = "Hatch: \(intakeTextView.text!)"
        }
        else if intakeSegmentedControl.selectedSegmentIndex == 1{
            pSIntake = "Cargo: \(intakeTextView.text!)"
        }
        else if intakeSegmentedControl.selectedSegmentIndex == 2{
            pSIntake = "Both: \(intakeTextView.text!)"
        }
        
        if sandstormSegmentedControl.selectedSegmentIndex == 0{
            pSSandstorm = "Camera: \(sandstormTextView.text!)"
        }
        else{
            pSSandstorm = "Auto: \(sandstormTextView.text!)"
        }
        
        if UserDefaults.standard.array(forKey: "photoList") == nil{
            photoList = []
        }
        else{
            photoList = UserDefaults.standard.array(forKey: "photoList") as! [String]
        }
        
        firstSet = "\(pSteamNum), \(pSdrivetrain), \(pSclimbing!), \(pSclimber), \(pSIntake), \(pSSandstorm), \(photoList)"
        
        UserDefaults.standard.set(firstSet, forKey: "\(pSteamNum); Pit Scouting")
        print("Saved as: |\(pSteamNum); Pit Scouting|")
        print(firstSet)
        var test = UserDefaults.standard.string(forKey: "\(pSteamNum); Pit Scouting")
        print("test is \(test!)")
        
        
        if pSteamNum != ""{
            if UserDefaults.standard.array(forKey: "pitScoutList") == nil{
                // teamList = UserDefaults.standard.object(forKey: "teamList") as! [String]
                pitScoutList.append("\(pSteamNum); Pit Scouting")
                print("pitScoutList is \(pitScoutList)!")
                UserDefaults.standard.set(pitScoutList, forKey: "pitScoutList")
                
            }
            else if UserDefaults.standard.array(forKey: "pitScoutList")!.isEmpty == false{
                
                //commented code overwrites previous entries with same team number
                pitScoutList = UserDefaults.standard.array(forKey: "pitScoutList") as! [String]
                breakLoop = false
                for index in 0...pitScoutList.count - 1 {
                    //let testString = "\(teamNum); Pit Scouting"
                   // if testString == pitScoutList[index]{
                      //  breakLoop = true
                        
                   // }
                }
                print("breakLoop is \(breakLoop!)")
                if breakLoop == false{
                    pitScoutList.append("\(pSteamNum); Pit Scouting")
                    print(pitScoutList)
                    UserDefaults.standard.set(pitScoutList, forKey: "pitScoutList")
                }
                else if breakLoop == true{
                    let indexOfElement = pitScoutList.index(of: "\(pSteamNum); Pit Scouting")
                    pitScoutList.remove(at: indexOfElement!)
                    pitScoutList.append("\(pSteamNum); Pit Scouting")
                    print(pitScoutList)
                    UserDefaults.standard.set(pitScoutList, forKey: "pitScoutList")
                    
                }
                
                
                //comment below code to when you uncomment the above
                //  teamList = UserDefaults.standard.array(forKey: "teamList") as! [String]
                //  teamList.append("\(teamNumber); \(matchNumber)")
                //  UserDefaults.standard.set(teamList, forKey: "teamList")
            }
            else{
                pitScoutList = UserDefaults.standard.array(forKey: "pitScoutList") as! [String]
                pitScoutList.append("\(pSteamNum); Pit Scouting")
                print("pitScoutList is \(pitScoutList)")
                UserDefaults.standard.set(pitScoutList, forKey: "pitScoutList")
            }
            
            
        }
        
        //segue back to main menu
        performSegue(withIdentifier: "segueAfterPitScout", sender: nil)
        
    }
    func reloadData(){
        DispatchQueue.main.async{
            self.tableView.reloadData()
        }
        //tableView.reloadData()
        
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        print("pressed |||||||")
        var i = 0;
        while(true){
            i += 1
            if photoList.index(of: "\(teamNum); \(i)") == nil{
                i += 1
                break;
            }
            
        }
        var test = tableView.numberOfRows(inSection: 0) - 1
        photoList.remove(at: test)
        UserDefaults.standard.removeObject(forKey: "\(pSteamNum); \(i-2)")
        print("\(pSteamNum); \(i-2)")
        UserDefaults.standard.set(photoList, forKey: "photoList")
        if UserDefaults.standard.array(forKey: "photoList") != nil{
            photoList = UserDefaults.standard.array(forKey: "photoList") as! [String]
            
        }
        
        reloadData()
        //tableView.reloadData()
        //tableView.beginUpdates()
        //tableView.endUpdates()
        
       /* var i = 0;
        while(true){
            i += 1
            if photoList.index(of: "\(teamNum); \(i)") == nil{
                i += 1
                break;
            }
            
        }
        print("i-2 is \(i-2)");
        var iPath = IndexPath.init()
        iPath.append(i-1)
        //IndexPath()
        tableView.deleteRows(at: [iPath], with: .fade)
 */
        
    }
    @IBAction func viewDataPressed(_ sender: Any) {
        let buttonPosition:CGPoint = (sender as AnyObject).convert(CGPoint.zero, to:self.tableView)
        let indexPath1 = self.tableView.indexPathForRow(at: buttonPosition)
        
        photoNumberFromButton = indexPath1![1] + 1
        
        /*if teamList.count == 0{
            teamNumberFromButton = pitScoutList[indexPath1![1]]
        }
        else if indexPath1![1] > (teamList.count - 1) {
            teamNumberFromButton = pitScoutList[(indexPath1![1] - teamList.count)]
        }
        else {
            teamNumberFromButton = teamList[indexPath1![1]]
        }
        */
        
        print("photoNumberFromButton is \(photoNumberFromButton)")
        print(indexPath1![1])
        photoEnterLocation = 1
        
        performSegue(withIdentifier: "segueToPhoto", sender: nil)
        
        
    }
    /*
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete {
            print("Deleted")
            
            let indexOfElement = photoList.index(of: "\(teamNum); \(indexPath.row)")
            photoList.remove(at: indexOfElement!)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            /*
            if indexPath.row > (teamList.count - 1) {
                //cell.textLabel?.text = "Team \(pitScoutList[(row - (teamList.count + 1))])"
                UserDefaults.standard.removeObject(forKey: "\(pitScoutList[(indexPath.row - (teamList.count))])")
                pitScoutList.remove(at: (indexPath.row - (teamList.count)))
            }
            else if teamList.count == 0{
                UserDefaults.standard.removeObject(forKey: "\(pitScoutList[indexPath.row])")
                pitScoutList.remove(at: indexPath.row)
            }
            else {
                UserDefaults.standard.removeObject(forKey: "\(teamList[indexPath.row])")
                teamList.remove(at: indexPath.row)
            }
            */
            // UserDefaults.standard.removeObject(forKey: "\(teamList[indexPath.row])")
            

            //self.catNames.remove(at: indexPath.row)
            //tableView.beginUpdates()
            // print("here!")
            
            // print("here")
            //self.tableView.endUpdates()
            // print("here!!")
            
            
            //tableView.reloadData()
            // self.tableView.deleteRows(at: <#T##[IndexPath]#>, with: .)
            //print("hi")
            
            UserDefaults.standard.set(photoList, forKey: "photoList")
        }
    }
    */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("in here")
        
        var i = 0;
        while(true){
            i += 1
            if photoList.index(of: "\(teamNum); \(i)") == nil{
                i += 1
                break;
            }
            
        }
        print("i-2 is \(i-2)");
        return (i-2)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath)
        
        let row = indexPath.row
        //cell.textLabel?.font = UIFont.systemFont(ofSize: 25)
        var fontSize: CGFloat!
        if runType == 1{
            fontSize = 36
            
        }
        else if runType == 2{
            fontSize = 18
        }
        print(fontSize)
        cell.textLabel?.font = UIFont.init(name: "Futura-MediumItalic", size: fontSize)
        // cell.textLabel?.font = UIFont.init
        cell.textLabel?.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        cell.textLabel?.text = "\(teamNum); \(row+1)"
      /*  if teamList.count == 0{
            cell.textLabel?.text = "Team \(pitScoutList[row])"
        }
        else if row > (teamList.count - 1) {
            cell.textLabel?.text = "Team \(pitScoutList[((row + 1) - (teamList.count + 1))])"
        }
            
        else {
            cell.textLabel?.text = "Team \(teamList[row])"
        }
        */
        
        return cell
    }
    
    override func viewDidLoad() {
        
        //second photo taken after deleting first one doesn't show up and photoList is empty for some reason
        super.viewDidLoad()
        if UserDefaults.standard.array(forKey: "photoList") != nil{
            photoList = UserDefaults.standard.array(forKey: "photoList") as! [String]
            
        }
        print("photoLIST IS \(photoList)")
        if photoList.count != 0{
            for i in 0...photoList.count-1{
                print("photoList[\(i)] = \(photoList[i]) ")
            }
        }
        else{
            print("photoList is 0")
        }
        
        
        photoNumberFromButton = 0
        // Do any additional setup after loading the view.
        if runType == 1{
            intakeLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 80)
            sandstormLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 80)
            intakeSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.init(name: "Futura-MediumItalic", size: 30)], for: .normal)
            sandstormSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.init(name: "Futura-MediumItalic", size: 30)], for: .normal)
            
            intakeTextView.font = UIFont.init(name: "Futura-MediumItalic", size: 40)
            sandstormTextView.font = UIFont.init(name: "Futura-MediumItalic", size: 40)
            enterDataButton.titleLabel!.font = UIFont.init(name: "Futura-MediumItalic", size: 80)
            
            
        }
        else{
            intakeLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 40)
            sandstormLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 40)
            intakeSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.init(name: "Futura-MediumItalic", size: 15)], for: .normal)
            sandstormSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.init(name: "Futura-MediumItalic", size: 15)], for: .normal)
            
            intakeTextView.font = UIFont.init(name: "Futura-MediumItalic", size: 25)
            sandstormTextView.font = UIFont.init(name: "Futura-MediumItalic", size: 25)
            enterDataButton.titleLabel!.font = UIFont.init(name: "Futura-MediumItalic", size: 40)
        }
        
        intakeLabel.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        sandstormLabel.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        intakeTextView.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        sandstormTextView.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        
        deleteButton.titleLabel!.minimumScaleFactor = 0.01
        deleteButton.titleLabel!.numberOfLines = 3
        deleteButton.titleLabel!.adjustsFontSizeToFitWidth = true
        deleteButton.titleLabel!.textAlignment = NSTextAlignment.center
        
        deleteButton.setTitleColor(UIColor.init(red: 0.0431372549, green: 0.1294117647, blue: 0.50196078431, alpha: 1.0), for: .normal)
        
        enterDataButton.titleLabel!.minimumScaleFactor = 0.01
        enterDataButton.titleLabel!.numberOfLines = 2
        enterDataButton.titleLabel!.adjustsFontSizeToFitWidth = true
        enterDataButton.titleLabel!.textAlignment = NSTextAlignment.center
        
        enterDataButton.setTitleColor(UIColor.init(red: 0.0431372549, green: 0.1294117647, blue: 0.50196078431, alpha: 1.0), for: .normal)
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        reloadData()
       // if teamNum != ""{
            
            
      //  }
        
       
        
        
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
