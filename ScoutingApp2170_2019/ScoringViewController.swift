//
//  ScoringViewController.swift
//  ScoutingApp2170_2019
//
//  Created by Leonard Liu on 1/19/19.
//  Copyright © 2019 Leonard Liu. All rights reserved.
//

import UIKit
//var autoMode = false
var selectedRocket: Int!

class ScoringViewController: UIViewController {
    @IBOutlet weak var topRocketButton: UIButton!
    @IBOutlet weak var bottomRocketButton: UIButton!
    
    @IBOutlet weak var cargoButton: UIButton!
    @IBAction func backButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "segueBackScoring", sender: nil)
    }
    @IBAction func topButtonPressed(_ sender: Any) {
       // checkMode()
        selectedRocket = 1
        performSegue(withIdentifier: "segueScoringtoRocket", sender: nil)
        
    }
    @IBAction func cargoPressed(_ sender: Any) {
       // checkMode()
        
        performSegue(withIdentifier: "segueToCargo", sender: nil)
        
    }
    @IBAction func bottomButtonPressed(_ sender: Any) {
       // checkMode()
        
        selectedRocket = 2
        performSegue(withIdentifier: "segueScoringtoRocket", sender: nil)
    }
    @IBAction func forwardButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "segueToFinishMatch", sender: nil)
        
    }
    
//    func checkMode(){
//        if modeSegmentedControl.selectedSegmentIndex == 0{
//            autoMode = true
//        }
//        else{
//            autoMode = false
//        }
//
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

      //  if firstTime {
           // autoMode = true
           // firstTime = false
           // modeSegmentedControl.selectedSegmentIndex = 0
      //  }
        
       // if !autoMode{
       //     modeSegmentedControl.selectedSegmentIndex = 1
       // }
        
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
