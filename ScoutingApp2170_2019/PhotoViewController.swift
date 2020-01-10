//
//  PhotoViewController.swift
//  ScoutingApp2170_2019
//
//  Created by Leonard Liu on 2/8/19.
//  Copyright © 2019 Leonard Liu. All rights reserved.
//

import UIKit
import Foundation

class PhotoViewController: UIViewController {

    @IBAction func backButtonPressed(_ sender: Any) {
        if photoEnterLocation == 1{
            performSegue(withIdentifier: "segueAfterPhotoView1", sender: nil)
        }
        else{
            performSegue(withIdentifier: "segueAfterPhotoView2", sender: nil)
        }
    }
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if UserDefaults.standard.array(forKey: "photoList") != nil{
            photoList = UserDefaults.standard.array(forKey: "photoList") as! [String]
            
        }
        
        let data = UserDefaults.standard.object(forKey: "\(teamNum); \(photoNumberFromButton)") as! NSData
        print("here!")
        let image2 = UIImage(data: data as Data)
        imageView.image = image2
        
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
