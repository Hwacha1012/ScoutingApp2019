//
//  ServerSplitViewController.swift
//  ScoutingApp2170_2019
//
//  Created by Leonard Liu on 2/19/19.
//  Copyright © 2019 Leonard Liu. All rights reserved.
//

import UIKit
import Foundation

class ServerSplitViewController: UIViewController {

    @IBOutlet weak var dropboxButton: UIButton!
    @IBOutlet weak var firebaseButton: UIButton!
    @IBAction func dropboxButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "segueToDropbox", sender: nil)
    }
    @IBAction func firebaseButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "segueToFirebase", sender: nil)
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "segueBackToMainMenu", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
