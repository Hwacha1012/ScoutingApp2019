//
//  FirebaseViewController.swift
//  ScoutingApp2170_2019
//
//  Created by Leonard Liu on 2/26/19.
//  Copyright © 2019 Leonard Liu. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseUI

var userName = ""

class FirebaseViewController: UIViewController {
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var sendButton: UIButton!
    
    @IBAction func backButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "segueBack", sender: nil)
        
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
    
        let authUI = FUIAuth.defaultAuthUI()
        guard authUI != nil else{
            return
        }
      //  let googleProvider = FUIGoogleAuth.init()
       // var googleProvider2 = FUIAuthProvider.self
        let providers = [FUIEmailAuth()]
        authUI?.delegate = self
        authUI?.providers = providers as! [FUIAuthProvider]
        //authUI?.providers = [googleProvider2]
        let authViewController = authUI!.authViewController()
        
        present(authViewController, animated: true, completion: nil)
        
    }
    @IBAction func sendDataPressed(_ sender: Any) {
        
        
        guard UserDefaults.standard.array(forKey: "teamList") != nil else{
            return
        }
        teamList = UserDefaults.standard.array(forKey: "teamList") as! [String]
        if teamList.count != 0{
            for i in 0...teamList.count-1{
                // 2
                let matchData = MatchData(name: teamList[i],
                                          addedByUser: userName,
                                          completed: false, key: teamList[i], data: UserDefaults.standard.string(forKey: teamList[i])!)
                // 3
                let ref = matchDataRef.child(teamList[i])
                
                // 4
                ref.setValue(matchData.toAnyObject())
            }
            
        }
        
        
        guard UserDefaults.standard.array(forKey: "pitScoutList") != nil else{
            return
        }
        pitScoutList = UserDefaults.standard.array(forKey: "pitScoutList") as! [String]
        if pitScoutList.count != 0{
            for i in 0...pitScoutList.count-1{
                // 2
                let matchData = MatchData(name: pitScoutList[i],
                                          addedByUser: userName,
                                          completed: false, key: pitScoutList[i], data: UserDefaults.standard.string(forKey: pitScoutList[i])!)
                // 3
                let ref = pitDataRef.child(pitScoutList[i])
                
                // 4
                pitDataRef.setValue(matchData.toAnyObject())
            }
            
        }
        
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(runType == 1){
            loginButton.titleLabel!.font = UIFont.init(name: "Optima-BoldItalic", size: 65)
            sendButton.titleLabel!.font = UIFont.init(name: "Optima-BoldItalic", size: 65)
        }
        else if(runType == 2){
            loginButton.titleLabel!.font = UIFont.init(name: "Optima-BoldItalic", size: 40)
            sendButton.titleLabel!.font = UIFont.init(name: "Optima-BoldItalic", size: 40)
        }
        
        loginButton.titleLabel!.minimumScaleFactor = 0.01
        loginButton.titleLabel!.numberOfLines = 2
        loginButton.titleLabel!.adjustsFontSizeToFitWidth = true
        loginButton.titleLabel!.textAlignment = NSTextAlignment.center
        
        loginButton.setTitleColor(UIColor.init(red: 0.0431372549, green: 0.1294117647, blue: 0.50196078431, alpha: 1.0), for: .normal)
        
        sendButton.titleLabel!.minimumScaleFactor = 0.01
        sendButton.titleLabel!.numberOfLines = 2
        sendButton.titleLabel!.adjustsFontSizeToFitWidth = true
        sendButton.titleLabel!.textAlignment = NSTextAlignment.center
        
        sendButton.setTitleColor(UIColor.init(red: 0.0431372549, green: 0.1294117647, blue: 0.50196078431, alpha: 1.0), for: .normal)
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

}

extension FirebaseViewController: FUIAuthDelegate{
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataresult: AuthDataResult?, error: Error?){
        guard error == nil else{
            //log the error
            return
        }
        print("Firebase worked")
        userName = (authDataresult?.user.uid)!
        
       // performSegue(withIdentifier: "segueToLogin", sender: nil)
    }
    
    
}
