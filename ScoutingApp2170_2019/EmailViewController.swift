//
//  EmailViewController.swift
//  ScoutingApp2170_2019
//
//  Created by Leonard Liu on 2/2/19.
//  Copyright © 2019 Leonard Liu. All rights reserved.
//

import UIKit
import MessageUI
import Foundation

class EmailViewController: UIViewController, MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //print("pre segue")
        //performSegue(withIdentifier: "segueBackAfterEmail", sender: self)
        //print("post segue")
        sendEmail()
    }
    
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            //   mail.setToRecipients(["dakshar0927@gmail.com"])
            mail.setToRecipients(["leoqh6@gmail.com"])
            mail.setSubject("Spreadsheet of Data")
            mail.setMessageBody("<p>Nice Job!</p>", isHTML: true)
            
            // present(mail, animated: true)
            
            do {
                // Read the file contents
                readString = try String(contentsOf: url!)
                print(readString)
                let data1 = readString.data(using: .utf8)
                mail.addAttachmentData(data1!, mimeType: "csv", fileName: "MatchScoutingSpreadsheet")
                
                print("File Text: \(readString)   !")
                
                
                
                
                
            } catch {
                //print("Failed reading from URL: \(url!), Error: " + error.localizedDescription)
            }
            
            do {
                // Read the file contents
                readString = try String(contentsOf: url2!)
                print(readString)
                let data2 = readString.data(using: .utf8)
                mail.addAttachmentData(data2!, mimeType: "csv", fileName: "PitScoutingSpreadsheet")
                
                print("File Text: \(readString)   !")
                
                
                
                
                
            } catch {
                //print("Failed reading from URL: \(url!), Error: " + error.localizedDescription)
            }
            
            do {
                // Read the file contents
                readString = try String(contentsOf: url3!)
                print(readString)
                let data3 = readString.data(using: .utf8)
                mail.addAttachmentData(data3!, mimeType: "csv", fileName: "SuperScoutingSpreadsheet")
                
                print("File Text: \(readString)   !")
                
                
                
                
                
            } catch {
                //print("Failed reading from URL: \(url!), Error: " + error.localizedDescription)
            }
            
            DispatchQueue.main.async() {
                //call your performSegueWithIdentifier in here
                self.present(mail, animated: true)
            }
            
            
            
        } else {
            // show failure alert
        }
        
    }
    
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        
        /* DispatchQueue.main.async() {
         [unowned self] in
         self.performSegue(withIdentifier: "segueBackAfterEmail", sender: self)
         }
         */
        //DispatchQueue.main.async() {
        //call your performSegueWithIdentifier in here
        
        //  }
        //performSegue(withIdentifier: "segueBackAfterEmail", sender: nil)
       controller.dismiss(animated: true, completion: afterEmailAction)
        
    }
    
    func afterEmailAction() {
        print("before segue")
        // let when = DispatchTime.now() + 2 // change 2 to desired number of seconds
        /* DispatchQueue.main.asyncAfter(deadline: when) {
         // Your code with delay
         self.performSegue(withIdentifier: "segueBackAfterEmail", sender: nil)
         print("segue should have worked")
         }
         DispatchQueue.main.async() {
         [unowned self] in
         self.performSegue(withIdentifier: "segueBackAfterEmail", sender: self)
         print("just sent")
         }
         */
        performSegue(withIdentifier: "segueBackAfterEmail", sender: self)
        print("segue should have worked")
        //self.dismiss(animated: true)
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
