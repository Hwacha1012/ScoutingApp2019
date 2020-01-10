//
//  DropboxViewController.swift
//  ScoutingApp2170_2019
//
//  Created by Leonard Liu on 2/19/19.
//  Copyright © 2019 Leonard Liu. All rights reserved.
//

import UIKit
import Foundation
import SwiftyDropbox

class DropboxViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       DropboxClientsManager.setupWithAppKey("y3e3pp93crx8oii")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    //DropboxClientsManager.setupWithAppKey("c1niittg2v3usuo")
        
        DropboxClientsManager.authorizeFromController(UIApplication.shared,
                                                      controller: self,
                                                      openURL: { (url: URL) -> Void in
                                                        UIApplication.shared.openURL(url)
        })
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
