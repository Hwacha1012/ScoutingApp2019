//
//  ViewController.swift
//  ScoutingApp2170_2019
//
//  Created by Leonard Liu on 1/15/19.
//  Copyright © 2019 Leonard Liu. All rights reserved.
//

import UIKit
import Foundation
import SwiftyDropbox
import Firebase
import FirebaseStorage
import FirebaseDatabase
import FirebaseUI

var storage = Storage.storage()
var rootRef = Database.database().reference()

// 2
var childRef = Database.database().reference(withPath: "match-data")

// 3
var itemsRef = rootRef.child("match-data")
var matchDataRef = Database.database().reference(withPath: "match-data")
var superScoutRef = Database.database().reference(withPath: "super-scout")
var pitDataRef = Database.database().reference(withPath: "pit-data")

var scoutName = ""
var teamNum = ""
var matchNum = ""
var startLevel:Int!
var fieldPiece:Int!
var robotPiece:Int!
var sandstormVision:Bool!
var pSdrivetrain = ""
var pSclimbing:Int!
var pSclimber = ""
var pSIntake = ""
var pSSandstorm = ""

//var climber:Int!
var climbing:Int!
var climberNotes = ""
var additionalNotes = ""
var cargoShipCargo:[Int] = Array(repeating: 0, count: 8)
var cargoShipHatches:[Int] = Array(repeating: 0, count: 8)
var rocket1Cargo:[Int] = Array(repeating: 0, count: 3)
var rocket2Cargo:[Int] = Array(repeating: 0, count: 3)
var rocket1Hatches:[Int] = Array(repeating: 0, count: 6)
var rocket2Hatches:[Int] = Array(repeating: 0, count: 6)

var cargoShipCargoCount = 0
var cargoShipHatchCount = 0
var cargoShipCargoAuto = 0
var cargoShipHatchAuto = 0


var rocketLevel1CargoCount = 0
var rocketLevel1HatchCount = 0
var rocketLevel2CargoCount = 0
var rocketLevel2HatchCount = 0
var rocketLevel3CargoCount = 0
var rocketLevel3HatchCount = 0

var rocketLevel1CargoAuto = 0
var rocketLevel1HatchAuto = 0
var rocketLevel2CargoAuto = 0
var rocketLevel2HatchAuto = 0
var rocketLevel3CargoAuto = 0
var rocketLevel3HatchAuto = 0

var furthestPointMoved: Int!

var firstTime = true
var runType:Int!
var deviceName = UIDevice.current.model


var teamList = [String]()
var pitScoutList = [String]()
var photoList = [String]()
var superScoutList = [String]()
var firstSet = ""

var pSteamNum = ""
var photoEnterLocation: Int!

//var ref = Database.database().reference(withPath: "match-data")
var url: URL!
var url2: URL!
var url3: URL!
var dropboxURL: URL!
var readString = ""

var image: UIImage!

var qrCodeString = ""
var handle = Auth.auth().addStateDidChangeListener { (auth, user) in
    // ...
}


class ViewController: UIViewController {
    fileprivate(set) var auth:FirebaseAuth.Auth?
    fileprivate(set) var authUI: FUIAuth? //only set internally but get externally
    fileprivate(set) var authStateListenerHandle: AuthStateDidChangeListenerHandle?
    
    @IBOutlet weak var titleLabel1: UILabel!
    @IBOutlet weak var titleLabel2: UILabel!
    
    @IBOutlet weak var enterDataButton: UIButton!
    @IBOutlet weak var viewDataButton: UIButton!
    @IBOutlet weak var qrButton: UIButton!
    @IBOutlet weak var firebaseButton: UIButton!
    @IBAction func enterData(_ sender: Any) {

        performSegue(withIdentifier: "segueToDataEntry", sender: nil)
    }
    @IBAction func viewData(_ sender: Any) {
        print(teamList)
        performSegue(withIdentifier: "segueToViewData", sender: nil)
    }
    @IBAction func qrEnter(_ sender: Any) {
        performSegue(withIdentifier: "segueToQRSplit", sender: nil)
    }
    @IBAction func fireBaseEnter(_ sender: Any) {
        performSegue(withIdentifier: "segueToServerStuff", sender: nil)
    }
    
  /*  override func viewDidAppear(_ animated: Bool) {
        Analytics.setScreenName("ViewController", screenClass: "ViewController")
        
        self.auth = Auth.auth()
        self.authUI = FUIAuth.defaultAuthUI()
        
        self.authUI?.delegate = self as! FUIAuthDelegate
        self.authUI?.providers = [FUIAuth.init(uiWith: self.auth!)] as! [FUIAuthProvider]
      //  self.authUI?.providers = [Auth(authUI: self.authUI!),]
        
        
        self.authStateListenerHandle = self.auth?.addStateDidChangeListener { (auth, user) in
            guard user != nil else {
                self.loginAction()
                return
            }
        }
        
        
    }
    func loginAction(){
        let authViewController = authUI?.authViewController();
        self.present(authViewController!, animated: true, completion: nil)
    }
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        runType = 2
        
        
        if deviceName.range(of:"iPad") != nil{
            //device is iPad
            runType = 1
        }
        else if deviceName.range(of: "iPhone") != nil{
            //device is iPhone
            // print("deviceName is \(deviceName)")
            runType = 2
        }
        print("deviceName is \(deviceName)!")
        
        if(runType == 1){
            enterDataButton.titleLabel!.font = UIFont.init(name: "Optima-BoldItalic", size: 65)
            viewDataButton.titleLabel!.font = UIFont.init(name: "Optima-BoldItalic", size: 65)
            qrButton.titleLabel!.font = UIFont.init(name: "Optima-BoldItalic", size: 65)
            firebaseButton.titleLabel!.font = UIFont.init(name: "Optima-BoldItalic", size: 65)
           // pitScoutingButton.titleLabel!.font = UIFont.init(name: "Optima-BoldItalic", size: 65)
            titleLabel1.font = UIFont.init(name: "Futura-MediumItalic", size: 120)
            titleLabel1.font = UIFont.init(name: "Futura-MediumItalic", size: 120)
        }
        else{
            enterDataButton.titleLabel!.font = UIFont.init(name: "Optima-BoldItalic", size: 40)
            viewDataButton.titleLabel!.font = UIFont.init(name: "Optima-BoldItalic", size: 40)
            qrButton.titleLabel!.font = UIFont.init(name: "Optima-BoldItalic", size: 40)
            firebaseButton.titleLabel!.font = UIFont.init(name: "Optima-BoldItalic", size: 40)
            // pitScoutingButton.titleLabel!.font = UIFont.init(name: "Optima-BoldItalic", size: 65)
            titleLabel1.font = UIFont.init(name: "Futura-MediumItalic", size: 75)
            titleLabel1.font = UIFont.init(name: "Futura-MediumItalic", size: 75)
        }
        
        titleLabel1.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        titleLabel2.textColor = UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        titleLabel1.adjustsFontSizeToFitWidth = true
        titleLabel2.adjustsFontSizeToFitWidth = true
        
        titleLabel1.minimumScaleFactor = 0.01
        titleLabel2.minimumScaleFactor = 0.01
        
        enterDataButton.titleLabel!.minimumScaleFactor = 0.01
        enterDataButton.titleLabel!.numberOfLines = 2
        enterDataButton.titleLabel!.adjustsFontSizeToFitWidth = true
        enterDataButton.titleLabel!.textAlignment = NSTextAlignment.center
        
        enterDataButton.setTitleColor(UIColor.init(red: 0.0431372549, green: 0.1294117647, blue: 0.50196078431, alpha: 1.0), for: .normal)
        
        qrButton.titleLabel!.minimumScaleFactor = 0.01
        qrButton.titleLabel!.numberOfLines = 2
        qrButton.titleLabel!.adjustsFontSizeToFitWidth = true
        qrButton.titleLabel!.textAlignment = NSTextAlignment.center
        
        qrButton.setTitleColor(UIColor.init(red: 0.0431372549, green: 0.1294117647, blue: 0.50196078431, alpha: 1.0), for: .normal)
        
        viewDataButton.titleLabel!.minimumScaleFactor = 0.01
        viewDataButton.titleLabel!.numberOfLines = 2
        viewDataButton.titleLabel!.adjustsFontSizeToFitWidth = true
        viewDataButton.titleLabel!.textAlignment = NSTextAlignment.center
        
        viewDataButton.setTitleColor(UIColor.init(red: 0.0431372549, green: 0.1294117647, blue: 0.50196078431, alpha: 1.0), for: .normal)
        
        firebaseButton.titleLabel!.minimumScaleFactor = 0.01
        firebaseButton.titleLabel!.numberOfLines = 2
        firebaseButton.titleLabel!.adjustsFontSizeToFitWidth = true
        firebaseButton.titleLabel!.textAlignment = NSTextAlignment.center
        
        firebaseButton.setTitleColor(UIColor.init(red: 0.0431372549, green: 0.1294117647, blue: 0.50196078431, alpha: 1.0), for: .normal)
        
        furthestPointMoved = 0
        
        //uncomment to remove userdefaults
    // UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
//UserDefaults.standard.synchronize()
        
    }


}

