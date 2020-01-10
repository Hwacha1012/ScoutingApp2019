//
//  IndividualTeamDataViewController.swift
//  ScoutingApp2170_2019
//
//  Created by Leonard Liu on 2/2/19.
//  Copyright © 2019 Leonard Liu. All rights reserved.
//

import UIKit
var tempTeamData = ""
var partsOfTempTeamData = [String]()
var teamNum2 = [String]()

class IndividualTeamDataViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var matchLabel: UILabel!
    @IBOutlet weak var scoutLabel: UILabel!
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var startFieldLabel: UILabel!
    @IBOutlet weak var startRobotLabel: UILabel!
    @IBOutlet weak var sandstormLabel: UILabel!
    
    @IBOutlet weak var cargoShipCargoLabel: UILabel!
    @IBOutlet weak var cargoShipHatchLabel: UILabel!
    
    @IBOutlet weak var rktLvl3CargoLabel: UILabel!
    @IBOutlet weak var rktLvl3HatchLabel: UILabel!
    @IBOutlet weak var rktLvl2CargoLabel: UILabel!
    @IBOutlet weak var rktLvl2HatchLabel: UILabel!
    @IBOutlet weak var rktLvl1CargoLabel: UILabel!
    @IBOutlet weak var rktLvl1HatchLabel: UILabel!
    
    @IBOutlet weak var climbingLabel: UILabel!
    @IBOutlet weak var climbingNotesLabel: UILabel!
    @IBOutlet weak var additionalNotesLabel: UILabel!
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "segueBackToViewDataFromInd", sender: nil)
    }
    @IBAction func viewPhotoPressed(_ sender: Any) {
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
        photoEnterLocation = 2
        
        performSegue(withIdentifier: "segueToPhoto2", sender: nil)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if UserDefaults.standard.array(forKey: "photoList") == nil{
          photoList = []
        }
        else{
            photoList = UserDefaults.standard.array(forKey: "photoList") as! [String]
        }
        
        print("in here")
        var i = 0;

        if photoList.index(of: "\(teamNum2[0]); 1") == nil{
            
            i = 1
        }
        else if photoList.index(of: "\(teamNum2[0]); 2") == nil{
            i = 2
        }
        else if photoList.index(of: "\(teamNum2[0]); 3") == nil{
            i = 3
        }
        else if photoList.index(of: "\(teamNum2[0]); 4") == nil{
            i = 4
        }
        else if photoList.index(of: "\(teamNum2[0]); 5") == nil{
            i = 5
        }
        else if photoList.index(of: "\(teamNum2[0]); 6") == nil{
            i = 6
        }
        else if photoList.index(of: "\(teamNum2[0]); 7") == nil{
            i = 7
        }
        else if photoList.index(of: "\(teamNum2[0]); 8") == nil{
            i = 8
        }
        else if photoList.index(of: "\(teamNum2[0]); 9") == nil{
            i = 9
        }
        else{
            i = 10
        }
        
        return (i-1)
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
        cell.textLabel?.text = "\(teamNum2[0]); \(row+1)"
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
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        additionalNotesLabel.adjustsFontSizeToFitWidth = true
        additionalNotesLabel.numberOfLines = 0
        additionalNotesLabel.minimumScaleFactor = 0.01
        climbingNotesLabel.adjustsFontSizeToFitWidth = true
        climbingNotesLabel.numberOfLines = 0
        climbingNotesLabel.minimumScaleFactor = 0.01
        
        if runType == 1{
            // additionalNotesLabel.numberOfLines = 10
            //// additionalNotesLabel.adjustsFontSizeToFitWidth = true
            //additionalNotesLabel.
            // additionalNotesLabel.minimumScaleFactor = 0.01
            // additionalNotesLabel.baselineAdjustment = .alignCenters
            
            titleLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 80)
            scoutLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 45)
            matchLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 45)
            startLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 45)
            startFieldLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 45)
            cargoShipCargoLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 45)
            cargoShipHatchLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 45)
            rktLvl3CargoLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 45)
            rktLvl3HatchLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 45)
            rktLvl2CargoLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 45)
            rktLvl2HatchLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 45)
            rktLvl1CargoLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 45)
            rktLvl1HatchLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 45)
            climbingLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 45)
            climbingNotesLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 45)
            additionalNotesLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 45)
            
            
        }
        else if runType == 2{
            //  additionalNotesLabel.numberOfLines = 10
            //  additionalNotesLabel.adjustsFontSizeToFitWidth = true
            //additionalNotesLabel.
            //  additionalNotesLabel.minimumScaleFactor = 0.01
            //  additionalNotesLabel.baselineAdjustment = .alignCenters
            
            titleLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 50)
            scoutLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 30)
            matchLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 30)
            startLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 30)
            startFieldLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 30)
            cargoShipCargoLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 30)
            cargoShipHatchLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 30)
            rktLvl3CargoLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 30)
            rktLvl3HatchLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 30)
            rktLvl2CargoLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 30)
            rktLvl2HatchLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 30)
            rktLvl1CargoLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 30)
            rktLvl1HatchLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 30)
            climbingLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 30)
            climbingNotesLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 30)
            additionalNotesLabel.font = UIFont.init(name: "Futura-MediumItalic", size: 30)
            
            
        }
        cargoShipCargoLabel.numberOfLines = 1
        cargoShipHatchLabel.numberOfLines = 1
        rktLvl3HatchLabel.numberOfLines = 1
        rktLvl3CargoLabel.numberOfLines = 1
        rktLvl2HatchLabel.numberOfLines = 1
        rktLvl2CargoLabel.numberOfLines = 1
        rktLvl1CargoLabel.numberOfLines = 1
        rktLvl1HatchLabel.numberOfLines = 1
        
        //tempTeamData = UserDefaults.standard.object(forKey: "37") as! String
       // print(pitScoutList)
       // print("teamnumberfrombutton = |\(teamNumberFromButton)|")
       // tempTeamData = UserDefaults.standard.string(forKey: "\(teamNumberFromButton)")!
       // tempTeamData = UserDefaults.standard.object(forKey: "\(teamNumberFromButton)") as! String
       // print(tempTeamData)
       tempTeamData = UserDefaults.standard.object(forKey: "\(teamNumberFromButton)") as! String
      //  print("teamnum = \(teamNumberFromButton)")
        
        //var string = "hello Swift"
        
        if teamNumberFromButton.range(of:"Pit") != nil {
            print("exists")
            
            partsOfTempTeamData = tempTeamData.components(separatedBy: ",")
            print("tempTeamData = \(tempTeamData)")
            print(partsOfTempTeamData)
            
             teamNum2 = teamNumberFromButton.components(separatedBy: ";")
            teamNum = teamNum2[0]
            
            titleLabel.text = "Team \(teamNum2[0])'s Pit Scouting Data"
            matchLabel.text = "Drivetrain:\(partsOfTempTeamData[1])"
            scoutLabel.text = "Climbing Level:\(partsOfTempTeamData[2])"
            startLabel.text = "Climbing Notes:\(partsOfTempTeamData[3])"
            startFieldLabel.text = "Intake:\(partsOfTempTeamData[4])"
            startRobotLabel.text = "Sandstorm Vision:\(partsOfTempTeamData[5])"
            sandstormLabel.isHidden = true
            cargoShipCargoLabel.isHidden = true
            cargoShipHatchLabel.isHidden = true
            rktLvl3CargoLabel.isHidden = true
            rktLvl3HatchLabel.isHidden = true
            rktLvl2CargoLabel.isHidden = true
            rktLvl2HatchLabel.isHidden = true
            rktLvl1CargoLabel.isHidden = true
            rktLvl1HatchLabel.isHidden = true
            climbingLabel.isHidden = true
            climbingNotesLabel.isHidden = true
            additionalNotesLabel.isHidden = true
            
            tableView.delegate = self
            tableView.dataSource = self
            
           // additionalNotesLabel.text = "Additional Notes: \(partsOfTempTeamData[8])"
            
            
            //hide unused labels when displaying pit scouting
            
          /*  friendlySwitchLabel.isHidden = true
            scaleLabel.isHidden = true
            opposingSwitchLabel.isHidden = true
            vaultLabel.isHidden = true
            driverLabel.isHidden = true
            climbLabel.isHidden = true
            robotsAssistedLabel.isHidden = true
            */
        }
        else if (teamNumberFromButton.range(of:"Blue") != nil) || teamNumberFromButton.range(of:"Red") != nil {
            //print("exists")
            tableView.isHidden = true
            partsOfTempTeamData = tempTeamData.components(separatedBy: ",")
            print("tempTeamData = \(tempTeamData)")
            print(partsOfTempTeamData)
            
            teamNum2 = teamNumberFromButton.components(separatedBy: ";")
            teamNum = teamNum2[0]
            
            titleLabel.text = "Match \(teamNum2[0]) Super Scout Data"
            
            matchLabel.text = "Alliance:\(partsOfTempTeamData[1])"
            var temp: String!
            var temp2: String!
            var temp3: String!
            temp = partsOfTempTeamData[3]
            temp2 = partsOfTempTeamData[6]
            temp3 = partsOfTempTeamData[9]
            scoutLabel.text = "Team\(partsOfTempTeamData[2])'s Ranking: \(temp!)"
            startLabel.text = "Team\(partsOfTempTeamData[2])'s Notes: \(partsOfTempTeamData[4])"
            startFieldLabel.text = "Team\(partsOfTempTeamData[5])'s Ranking: \(temp2!)"
            startRobotLabel.text = "Team\(partsOfTempTeamData[5])'s Notes: \(partsOfTempTeamData[7])"
            sandstormLabel.text = "Team\(partsOfTempTeamData[8])'s Ranking: \(temp3!)"
            cargoShipCargoLabel.text = "Team\(partsOfTempTeamData[8])'s Ranking: \(partsOfTempTeamData[10])"
            cargoShipHatchLabel.isHidden = true
            rktLvl3CargoLabel.isHidden = true
            rktLvl3HatchLabel.isHidden = true
            rktLvl2CargoLabel.isHidden = true
            rktLvl2HatchLabel.isHidden = true
            rktLvl1CargoLabel.isHidden = true
            rktLvl1HatchLabel.isHidden = true
            climbingLabel.isHidden = true
            climbingNotesLabel.isHidden = true
            additionalNotesLabel.isHidden = true
            
           // tableView.delegate = self
         //   tableView.dataSource = self
            
            // additionalNotesLabel.text = "Additional Notes: \(partsOfTempTeamData[8])"
            
            
            //hide unused labels when displaying pit scouting
            
            /*  friendlySwitchLabel.isHidden = true
             scaleLabel.isHidden = true
             opposingSwitchLabel.isHidden = true
             vaultLabel.isHidden = true
             driverLabel.isHidden = true
             climbLabel.isHidden = true
             robotsAssistedLabel.isHidden = true
             */
        }
            
        else{
            tableView.isHidden = true
            partsOfTempTeamData = tempTeamData.components(separatedBy: ",")
            print("tempTeamData = \(tempTeamData)")
            print(partsOfTempTeamData)
            
            let teamNum = teamNumberFromButton.components(separatedBy: ";")
            
            titleLabel.text = "Team \(teamNum[0])'s Data"
            matchLabel.text = "Match Number:\(partsOfTempTeamData[1])"
            scoutLabel.text = "Scout Name:\(partsOfTempTeamData[2])"
            startLabel.text = "Start Level:\(partsOfTempTeamData[3])"
            if partsOfTempTeamData[4] == "0" || partsOfTempTeamData[4] == " 0"{
                startFieldLabel.text = "Starting Field Piece: Null Hatch"
            }
            else{
                startFieldLabel.text = "Starting Field Piece: Cargo"
            }
            if partsOfTempTeamData[5] == "0" || partsOfTempTeamData[5] == " 0"{
                startRobotLabel.text = "Starting Robot Piece: Hatch"
            }
            else{
                startRobotLabel.text = "Starting Robot Piece: Cargo"
            }
            
            if partsOfTempTeamData[6] == "true" || partsOfTempTeamData[6] == " true"{
                sandstormLabel.text = "Sandstorm Vision: Camera"
            }
            else{
                sandstormLabel.text = "Sandstorm Vision: Auto"
            }
            
            cargoShipCargoLabel.text = "Cargo Ship Cargo: T:\(partsOfTempTeamData[7]) A:\(partsOfTempTeamData[9])"
            cargoShipHatchLabel.text = "Cargo Ship Hatches: T:\(partsOfTempTeamData[8]) A:\(partsOfTempTeamData[10])"
            
            rktLvl3CargoLabel.text = "Rkt. Lvl. 3 Cargo: T:\(partsOfTempTeamData[11]) A:\(partsOfTempTeamData[17])"
            rktLvl3HatchLabel.text = "Rkt. Lvl. 3 Hatches: T:\(partsOfTempTeamData[12]) A:\(partsOfTempTeamData[18])"
            
            rktLvl2CargoLabel.text = "Rkt. Lvl. 2 Cargo: T:\(partsOfTempTeamData[13]) A:\(partsOfTempTeamData[19])"
            rktLvl2HatchLabel.text = "Rkt. Lvl. 2 Hatches: T:\(partsOfTempTeamData[14]) A:\(partsOfTempTeamData[20])"
            
            rktLvl1CargoLabel.text = "Rkt. Lvl. 2 Cargo: T:\(partsOfTempTeamData[15]) A:\(partsOfTempTeamData[21])"
            rktLvl1HatchLabel.text = "Rkt. Lvl. 2 Hatches: T:\(partsOfTempTeamData[16]) A:\(partsOfTempTeamData[22])"
            
            climbingLabel.text = "Climbing Level:\(partsOfTempTeamData[23])"
            climbingNotesLabel.text = "Climbing Notes:\(partsOfTempTeamData[24])"
            
            additionalNotesLabel.text = "Additional Notes:\(partsOfTempTeamData[25])"
            
        }
        
        // additionalNotesLabel.text = "WHY U NO WORK?"
        
        //additionalNotesLabel.
        
        //  additionalNotesLabel.baselineAdjustment = .alignCenters
        
        
        titleLabel.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        matchLabel.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        scoutLabel.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        startLabel.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        startFieldLabel.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        startRobotLabel.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        sandstormLabel.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        cargoShipCargoLabel.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        cargoShipHatchLabel.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        rktLvl3CargoLabel.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        rktLvl3HatchLabel.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        rktLvl2CargoLabel.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        rktLvl2HatchLabel.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        rktLvl1CargoLabel.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        rktLvl1HatchLabel.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        climbingLabel.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        climbingNotesLabel.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        additionalNotesLabel.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        
        
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
