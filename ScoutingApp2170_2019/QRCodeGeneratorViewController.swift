//
//  QRCodeGeneratorViewController.swift
//  ScoutingApp2170_2019
//
//  Created by Leonard Liu on 2/2/19.
//  Copyright © 2019 Leonard Liu. All rights reserved.
//

import UIKit

class QRCodeGeneratorViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
        
        imageView.image = image
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
