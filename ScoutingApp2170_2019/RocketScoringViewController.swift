//
//  RocketScoringViewController.swift
//  ScoutingApp2170_2019
//
//  Created by Leonard Liu on 1/22/19.
//  Copyright © 2019 Leonard Liu. All rights reserved.
//

import UIKit
var cargoImage = "CargoBall.png"
var hatchImage = "Hatch4.png"
var blankImage = "BlankImage.png"
var autoCargo: Int!
var teleOpCargo: Int!
var autoHatch: Int!
var teleOpHatch: Int!
var selectedSection: Int!

class RocketScoringViewController: UIViewController {

    //var rocketButtonDictionary = [
   //     101 : self.cargoButton1
        
        
    //]
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var popupTitleLabel: UILabel!
    @IBOutlet weak var popupAutoLabel: UILabel!
    @IBOutlet weak var popupTeleOpLabel: UILabel!
    @IBOutlet weak var autoAddButton: UIButton!
    @IBOutlet weak var autoMinusButton: UIButton!
    @IBOutlet weak var teleopAddButton: UIButton!
    @IBOutlet weak var teleopMinusButton: UIButton!
    @IBOutlet weak var enterDataButton: UIButton!
    
    @IBOutlet weak var cargoButton1: UIButton!
    @IBOutlet weak var cargoButton2: UIButton!
    @IBOutlet weak var cargoButton3: UIButton!
    @IBOutlet weak var hatchButton1: UIButton!
    @IBOutlet weak var hatchButton2: UIButton!
    @IBOutlet weak var hatchButton3: UIButton!
    @IBOutlet weak var hatchButton4: UIButton!
    @IBOutlet weak var hatchButton5: UIButton!
    @IBOutlet weak var hatchButton6: UIButton!
    
    @IBOutlet weak var clearDataButton: UIButton!
    
    @IBAction func cargoButton1Pressed(_ sender: Any) {
        popupDisplayed(index: 0)
        selectedSection = 0
    }
    @IBAction func cargoButton2Pressed(_ sender: Any) {
        popupDisplayed(index: 1)
        selectedSection = 1
    }
    @IBAction func cargoButton3Pressed(_ sender: Any) {
        popupDisplayed(index: 2)
        selectedSection = 2
    }
    @IBAction func hatchButton1Pressed(_ sender: Any) {
        popupDisplayed(index: 3)
        selectedSection = 3
    }
    @IBAction func hatchButton2Pressed(_ sender: Any) {
        popupDisplayed(index: 4)
        selectedSection = 4
    }
    @IBAction func hatchButton3Pressed(_ sender: Any) {
        popupDisplayed(index: 5)
        selectedSection = 5
    }
    @IBAction func hatchButton4Pressed(_ sender: Any) {
        popupDisplayed(index: 6)
        selectedSection = 6
    }
    @IBAction func hatchButton5Pressed(_ sender: Any) {
        popupDisplayed(index: 7)
        selectedSection = 7
    }
    @IBAction func hatchButton6Pressed(_ sender: Any) {
        popupDisplayed(index: 8)
        selectedSection = 8
    }
    
    @IBAction func autoPlusButtonPressed(_ sender: Any) {
        
        if selectedSection < 3 && selectedRocket == 1{
            if autoCargo + teleOpCargo < 2{
                autoCargo += 1
                rocket1Cargo[selectedSection] -= 2
                popupAutoLabel.text = "Auto: \(autoCargo!)"
            }
        }
        else if selectedSection < 3 && selectedRocket == 2{
            if autoCargo + teleOpCargo < 2{
                autoCargo += 1
                rocket2Cargo[selectedSection] -= 2
                popupAutoLabel.text = "Auto: \(autoCargo!)"
            }
        }
        else if selectedRocket == 1{
            if autoHatch + teleOpHatch < 1{
                autoHatch += 1
                rocket1Hatches[selectedSection - 3] += 2
                popupAutoLabel.text = "Auto: \(autoHatch!)"
            }
        }
        else if selectedRocket == 2{
            if autoHatch + teleOpHatch < 1{
                autoHatch += 1
                rocket2Hatches[selectedSection - 3] += 2
                popupAutoLabel.text = "Auto: \(autoHatch!)"
            }
        }
        
        
        
    }
    @IBAction func autoMinusButtonPressed(_ sender: Any) {
        if selectedSection < 3 && selectedRocket == 1{
            if autoCargo > 0{
                autoCargo -= 1
                rocket1Cargo[selectedSection] += 2
                popupAutoLabel.text = "Auto: \(autoCargo!)"
            }
        }
        else if selectedSection < 3 && selectedRocket == 2{
            if autoCargo > 0{
                autoCargo -= 1
                rocket2Cargo[selectedSection] += 2
                popupAutoLabel.text = "Auto: \(autoCargo!)"
            }
        }
        else if selectedRocket == 1{
            if autoHatch > 0{
                autoHatch -= 1
                rocket1Hatches[selectedSection - 3] -= 2
                popupAutoLabel.text = "Auto: \(autoHatch!)"
            }
        }
        else if selectedRocket == 2{
            if autoHatch > 0{
                autoHatch -= 1
                rocket2Hatches[selectedSection - 3] -= 2
                popupAutoLabel.text = "Auto: \(autoHatch!)"
            }
        }
        
    }
    @IBAction func teleopPlusButtonPressed(_ sender: Any) {
        if selectedSection < 3 && selectedRocket == 1{
            if autoCargo + teleOpCargo < 2{
                teleOpCargo += 1
                rocket1Cargo[selectedSection] += 1
                popupTeleOpLabel.text = "Tele-Op: \(teleOpCargo!)"
            }
        }
       else if selectedSection < 3 && selectedRocket == 2{
            if autoCargo + teleOpCargo < 2{
                teleOpCargo += 1
                rocket2Cargo[selectedSection] += 1
                popupTeleOpLabel.text = "Tele-Op: \(teleOpCargo!)"
            }
        }
        else if selectedRocket == 1{
            if teleOpHatch + autoHatch < 1{
                teleOpHatch += 1
                rocket1Hatches[selectedSection - 3] += 1
                popupTeleOpLabel.text = "Tele-Op: \(teleOpHatch!)"
            }
        }
        else if selectedRocket == 2{
            if teleOpHatch + autoHatch < 1{
                teleOpHatch += 1
                rocket2Hatches[selectedSection - 3] += 1
                popupTeleOpLabel.text = "Tele-Op: \(teleOpHatch!)"
            }
        }
        
    }
    @IBAction func teleopMinusButtonPressed(_ sender: Any) {
        if selectedSection < 3 && selectedRocket == 1{
            if teleOpCargo > 0{
                teleOpCargo -= 1
                rocket1Cargo[selectedSection] -= 1
                popupTeleOpLabel.text = "Tele-Op: \(teleOpCargo!)"
            }
        }
        else if selectedSection < 3 && selectedRocket == 2{
            if teleOpCargo > 0{
                teleOpCargo -= 1
                rocket2Cargo[selectedSection] -= 1
                popupTeleOpLabel.text = "Tele-Op: \(teleOpCargo!)"
            }
        }
        else if selectedRocket == 1{
            if teleOpHatch > 0{
                teleOpHatch -= 1
                rocket1Hatches[selectedSection - 3] -= 1
                popupTeleOpLabel.text = "Tele-Op: \(teleOpHatch!)"
            }
        }
        else if selectedRocket == 2{
            if teleOpHatch > 0{
                teleOpHatch -= 1
                rocket2Hatches[selectedSection - 3] -= 1
                popupTeleOpLabel.text = "Tele-Op: \(teleOpHatch!)"
            }
        }
        
        
    }
    @IBAction func enterDataButtonPressed(_ sender: Any) {
        if selectedSection < 3 && selectedRocket == 1{
            rocket1Cargo[selectedSection] = (autoCargo * -2) + teleOpCargo
        }
        else if selectedSection < 3 && selectedRocket == 2{
            rocket2Cargo[selectedSection] = (autoCargo * -2) + teleOpCargo
        }
        else if selectedRocket == 1{
            rocket1Hatches[selectedSection - 3] = (autoHatch * 2) + teleOpHatch
        }
        else if selectedRocket == 2{
            rocket2Hatches[selectedSection - 3] = (autoHatch * 2) + teleOpHatch
        }
        popupHide()
        updateImages()
    }
    
    
    @IBAction func backButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "segueRocketToScoring", sender: nil)
    }
    @IBAction func clearDataPressed(_ sender: Any) {
        if selectedRocket == 1{
            rocket1Cargo = Array(repeating: 0, count: 3)
            rocket1Hatches = Array(repeating: 0, count: 6)
            autoHatch = 0
            autoCargo = 0
            teleOpHatch = 0
            teleOpCargo = 0
            updateImages()
        }
        else if selectedRocket == 2{
            rocket2Cargo = Array(repeating: 0, count: 3)
            rocket2Hatches = Array(repeating: 0, count: 6)
            autoHatch = 0
            autoCargo = 0
            teleOpHatch = 0
            teleOpCargo = 0
            updateImages()
        }
        
        
    }
    
   // override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
  //      popupHide()
  //      print("autoCargo: \(autoCargo!); teleOpCargo: \(teleOpCargo!)")
   // }
    
    func updateImages(){
        cargoButton1.setTitle("", for: .normal)
        cargoButton2.setTitle("", for: .normal)
        cargoButton3.setTitle("", for: .normal)
        
        popupHide()
        cargoButton1.setBackgroundImage(UIImage(named: blankImage), for: .normal)
        cargoButton2.setBackgroundImage(UIImage(named: blankImage), for: .normal)
        cargoButton3.setBackgroundImage(UIImage(named: blankImage), for: .normal)
        
        hatchButton1.setBackgroundImage(UIImage(named: blankImage), for: .normal)
        hatchButton2.setBackgroundImage(UIImage(named: blankImage), for: .normal)
        hatchButton3.setBackgroundImage(UIImage(named: blankImage), for: .normal)
        hatchButton4.setBackgroundImage(UIImage(named: blankImage), for: .normal)
        hatchButton5.setBackgroundImage(UIImage(named: blankImage), for: .normal)
        hatchButton6.setBackgroundImage(UIImage(named: blankImage), for: .normal)
        
        // rocket1Cargo[1] = -1
        // rocket1Cargo[0] = 1
        
        if selectedRocket == 1{
            if rocket1Cargo[0] == 2{
                cargoButton1.setBackgroundImage(UIImage(named: cargoImage), for: .normal)
                cargoButton1.setTitle("x2", for: .normal)
            }
            else if rocket1Cargo[0] == 1{
                cargoButton1.setBackgroundImage(UIImage(named: cargoImage), for: .normal)
            }
            else if rocket1Cargo[0] == -1{
                cargoButton1.setBackgroundImage(UIImage(named: cargoImage), for: .normal)
                cargoButton1.setTitle("x2", for: .normal)
            }
            else if rocket1Cargo[0] == -4{
                cargoButton1.setBackgroundImage(UIImage(named: cargoImage), for: .normal)
                cargoButton1.setTitle("x2", for: .normal)
            }
            else if rocket1Cargo[0] == -2{
                cargoButton1.setBackgroundImage(UIImage(named: cargoImage), for: .normal)
            }
            
            
            
            if rocket1Cargo[1] == 2{
                cargoButton2.setBackgroundImage(UIImage(named: cargoImage), for: .normal)
                cargoButton2.setTitle("x2", for: .normal)
            }
            else if rocket1Cargo[1] == 1{
                cargoButton2.setBackgroundImage(UIImage(named: cargoImage), for: .normal)
            }
            else if rocket1Cargo[1] == -1{
                cargoButton2.setBackgroundImage(UIImage(named: cargoImage), for: .normal)
                cargoButton2.setTitle("x2", for: .normal)
            }
            else if rocket1Cargo[1] == -4{
                cargoButton2.setBackgroundImage(UIImage(named: cargoImage), for: .normal)
                cargoButton2.setTitle("x2", for: .normal)
            }
            else if rocket1Cargo[1] == -2{
                cargoButton2.setBackgroundImage(UIImage(named: cargoImage), for: .normal)
            }
            
            
           // print(rocket1Cargo[2])
            if rocket1Cargo[2] == 2{
                cargoButton3.setBackgroundImage(UIImage(named: cargoImage), for: .normal)
                cargoButton3.setTitle("x2", for: .normal)
            }
            else if rocket1Cargo[2] == 1{
                cargoButton3.setBackgroundImage(UIImage(named: cargoImage), for: .normal)
            }
            else if rocket1Cargo[2] == -1{
                cargoButton3.setBackgroundImage(UIImage(named: cargoImage), for: .normal)
                cargoButton3.setTitle("x2", for: .normal)
            }
            else if rocket1Cargo[2] == -4{
                cargoButton3.setBackgroundImage(UIImage(named: cargoImage), for: .normal)
                cargoButton3.setTitle("x2", for: .normal)
                //print("should update")
            }
            else if rocket1Cargo[2] == -2{
                cargoButton3.setBackgroundImage(UIImage(named: cargoImage), for: .normal)
            }
            
            if rocket1Hatches[0] == 1 || rocket1Hatches[0] == 2{
                hatchButton1.setBackgroundImage(UIImage(named: hatchImage), for: .normal)
            }
            if rocket1Hatches[1] == 1 || rocket1Hatches[1] == 2{
                hatchButton2.setBackgroundImage(UIImage(named: hatchImage), for: .normal)
            }
            if rocket1Hatches[2] == 1 || rocket1Hatches[2] == 2{
                hatchButton3.setBackgroundImage(UIImage(named: hatchImage), for: .normal)
            }
            if rocket1Hatches[3] == 1 || rocket1Hatches[3] == 2{
                hatchButton4.setBackgroundImage(UIImage(named: hatchImage), for: .normal)
            }
            if rocket1Hatches[4] == 1 || rocket1Hatches[4] == 2{
                hatchButton5.setBackgroundImage(UIImage(named: hatchImage), for: .normal)
            }
            if rocket1Hatches[5] == 1 || rocket1Hatches[5] == 2{
                hatchButton6.setBackgroundImage(UIImage(named: hatchImage), for: .normal)
            }
        }
            
        else if selectedRocket == 2{
            if rocket2Cargo[0] == 2{
                cargoButton1.setBackgroundImage(UIImage(named: cargoImage), for: .normal)
                cargoButton1.setTitle("x2", for: .normal)
            }
            else if rocket2Cargo[0] == 1{
                cargoButton1.setBackgroundImage(UIImage(named: cargoImage), for: .normal)
            }
            else if rocket2Cargo[0] == -1{
                cargoButton1.setBackgroundImage(UIImage(named: cargoImage), for: .normal)
                cargoButton1.setTitle("x2", for: .normal)
            }
            else if rocket2Cargo[0] == -4{
                cargoButton1.setBackgroundImage(UIImage(named: cargoImage), for: .normal)
                cargoButton1.setTitle("x2", for: .normal)
            }
            else if rocket2Cargo[0] == -2{
                cargoButton1.setBackgroundImage(UIImage(named: cargoImage), for: .normal)
            }
            
            
            
            if rocket2Cargo[1] == 2{
                cargoButton2.setBackgroundImage(UIImage(named: cargoImage), for: .normal)
                cargoButton2.setTitle("x2", for: .normal)
            }
            else if rocket2Cargo[1] == 1{
                cargoButton2.setBackgroundImage(UIImage(named: cargoImage), for: .normal)
            }
            else if rocket2Cargo[1] == -1{
                cargoButton2.setBackgroundImage(UIImage(named: cargoImage), for: .normal)
                cargoButton2.setTitle("x2", for: .normal)
            }
            else if rocket2Cargo[1] == -4{
                cargoButton2.setBackgroundImage(UIImage(named: cargoImage), for: .normal)
                cargoButton2.setTitle("x2", for: .normal)
            }
            else if rocket2Cargo[1] == -2{
                cargoButton2.setBackgroundImage(UIImage(named: cargoImage), for: .normal)
            }
            
            
            
            if rocket2Cargo[2] == 2{
                cargoButton3.setBackgroundImage(UIImage(named: cargoImage), for: .normal)
                cargoButton3.setTitle("x2", for: .normal)
            }
            else if rocket2Cargo[2] == 1{
                cargoButton3.setBackgroundImage(UIImage(named: cargoImage), for: .normal)
            }
            else if rocket2Cargo[2] == -1{
                cargoButton3.setBackgroundImage(UIImage(named: cargoImage), for: .normal)
                cargoButton3.setTitle("x2", for: .normal)
            }
            else if rocket2Cargo[2] == -4{
                cargoButton3.setBackgroundImage(UIImage(named: cargoImage), for: .normal)
                cargoButton3.setTitle("x2", for: .normal)
            }
            else if rocket2Cargo[2] == -2{
                cargoButton3.setBackgroundImage(UIImage(named: cargoImage), for: .normal)
            }
            
            if rocket2Hatches[0] == 1 || rocket2Hatches[0] == 2{
                hatchButton1.setBackgroundImage(UIImage(named: hatchImage), for: .normal)
            }
            if rocket2Hatches[1] == 1 || rocket2Hatches[1] == 2{
                hatchButton2.setBackgroundImage(UIImage(named: hatchImage), for: .normal)
            }
            if rocket2Hatches[2] == 1 || rocket2Hatches[2] == 2{
                hatchButton3.setBackgroundImage(UIImage(named: hatchImage), for: .normal)
            }
            if rocket2Hatches[3] == 1 || rocket2Hatches[3] == 2{
                hatchButton4.setBackgroundImage(UIImage(named: hatchImage), for: .normal)
            }
            if rocket2Hatches[4] == 1 || rocket2Hatches[4] == 2{
                hatchButton5.setBackgroundImage(UIImage(named: hatchImage), for: .normal)
            }
            if rocket2Hatches[5] == 1 || rocket2Hatches[5] == 2{
                hatchButton6.setBackgroundImage(UIImage(named: hatchImage), for: .normal)
            }
        }
    }
    
    func popupHide(){
        
        popupView.isHidden = true
        popupTitleLabel.isHidden = true
        popupAutoLabel.isHidden = true
        popupTeleOpLabel.isHidden = true
        autoAddButton.isHidden = true
        autoMinusButton.isHidden = true
        teleopAddButton.isHidden = true
        teleopMinusButton.isHidden = true
        enterDataButton.isHidden = true
        
    }
    
    func popupDisplayed(index: Int){
        popupView.isHidden = false
        popupTitleLabel.isHidden = false
        popupAutoLabel.isHidden = false
        popupTeleOpLabel.isHidden = false
        autoAddButton.isHidden = false
        autoMinusButton.isHidden = false
        teleopAddButton.isHidden = false
        teleopMinusButton.isHidden = false
        enterDataButton.isHidden = false
        
        switch index{
        case 0:
            popupTitleLabel.text = "Top Cargo"
            rocketCargoPopUp(index2: index)
        case 1:
            popupTitleLabel.text = "Middle Cargo"
            rocketCargoPopUp(index2: index)
        case 2:
            popupTitleLabel.text = "Bottom Cargo"
            rocketCargoPopUp(index2: index)
        case 3:
            popupTitleLabel.text = "Top Left Hatch"
            rocketHatchPopUp(index3: 0)
        case 4:
            popupTitleLabel.text = "Top Right Hatch"
            rocketHatchPopUp(index3: 1)
        case 5:
            popupTitleLabel.text = "Middle Left Hatch"
            rocketHatchPopUp(index3: 2)
        case 6:
            popupTitleLabel.text = "Middle Right Hatch"
            rocketHatchPopUp(index3: 3)
        case 7:
            popupTitleLabel.text = "Bottom Left Hatch"
            rocketHatchPopUp(index3: 4)
        case 8:
            popupTitleLabel.text = "Bottom Right Hatch"
            rocketHatchPopUp(index3: 5)
        default:
            break
        }
    }
    
    func rocketHatchPopUp(index3: Int){
        if selectedRocket == 1{
            switch rocket1Hatches[index3]{
            case 0:
                popupAutoLabel.text = "Auto: 0"
                popupTeleOpLabel.text = "Tele-Op: 0"
                autoHatch = 0
                teleOpHatch = 0
                
            case 1:
                popupAutoLabel.text = "Auto: 0"
                popupTeleOpLabel.text = "Tele-Op: 1"
                autoHatch = 0
                teleOpHatch = 1
            case 2:
                popupAutoLabel.text = "Auto: 1"
                popupTeleOpLabel.text = "Tele-Op: 0"
                autoHatch = 1
                teleOpHatch = 0
            
            default:
                break
            }
        }
        else if selectedRocket == 2{
            switch rocket2Hatches[index3]{
            case 0:
                popupAutoLabel.text = "Auto: 0"
                popupTeleOpLabel.text = "Tele-Op: 0"
                autoHatch = 0
                teleOpHatch = 0
                
            case 1:
                popupAutoLabel.text = "Auto: 0"
                popupTeleOpLabel.text = "Tele-Op: 1"
                autoHatch = 0
                teleOpHatch = 1
            case 2:
                popupAutoLabel.text = "Auto: 1"
                popupTeleOpLabel.text = "Tele-Op: 0"
                autoHatch = 1
                teleOpHatch = 0
                
            default:
                break
            }
        }
    
    }
    func rocketCargoPopUp(index2: Int){
        if selectedRocket == 1{
            switch rocket1Cargo[index2]{
            case 0:
                popupAutoLabel.text = "Auto: 0"
                popupTeleOpLabel.text = "Tele-Op: 0"
                autoCargo = 0
                teleOpCargo = 0
                
            case 1:
                popupAutoLabel.text = "Auto: 0"
                popupTeleOpLabel.text = "Tele-Op: 1"
                autoCargo = 0
                teleOpCargo = 1
            case 2:
                popupAutoLabel.text = "Auto: 0"
                popupTeleOpLabel.text = "Tele-Op: 2"
                autoCargo = 0
                teleOpCargo = 2
            case -1:
                popupAutoLabel.text = "Auto: 1"
                popupTeleOpLabel.text = "Tele-Op: 1"
                autoCargo = 1
                teleOpCargo = 1
            case -2:
                popupAutoLabel.text = "Auto: 1"
                popupTeleOpLabel.text = "Tele-Op: 0"
                autoCargo = 1
                teleOpCargo = 0
            case -4:
                popupAutoLabel.text = "Auto: 2"
                popupTeleOpLabel.text = "Tele-Op: 0"
                autoCargo = 2
                teleOpCargo = 0
            default:
                break
            }
        }
        else{
            switch rocket2Cargo[index2]{
            case 0:
                popupAutoLabel.text = "Auto: 0"
                popupTeleOpLabel.text = "Tele-Op: 0"
                autoCargo = 0
                teleOpCargo = 0
            case 1:
                popupAutoLabel.text = "Auto: 0"
                popupTeleOpLabel.text = "Tele-Op: 1"
                autoCargo = 0
                teleOpCargo = 1
            case 2:
                popupAutoLabel.text = "Auto: 0"
                popupTeleOpLabel.text = "Tele-Op: 2"
                autoCargo = 0
                teleOpCargo = 2
            case -1:
                popupAutoLabel.text = "Auto: 1"
                popupTeleOpLabel.text = "Tele-Op: 1"
                autoCargo = 1
                teleOpCargo = 1
            case -2:
                popupAutoLabel.text = "Auto: 1"
                popupTeleOpLabel.text = "Tele-Op: 0"
                autoCargo = 1
                teleOpCargo = 0
            case -4:
                popupAutoLabel.text = "Auto: 2"
                popupTeleOpLabel.text = "Tele-Op: 0"
                autoCargo = 2
                teleOpCargo = 0
            default:
                break
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        autoCargo = 0;
        autoHatch = 0;
        teleOpCargo = 0;
        teleOpHatch = 0;
        updateImages()
        
       // let vc = RocketScoringViewController(nibName: "PopOverViewController", bundle: nil)
       // vc.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext

        
       // tabBarController?.present(vc, animated: true)
//let popOverVC = UIStoryboard(name: "Test", bundle: nil).instantiateViewController(withIdentifier: "PhotoPopUp") as! RocketScoringViewController
     //   popOverVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        
      //  tabBarController?.present(popOverVC, animated: true)
 
   
        
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
