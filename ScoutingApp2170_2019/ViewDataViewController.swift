//
//  ViewDataViewController.swift
//  ScoutingApp2170_2019
//
//  Created by Leonard Liu on 2/2/19.
//  Copyright © 2019 Leonard Liu. All rights reserved.
//

import UIKit
var textCellIdentifier = "cell"
var teamNumberFromButton = ""
var matchDataList = [String]()
var pitDataList = [String]()
var superDataList = [String]()

class ViewDataViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var exportDataButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBAction func viewDataPressed(_ sender: Any) {
        
        let buttonPosition:CGPoint = (sender as AnyObject).convert(CGPoint.zero, to:self.tableView)
        let indexPath1 = self.tableView.indexPathForRow(at: buttonPosition)
        
        // teamNumberFromButton = teamList[indexPath1![1]]
    
        
        if indexPath1![1] < teamList.count {
            teamNumberFromButton = teamList[indexPath1![1]]
        }
        else if indexPath1![1] >= teamList.count && indexPath1![1] < teamList.count + pitScoutList.count{
            teamNumberFromButton = pitScoutList[(indexPath1![1] - teamList.count)]
        }
        else{
            teamNumberFromButton = superScoutList[(indexPath1![1]-teamList.count-pitScoutList.count)]
            //cell.textLabel?.text = "Match \(superScoutList[(row-teamList.count-pitScoutList.count)])"
        }
        
        
        print("teamNumberFromButton is \(teamNumberFromButton)")
        print(indexPath1![1])
        performSegue(withIdentifier: "segueToIndTeamData", sender: nil)
       // print("it worked")
    }
    @IBAction func exportDataPressed(_ sender: Any) {
        
        saveData()
        performSegue(withIdentifier: "segueToEmail", sender: nil)
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "segueBackToMainMenuFromViewData", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete {
            print("Deleted")
            
            if indexPath.row < teamList.count {
                UserDefaults.standard.removeObject(forKey: "\(teamList[indexPath.row])")
                teamList.remove(at: indexPath.row)
            }
            else if indexPath.row >= teamList.count && indexPath.row < teamList.count + pitScoutList.count{
                UserDefaults.standard.removeObject(forKey: "\(pitScoutList[(indexPath.row-teamList.count)])")
                pitScoutList.remove(at: (indexPath.row-teamList.count))
            }
            else{
                UserDefaults.standard.removeObject(forKey: "\(superScoutList[(indexPath.row-teamList.count-pitScoutList.count)])")
                superScoutList.remove(at: indexPath.row-teamList.count-pitScoutList.count)

            }

        /*
            if indexPath.row > (teamList.count - 1) && indexPath.row < (teamList.count + pitScoutList.count - 1){
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
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            //self.catNames.remove(at: indexPath.row)
            //tableView.beginUpdates()
            // print("here!")
            
            // print("here")
            //self.tableView.endUpdates()
            // print("here!!")
            
            
            //tableView.reloadData()
            // self.tableView.deleteRows(at: <#T##[IndexPath]#>, with: .)
            //print("hi")
            
            UserDefaults.standard.set(teamList, forKey: "teamList")
            UserDefaults.standard.set(pitScoutList, forKey: "pitScoutList")
             UserDefaults.standard.set(superScoutList, forKey: "superScoutList")
           // print("teamList is \(teamList)")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (teamList.count + pitScoutList.count + superScoutList.count)
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
        
        if row < teamList.count {
            cell.textLabel?.text = "Team \(teamList[row])"
        }
        else if row >= teamList.count && row < teamList.count + pitScoutList.count{
            cell.textLabel?.text = "Team \(pitScoutList[row-teamList.count])"
        }
        else{
            cell.textLabel?.text = "Match \(superScoutList[(row-teamList.count-pitScoutList.count)])"
        }
        
       /* if teamList.count == 0{
            cell.textLabel?.text = "Team \(pitScoutList[row])"
        }
        else if row > (teamList.count - 1) && row < ((teamList.count - 1) + pitScoutList.count){
            cell.textLabel?.text = "Team \(pitScoutList[((row + 1) - (teamList.count + 1))])"
        }
        else if row >= ((teamList.count - 1) + pitScoutList.count){
            cell.textLabel?.text = "Match \(superScoutList[((row + 1) - (teamList.count + 1 + pitScoutList.count))])"
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
        
        if runType == 1{
            exportDataButton.titleLabel!.font = UIFont.init(name: "Futura-MediumItalic", size: 75)
        }
        else if runType == 2{
            exportDataButton.titleLabel!.font = UIFont.init(name: "Futura-MediumItalic", size: 40)
        }
        
        teamNumberFromButton = ""
        tableView.delegate = self
        tableView.dataSource = self
        exportDataButton.titleLabel!.adjustsFontSizeToFitWidth = true
        exportDataButton.titleLabel!.numberOfLines = 2
        exportDataButton.titleLabel!.minimumScaleFactor = 0.25
        exportDataButton.titleLabel!.textAlignment = NSTextAlignment.center
        exportDataButton.setTitleColor(UIColor.init(red: 0.0431372549, green: 0.1294117647, blue: 0.50196078431, alpha: 1.0), for: .normal)
        
        if UserDefaults.standard.array(forKey: "teamList") != nil{
            teamList = UserDefaults.standard.object(forKey: "teamList") as! [String]
            print("\(teamList) and \(teamList.count)")
            
        }
        else{
            print("teamList is nil")
        }
        if UserDefaults.standard.array(forKey: "pitScoutList") != nil{
            pitScoutList = UserDefaults.standard.object(forKey: "pitScoutList") as! [String]
            print("\(pitScoutList) and \(pitScoutList.count)")
            
        }
        else{
            print("pitScoutList is nil")
        }
        if UserDefaults.standard.array(forKey: "superScoutList") != nil{
            superScoutList = UserDefaults.standard.object(forKey: "superScoutList") as! [String]
            print("\(superScoutList) and \(superScoutList.count)")
            
        }
        else{
            print("superScoutList is nil")
        }
        
        createDirectory()
        var DocumentURL = getDocumentsDirectory()
        var DocumentURL2 = getDocumentsDirectory()
        
        url = DocumentURL.appendingPathComponent("Spreadsheet2.csv")
        url2 = DocumentURL2.appendingPathComponent("Spreadsheet2 copy.csv")
        url3 = DocumentURL2.appendingPathComponent("Spreadsheet2 copy 2.csv")
        //.appendingPathExtension("csv")
        
        
        
        print("url is : \(url)")
        print("url2 is: \(url2)")
        
        if let dirs : [String] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true) as? [String] {
            // let dir = dirs[0] //documents directory
            // let path = dir.appendingPathComponent("csv")
            
            
            //writing
            //text.writeToFile("\(DocumentURL)", atomically: false, encoding: .utf8)
            //try! text.write(to: url, atomically: true, encoding: String.Encoding.utf8)
            /*    let titleString = "Team Number, Match Number, Scout Number, Crosses Auto Line, Auto Cubes, Cube Capture Effectiveness, Friendly Switch Cubes, Scale Cubes, Opposing Switch Cubes, Vault Cubes, Driver Abilities, Climbing, Ramp, Additional Notes"
             do {
             //let text = "some text"
             print("\(url)")
             try "\(titleString)\n".write(to: url, atomically: true, encoding: String.Encoding.utf8)
             print("It worked!!!")
             } catch {
             print(error)
             }
             */
            //reading
            do {
                // Read the file contents
                readString = try String(contentsOf: url!)
            } catch let error as NSError {
                print("Failed reading from URL: \(url!), Error: " + error.localizedDescription)
            }
            print("File Text: \(readString)!!!")
            
            do {
                //let text = "some text"
                //  print("\(url)")
                let text = ""
                try text.write(to: url, atomically: true, encoding: String.Encoding.utf8)
                print("It worked??")
            } catch {
                print(error)
            }
            
            do {
                // Read the file contents
                readString = try String(contentsOf: url!)
            } catch let error as NSError {
                print("Failed reading from URL: \(url!), Error: " + error.localizedDescription)
            }
            print("File Text: \(readString)!!")
            
            //let text2 = String(contentsOfFile: "\(DocumentURL)", encoding: .utf8)
            //print(text2)
        }
        
        let fileManager = FileManager.default
        // let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        do {
            let fileURLs = try fileManager.contentsOfDirectory(at: DocumentURL, includingPropertiesForKeys: nil)
            print("fileURLs is \(fileURLs)")
            // process files
        } catch {
            //print("Error while enumerating files \(destinationFolder.path): \(error.localizedDescription)")
        }
        
        //////////////////////
        
        if let dirs : [String] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true) as? [String] {
            // let dir = dirs[0] //documents directory
            // let path = dir.appendingPathComponent("csv")
            
            
            //writing
            //text.writeToFile("\(DocumentURL)", atomically: false, encoding: .utf8)
            //try! text.write(to: url, atomically: true, encoding: String.Encoding.utf8)
            /*    let titleString = "Team Number, Match Number, Scout Number, Crosses Auto Line, Auto Cubes, Cube Capture Effectiveness, Friendly Switch Cubes, Scale Cubes, Opposing Switch Cubes, Vault Cubes, Driver Abilities, Climbing, Ramp, Additional Notes"
             do {
             //let text = "some text"
             print("\(url)")
             try "\(titleString)\n".write(to: url, atomically: true, encoding: String.Encoding.utf8)
             print("It worked!!!")
             } catch {
             print(error)
             }
             */
            //reading
            do {
                // Read the file contents
                readString = try String(contentsOf: url2!)
            } catch let error as NSError {
                print("Failed reading from URL: \(url2!), Error: " + error.localizedDescription)
            }
            print("Pit Scout Text: \(readString)!!!")
            
            do {
                //let text = "some text"
                //  print("\(url)")
                let text = ""
                try text.write(to: url2, atomically: true, encoding: String.Encoding.utf8)
                print("It worked??")
            } catch {
                print(error)
            }
            
            do {
                // Read the file contents
                readString = try String(contentsOf: url2!)
            } catch let error as NSError {
                print("Failed reading from URL: \(url2!), Error: " + error.localizedDescription)
            }
            print("Pit Scout Text: \(readString)!!")
            
            //let text2 = String(contentsOfFile: "\(DocumentURL)", encoding: .utf8)
            //print(text2)
        }
        
        if let dirs : [String] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true) as? [String] {
            // let dir = dirs[0] //documents directory
            // let path = dir.appendingPathComponent("csv")
            
            
            //writing
            //text.writeToFile("\(DocumentURL)", atomically: false, encoding: .utf8)
            //try! text.write(to: url, atomically: true, encoding: String.Encoding.utf8)
            /*    let titleString = "Team Number, Match Number, Scout Number, Crosses Auto Line, Auto Cubes, Cube Capture Effectiveness, Friendly Switch Cubes, Scale Cubes, Opposing Switch Cubes, Vault Cubes, Driver Abilities, Climbing, Ramp, Additional Notes"
             do {
             //let text = "some text"
             print("\(url)")
             try "\(titleString)\n".write(to: url, atomically: true, encoding: String.Encoding.utf8)
             print("It worked!!!")
             } catch {
             print(error)
             }
             */
            //reading
            do {
                // Read the file contents
                readString = try String(contentsOf: url3!)
            } catch let error as NSError {
                print("Failed reading from URL: \(url3!), Error: " + error.localizedDescription)
            }
            //print("Pit Scout Text: \(readString)!!!")
            
            do {
                //let text = "some text"
                //  print("\(url)")
                let text = ""
                try text.write(to: url3, atomically: true, encoding: String.Encoding.utf8)
                print("It worked??")
            } catch {
                print(error)
            }
            
            do {
                // Read the file contents
                readString = try String(contentsOf: url3!)
            } catch let error as NSError {
                print("Failed reading from URL: \(url3!), Error: " + error.localizedDescription)
            }
            //print("Pit Scout Text: \(readString)!!")
            
            //let text2 = String(contentsOfFile: "\(DocumentURL)", encoding: .utf8)
            //print(text2)
        }
        
        //let fileManager = FileManager.default
        // let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        do {
            let fileURLs = try fileManager.contentsOfDirectory(at: DocumentURL, includingPropertiesForKeys: nil)
            print("fileURLs is \(fileURLs)")
            // process files
        } catch {
            //print("Error while enumerating files \(destinationFolder.path): \(error.localizedDescription)")
        }
        
        do {
            // Read the file contents
            readString = try String(contentsOf: url!)
            
            print("Data Text is : \(readString) ||||")
        } catch let error as NSError {
            print("Failed reading from URL: \(url!), Error: " + error.localizedDescription)
        }
        
        do {
            // Read the file contents
            readString = try String(contentsOf: url2!)
            
            print("Pit Scout Text is : \(readString) ||||")
        } catch let error as NSError {
            print("Failed reading from URL: \(url2!), Error: " + error.localizedDescription)
        }
        do {
            // Read the file contents
            readString = try String(contentsOf: url3!)
            
            //print("Pit Scout Text is : \(readString) ||||")
        } catch let error as NSError {
            print("Failed reading from URL: \(url3!), Error: " + error.localizedDescription)
        }
        
        
    }
    
    
    func saveData(){
        if UserDefaults.standard.array(forKey: "teamList") != nil{
            teamList = UserDefaults.standard.object(forKey: "teamList") as! [String]
            print("teamList is \(teamList)")
            matchDataList = Array(repeating: "", count: teamList.count)
            
            if teamList.isEmpty == false{
                for index in 0...teamList.count - 1{
                    print(index)
                    print(teamList[index])
                    matchDataList[index] = UserDefaults.standard.object(forKey: "\(teamList[index])") as! String

                    
                }

                
                // Used to store the file contents
                do {
                    // Read the file contents
                    readString = try String(contentsOf: url!)
                    
                    
                    print("Data Text is : \(readString) ||||")
                } catch let error as NSError {
                    print("Failed reading from URL: \(url!), Error: " + error.localizedDescription)
                }
                
  
                
                for i in 0...teamList.count-1 {
                    //dataString =  String(list1[i]) + ": " + list2[i] + list3[i] + "\n"
                    //Check if file exists
                    
                    
                    do {
                        let fileHandle = try FileHandle(forWritingTo: url!)
                        fileHandle.seekToEndOfFile()
                        
                        fileHandle.write("\(matchDataList[i])\n".data(using: .utf8)!)
                        
                    
                        
                        fileHandle.closeFile()
                    } catch {
                        print("Error writing to file \(error)")
                    }
                    //print(firstRow)
                    //  print("Saving data in: \(url.path)")
                }
                
                /*
                 if let filepath = Bundle.main.path(forResource: "SampleSpreadsheet", ofType: "csv") {
                 do {
                 let contents = try String(contentsOfFile: filepath)
                 print(": " + contents)
                 } catch {
                 // contents could not be loaded
                 }
                 } else {
                 // example.txt not found!
                 }
                 */
                //var readString = "" // Used to store the file contents
                do {
                    // Read the file contents
                    readString = try String(contentsOf: url!)
                } catch let error as NSError {
                    print("Failed reading from URL: \(url!), Error: " + error.localizedDescription)
                }
                
                // let aString = "This is my string"
                
                //    print("File Text is : \(readString) ||||")
                
                
                //
                
            }
            
            
        }
        //uncomment this for email export
        //performSegue(withIdentifier: "segueWithEmail", sender: nil)
        
        //.writeToURL(url, atomically: true)
        
        
        ////////////////
        
        if UserDefaults.standard.array(forKey: "pitScoutList") != nil{
            pitScoutList = UserDefaults.standard.object(forKey: "pitScoutList") as! [String]
            print("pitScoutList is \(pitScoutList)")
            pitDataList = Array(repeating: "", count: pitScoutList.count)
            
            if pitScoutList.isEmpty == false{
                for index in 0...pitScoutList.count - 1{
                    pitDataList[index] = UserDefaults.standard.object(forKey: "\(pitScoutList[index])") as! String

                }
                // Used to store the file contents
                do {
                    // Read the file contents
                    readString = try String(contentsOf: url2!)
                    
                    print("Pit Scout Text is : \(readString) ||||")
                } catch let error as NSError {
                    print("Failed reading from URL: \(url2!), Error: " + error.localizedDescription)
                }
                for i in 0...pitScoutList.count-1 {
                    //dataString =  String(list1[i]) + ": " + list2[i] + list3[i] + "\n"
                    //Check if file exists
                    
                    
                    do {
                        let fileHandle = try FileHandle(forWritingTo: url2!)
                        fileHandle.seekToEndOfFile()
                        fileHandle.write("\(pitDataList[i])\n".data(using: .utf8)!)
                        
                        fileHandle.closeFile()
                    } catch {
                        print("Error writing to file \(error)")
                    }
                    //print(firstRow)
                    //  print("Saving data in: \(url.path)")
                }
                do {
                    // Read the file contents
                    readString = try String(contentsOf: url2!)
                } catch let error as NSError {
                    print("Failed reading from URL: \(url2!), Error: " + error.localizedDescription)
                }

                
            }
            
            
            
        }
        
        if UserDefaults.standard.array(forKey: "superScoutList") != nil{
            superScoutList = UserDefaults.standard.object(forKey: "superScoutList") as! [String]
           // print("pitScoutList is \(pitScoutList)")
            superDataList = Array(repeating: "", count: superScoutList.count)
            
            if superDataList.isEmpty == false{
                for index in 0...superDataList.count - 1{
                    superDataList[index] = UserDefaults.standard.object(forKey: "\(superScoutList[index])") as! String
                    
                }
                // Used to store the file contents
                do {
                    // Read the file contents
                    readString = try String(contentsOf: url3!)
                    
                    print("Super Scout Text is : \(readString) ||||")
                } catch let error as NSError {
                    print("Failed reading from URL: \(url3!), Error: " + error.localizedDescription)
                }
                for i in 0...superDataList.count-1 {
                    //dataString =  String(list1[i]) + ": " + list2[i] + list3[i] + "\n"
                    //Check if file exists
                    
                    
                    do {
                        let fileHandle = try FileHandle(forWritingTo: url3!)
                        fileHandle.seekToEndOfFile()
                        fileHandle.write("\(superDataList[i])\n".data(using: .utf8)!)
                        
                        fileHandle.closeFile()
                    } catch {
                        print("Error writing to file \(error)")
                    }
                    //print(firstRow)
                    //  print("Saving data in: \(url.path)")
                }
                do {
                    // Read the file contents
                    readString = try String(contentsOf: url3!)
                } catch let error as NSError {
                    print("Failed reading from URL: \(url3!), Error: " + error.localizedDescription)
                }
                
                
            }
            
            
            
        }
        
        //uncomment this for email export
        //performSegue(withIdentifier: "segueWithEmail", sender: nil)
        
        //.writeToURL(url, atomically: true)
        
        
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    func createDirectory(){
        let fileManager = FileManager.default
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("customDirectory")
        if !fileManager.fileExists(atPath: paths){
            try! fileManager.createDirectory(atPath: paths, withIntermediateDirectories: true, attributes: nil)
        }else{
            print("Already dictionary created.")
        }
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
