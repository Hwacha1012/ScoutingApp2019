//
//  CargoShipScoringViewController.swift
//  ScoutingApp2170_2019
//
//  Created by Leonard Liu on 1/26/19.
//  Copyright © 2019 Leonard Liu. All rights reserved.
//

import UIKit

class CargoShipScoringViewController: UIViewController {
    @IBOutlet weak var cargoButton1: UIButton!
    @IBOutlet weak var cargoButton2: UIButton!
    @IBOutlet weak var cargoButton3: UIButton!
    @IBOutlet weak var cargoButton4: UIButton!
    @IBOutlet weak var cargoButton5: UIButton!
    @IBOutlet weak var cargoButton6: UIButton!
    @IBOutlet weak var cargoButton7: UIButton!
    @IBOutlet weak var cargoButton8: UIButton!
    
    @IBOutlet weak var hatchButton1: UIButton!
    @IBOutlet weak var hatchButton2: UIButton!
    @IBOutlet weak var hatchButton3: UIButton!
    @IBOutlet weak var hatchButton4: UIButton!
    @IBOutlet weak var hatchButton5: UIButton!
    @IBOutlet weak var hatchButton6: UIButton!
    @IBOutlet weak var hatchButton7: UIButton!
    @IBOutlet weak var hatchButton8: UIButton!
    
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var popupTitleLabel: UILabel!
    @IBOutlet weak var popupAutoLabel: UILabel!
    @IBOutlet weak var popupTeleOpLabel: UILabel!
    @IBOutlet weak var autoPlusButton: UIButton!
    @IBOutlet weak var autoMinusButton: UIButton!
    @IBOutlet weak var teleOpPlusButton: UIButton!
    @IBOutlet weak var teleOpMinusButton: UIButton!
    @IBOutlet weak var enterDataButton: UIButton!
    
    
    
    @IBOutlet weak var clearCargoButton: UIButton!
    
    @IBAction func cargoButton1Pressed(_ sender: Any) {
        popupDisplayed(index: 0)
    }
    @IBAction func cargoButton2Pressed(_ sender: Any) {
        popupDisplayed(index: 1)
    }
    @IBAction func cargoButton3Pressed(_ sender: Any) {
        popupDisplayed(index: 2)
    }
    @IBAction func cargoButton4Pressed(_ sender: Any) {
        popupDisplayed(index: 3)
    }
    @IBAction func cargoButton5Pressed(_ sender: Any) {
        popupDisplayed(index: 4)
    }
    @IBAction func cargoButton6Pressed(_ sender: Any) {
        popupDisplayed(index: 5)
    }
    @IBAction func cargoButton7Pressed(_ sender: Any) {
        popupDisplayed(index: 6)
    }
    @IBAction func cargoButton8Pressed(_ sender: Any) {
        popupDisplayed(index: 7)
    }
    
    @IBAction func hatchButton1Pressed(_ sender: Any) {
        popupDisplayed(index: 8)
    }
    @IBAction func hatchButton2Pressed(_ sender: Any) {
        popupDisplayed(index: 9)
    }
    @IBAction func hatchButton3Pressed(_ sender: Any) {
        popupDisplayed(index: 10)
    }
    @IBAction func hatchButton4Pressed(_ sender: Any) {
        popupDisplayed(index: 11)
    }
    @IBAction func hatchButton5Pressed(_ sender: Any) {
        popupDisplayed(index: 12)
    }
    @IBAction func hatchButton6Pressed(_ sender: Any) {
        popupDisplayed(index: 13)
    }
    @IBAction func hatchButton7Pressed(_ sender: Any) {
        popupDisplayed(index: 14)
    }
    @IBAction func hatchButton8Pressed(_ sender: Any) {
        popupDisplayed(index: 15)
    }
    @IBAction func clearCargoButtonPressed(_ sender: Any) {
        cargoShipHatches = Array(repeating: 0, count: 8)
        cargoShipCargo = Array(repeating: 0, count: 8)
        autoHatch = 0
        autoCargo = 0
        teleOpHatch = 0
        teleOpCargo = 0
        updateImages()
        
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "segueCargoToScoring", sender: nil)
    }
    @IBAction func autoPlusButtonPressed(_ sender: Any) {
        if selectedSection < 8{
            if autoCargo + teleOpCargo < 1{
                autoCargo += 1
                cargoShipCargo[selectedSection] -= 1
                popupAutoLabel.text = "Auto: \(autoCargo!)"
            }
        }
        else{
            if autoHatch + teleOpHatch < 1{
                autoHatch += 1
                cargoShipHatches[selectedSection - 8] -= 1
                popupAutoLabel.text = "Auto: \(autoHatch!)"
            }
        }
        
    }
    @IBAction func autoMinusButtonPressed(_ sender: Any) {
        if selectedSection < 8{
            if autoCargo > 0{
                autoCargo -= 1
                cargoShipCargo[selectedSection] += 1
                popupAutoLabel.text = "Auto: \(autoCargo!)"
            }
        }
        else{
            if autoHatch > 0{
                autoHatch -= 1
                cargoShipHatches[selectedSection - 8] += 1
                popupAutoLabel.text = "Auto: \(autoHatch!)"
            }
        }
        
    }
    @IBAction func teleOpPlusButtonPressed(_ sender: Any) {
        if selectedSection < 8{
            if autoCargo + teleOpCargo < 1{
                teleOpCargo += 1
                cargoShipCargo[selectedSection] += 1
                popupTeleOpLabel.text = "Tele-Op: \(teleOpCargo!)"
            }
        }
        else{
            if autoHatch + teleOpHatch < 1{
                teleOpHatch += 1
                cargoShipHatches[selectedSection - 8] += 1
                popupTeleOpLabel.text = "Tele-Op: \(teleOpHatch!)"
            }
        }
        
    }
    @IBAction func teleOpMinusButtonPressed(_ sender: Any) {
        if selectedSection < 8{
            if teleOpCargo > 0{
                teleOpCargo -= 1
                cargoShipCargo[selectedSection] -= 1
                popupTeleOpLabel.text = "Tele-Op: \(teleOpCargo!)"
            }
        }
        else{
            if teleOpHatch > 0{
                teleOpHatch -= 1
                cargoShipHatches[selectedSection - 8] -= 1
                popupTeleOpLabel.text = "Tele-Op: \(teleOpHatch!)"
            }
        }
        
    }
    @IBAction func enterDataButtonPressed(_ sender: Any) {
        if selectedSection < 8{
            cargoShipCargo[selectedSection] = teleOpCargo - autoCargo
        }
        else{
            cargoShipHatches[selectedSection-8] = teleOpHatch - autoHatch
        }
        updateImages()
        
    }
    
    func cargoPopUp(index2: Int){
        
        switch cargoShipCargo[index2]{
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
        case -1:
            popupAutoLabel.text = "Auto: 1"
            popupTeleOpLabel.text = "Tele-Op: 0"
            autoCargo = 1
            teleOpCargo = 0
        default:
            break
        }
    }

    func hatchPopUp(index3: Int){
        
        switch cargoShipHatches[index3]{
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
        case -1:
            popupAutoLabel.text = "Auto: 1"
            popupTeleOpLabel.text = "Tele-Op: 0"
            autoHatch = 1
            teleOpHatch = 0
        default:
            break
        }
    }
    
    
    func popupDisplayed(index: Int){
        popupView.isHidden = false
        popupTitleLabel.isHidden = false
        popupAutoLabel.isHidden = false
        popupTeleOpLabel.isHidden = false
        autoPlusButton.isHidden = false
        autoMinusButton.isHidden = false
        teleOpPlusButton.isHidden = false
        teleOpMinusButton.isHidden = false
        enterDataButton.isHidden = false
        
        selectedSection = index
        
        switch index{
        case 0:
            popupTitleLabel.text = "Top Left Cargo"
            cargoPopUp(index2: index)
        case 1:
            popupTitleLabel.text = "Top Right Cargo"
            cargoPopUp(index2: index)
        case 2:
            popupTitleLabel.text = "Middle Top Left Cargo"
            cargoPopUp(index2: index)
        case 3:
            popupTitleLabel.text = "Middle Top Right Cargo"
            cargoPopUp(index2: index)
        case 4:
            popupTitleLabel.text = "Middle Bottom Left Cargo"
            cargoPopUp(index2: index)
        case 5:
            popupTitleLabel.text = "Middle Bottom Right Cargo"
            cargoPopUp(index2: index)
        case 6:
            popupTitleLabel.text = "Bottom Left Cargo"
            cargoPopUp(index2: index)
        case 7:
            popupTitleLabel.text = "Bottom Right Cargo"
            cargoPopUp(index2: index)
        case 8:
            popupTitleLabel.text = "Top Left Hatch"
            hatchPopUp(index3: index - 8)
        case 9:
            popupTitleLabel.text = "Top Right Hatch"
            hatchPopUp(index3: index - 8)
        case 10:
            popupTitleLabel.text = "Middle Top Left Hatch"
            hatchPopUp(index3: index - 8)
        case 11:
            popupTitleLabel.text = "Middle Top Right Hatch"
            hatchPopUp(index3: index - 8)
        case 12:
            popupTitleLabel.text = "Middle Bottom Left Hatch"
            hatchPopUp(index3: index - 8)
        case 13:
            popupTitleLabel.text = "Middle Bottom Right Hatch"
            hatchPopUp(index3: index - 8)
        case 14:
            popupTitleLabel.text = "Bottom Left Hatch"
            hatchPopUp(index3: index - 8)
        case 15:
            popupTitleLabel.text = "Bottom Right Hatch"
            hatchPopUp(index3: index - 8)
        default:
            break
        }
    }
    

    
    
    func updateImages(){
       // cargoButton1.setTitle("", for: .normal)
       // cargoButton2.setTitle("", for: .normal)
        //cargoButton3.setTitle("", for: .normal)
        
        popupHide()
        cargoButton1.setBackgroundImage(UIImage(named: blankImage), for: .normal)
        cargoButton2.setBackgroundImage(UIImage(named: blankImage), for: .normal)
        cargoButton3.setBackgroundImage(UIImage(named: blankImage), for: .normal)
        cargoButton4.setBackgroundImage(UIImage(named: blankImage), for: .normal)
        cargoButton5.setBackgroundImage(UIImage(named: blankImage), for: .normal)
        cargoButton6.setBackgroundImage(UIImage(named: blankImage), for: .normal)
        cargoButton7.setBackgroundImage(UIImage(named: blankImage), for: .normal)
        cargoButton8.setBackgroundImage(UIImage(named: blankImage), for: .normal)
        
        
        hatchButton1.setBackgroundImage(UIImage(named: blankImage), for: .normal)
        hatchButton2.setBackgroundImage(UIImage(named: blankImage), for: .normal)
        hatchButton3.setBackgroundImage(UIImage(named: blankImage), for: .normal)
        hatchButton4.setBackgroundImage(UIImage(named: blankImage), for: .normal)
        hatchButton5.setBackgroundImage(UIImage(named: blankImage), for: .normal)
        hatchButton6.setBackgroundImage(UIImage(named: blankImage), for: .normal)
        hatchButton7.setBackgroundImage(UIImage(named: blankImage), for: .normal)
        hatchButton8.setBackgroundImage(UIImage(named: blankImage), for: .normal)
        
        if cargoShipCargo[0] == 1 || cargoShipCargo[0] == -1{
            cargoButton1.setBackgroundImage(UIImage(named: cargoImage), for: .normal)
                
        }
        if cargoShipCargo[1] == 1 || cargoShipCargo[1] == -1{
            cargoButton2.setBackgroundImage(UIImage(named: cargoImage), for: .normal)
            
        }
        if cargoShipCargo[2] == 1 || cargoShipCargo[2] == -1{
            cargoButton3.setBackgroundImage(UIImage(named: cargoImage), for: .normal)
            
        }

        if cargoShipCargo[3] == 1 || cargoShipCargo[3] == -1{
            cargoButton4.setBackgroundImage(UIImage(named: cargoImage), for: .normal)
            
        }
        
        if cargoShipCargo[4] == 1 || cargoShipCargo[4] == -1{
            cargoButton5.setBackgroundImage(UIImage(named: cargoImage), for: .normal)
            
        }

        if cargoShipCargo[5] == 1 || cargoShipCargo[5] == -1{
            cargoButton6.setBackgroundImage(UIImage(named: cargoImage), for: .normal)
            
        }
        if cargoShipCargo[6] == 1 || cargoShipCargo[6] == -1{
            cargoButton7.setBackgroundImage(UIImage(named: cargoImage), for: .normal)
            
        }
        if cargoShipCargo[7] == 1 || cargoShipCargo[7] == -1{
            cargoButton8.setBackgroundImage(UIImage(named: cargoImage), for: .normal)
            
        }
        
        
        if cargoShipHatches[0] == 1 || cargoShipHatches[0] == -1{
            hatchButton1.setBackgroundImage(UIImage(named: hatchImage), for: .normal)
        }
        if cargoShipHatches[1] == 1 || cargoShipHatches[1] == -1{
            hatchButton2.setBackgroundImage(UIImage(named: hatchImage), for: .normal)
        }
        if cargoShipHatches[2] == 1 || cargoShipHatches[2] == -1{
            hatchButton3.setBackgroundImage(UIImage(named: hatchImage), for: .normal)
        }
        if cargoShipHatches[3] == 1 || cargoShipHatches[3] == -1{
            hatchButton4.setBackgroundImage(UIImage(named: hatchImage), for: .normal)
        }
        if cargoShipHatches[4] == 1 || cargoShipHatches[4] == -1{
            hatchButton5.setBackgroundImage(UIImage(named: hatchImage), for: .normal)
        }
        if cargoShipHatches[5] == 1 || cargoShipHatches[5] == -1{
            hatchButton6.setBackgroundImage(UIImage(named: hatchImage), for: .normal)
        }
        if cargoShipHatches[6] == 1 || cargoShipHatches[6] == -1{
            hatchButton7.setBackgroundImage(UIImage(named: hatchImage), for: .normal)
        }
        if cargoShipHatches[7] == 1 || cargoShipHatches[7] == -1{
            hatchButton8.setBackgroundImage(UIImage(named: hatchImage), for: .normal)
        }
    }
    
    func popupHide(){
        
        popupView.isHidden = true
        popupTitleLabel.isHidden = true
        popupAutoLabel.isHidden = true
        popupTeleOpLabel.isHidden = true
        autoPlusButton.isHidden = true
        autoMinusButton.isHidden = true
        teleOpPlusButton.isHidden = true
        teleOpMinusButton.isHidden = true
        enterDataButton.isHidden = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        autoCargo = 0;
        autoHatch = 0;
        teleOpCargo = 0;
        teleOpHatch = 0;
        updateImages()
        
        
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
