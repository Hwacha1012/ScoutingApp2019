//
//  QRSplitViewController.swift
//  ScoutingApp2170_2019
//
//  Created by Leonard Liu on 2/2/19.
//  Copyright © 2019 Leonard Liu. All rights reserved.
//

import UIKit

class QRSplitViewController: UIViewController {
    
    func displayPopup(){
        popupView.isHidden = false
        popupLabel.isHidden = false
        popupButton.isHidden = false
    }
    
    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        
        return nil
    }
    
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var popupLabel: UILabel!
    @IBOutlet weak var popupButton: UIButton!
    @IBAction func popupButtonPressed(_ sender: Any) {
        popupView.isHidden = true
        popupLabel.isHidden = true
        popupButton.isHidden = true
    }
    @IBOutlet weak var generateButton: UIButton!
    
    @IBOutlet weak var readerButton: UIButton!
    
    @IBAction func generateButtonPressed(_ sender: Any) {
        if UserDefaults.standard.array(forKey: "teamList")?.isEmpty == true && UserDefaults.standard.array(forKey: "pitScoutList")?.isEmpty == true && UserDefaults.standard.array(forKey: "superScoutList")?.isEmpty == true{
            //display label about not having list
            displayPopup()
            
            
        }
            
        else{
            
            qrCodeString = ""
            
            
            
            //if UserDefaults.standard.array(forKey: "teamList") != nil
            if UserDefaults.standard.array(forKey: "teamList")?.isEmpty == false{
                teamList = UserDefaults.standard.object(forKey: "teamList") as! [String]
                //print("\(teamList) and \(teamList.count)")
                
                for index in 0...(teamList.count - 1){
                    if UserDefaults.standard.object(forKey: "\(teamList[index])") != nil{
                        let addString = UserDefaults.standard.object(forKey: "\(teamList[index])")
                        
                        if qrCodeString == ""{
                            qrCodeString = " || \(addString!)"
                        }
                        else{
                            qrCodeString = "\(qrCodeString) || \(addString!)"
                            
                        }
                        
                    }
                }
                qrCodeString = "\(qrCodeString) || "
            }

            
            if UserDefaults.standard.array(forKey: "pitScoutList")?.isEmpty == false{
                pitScoutList = UserDefaults.standard.object(forKey: "pitScoutList") as! [String]
             //   print("\(pitScoutList) and \(pitScoutList.count)")
                
                for index in 0...(pitScoutList.count - 1){
                    if UserDefaults.standard.object(forKey: "\(pitScoutList[index])") != nil{
                        let addString2 = UserDefaults.standard.object(forKey: "\(pitScoutList[index])")
                        
                        if qrCodeString == ""{
                            qrCodeString = " // \(addString2!)"
                        }
                        else{
                            qrCodeString = "\(qrCodeString) // \(addString2!)"
                            
                        }
                        
                    }
                }
                
                qrCodeString = "\(qrCodeString) // "
            }
            
            
            if UserDefaults.standard.array(forKey: "superScoutList")?.isEmpty == false{
                superScoutList = UserDefaults.standard.object(forKey: "superScoutList") as! [String]
               // print("\(superScoutList) and \(superScoutList.count)")
                
                for index in 0...(superScoutList.count - 1){
                    if UserDefaults.standard.object(forKey: "\(superScoutList[index])") != nil{
                        let addString2 = UserDefaults.standard.object(forKey: "\(superScoutList[index])")
                        
                        if qrCodeString == ""{
                            qrCodeString = " '' \(addString2!)"
                        }
                        else{
                            qrCodeString = "\(qrCodeString) '' \(addString2!)"
                        }
                        
                    }
                }
                qrCodeString = "\(qrCodeString) '' "
            }
            
            image = generateQRCode(from: qrCodeString)
            
            performSegue(withIdentifier: "segueToQRCodeGenerator", sender: nil)
        }
    }
    @IBAction func readerButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "segueToQRReader", sender: nil)
        
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "segueBackToMain", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if runType == 1{
            generateButton.titleLabel!.font = UIFont.init(name: "Optima-BoldItalic", size: 65)
            readerButton.titleLabel!.font = UIFont.init(name: "Optima-BoldItalic", size: 65)
            popupButton.titleLabel!.font = UIFont.init(name: "Optima-BoldItalic", size: 65)
            popupLabel.font = UIFont.init(name: "Optima-BoldItalic", size: 40)
        }
        else{
            generateButton.titleLabel!.font = UIFont.init(name: "Optima-BoldItalic", size: 40)
            readerButton.titleLabel!.font = UIFont.init(name: "Optima-BoldItalic", size: 40)
            popupButton.titleLabel!.font = UIFont.init(name: "Optima-BoldItalic", size: 40)
            popupLabel.font = UIFont.init(name: "Optima-BoldItalic", size: 25)
        }
        generateButton.titleLabel!.minimumScaleFactor = 0.01
        generateButton.titleLabel!.numberOfLines = 2
        generateButton.titleLabel!.adjustsFontSizeToFitWidth = true
        generateButton.titleLabel!.textAlignment = NSTextAlignment.center
        
        generateButton.setTitleColor(UIColor.init(red: 0.0431372549, green: 0.1294117647, blue: 0.50196078431, alpha: 1.0), for: .normal)
        
        readerButton.titleLabel!.minimumScaleFactor = 0.01
        readerButton.titleLabel!.numberOfLines = 2
        readerButton.titleLabel!.adjustsFontSizeToFitWidth = true
        readerButton.titleLabel!.textAlignment = NSTextAlignment.center
        
        readerButton.setTitleColor(UIColor.init(red: 0.0431372549, green: 0.1294117647, blue: 0.50196078431, alpha: 1.0), for: .normal)
        
        popupButton.titleLabel!.minimumScaleFactor = 0.01
        popupButton.titleLabel!.numberOfLines = 2
        popupButton.titleLabel!.adjustsFontSizeToFitWidth = true
        popupButton.titleLabel!.textAlignment = NSTextAlignment.center
        
        readerButton.setTitleColor(UIColor.init(red: 0.0431372549, green: 0.1294117647, blue: 0.50196078431, alpha: 1.0), for: .normal)
        
        popupView.isHidden = true
        popupLabel.isHidden = true
        popupButton.isHidden = true
        
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
