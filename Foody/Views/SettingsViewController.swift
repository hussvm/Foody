//
//  SettingsViewController.swift
//  Foody
//
//  Created by HUSSAM on 6/16/23.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func changeStatusClicked(_ sender: Any) {
        if UserDefaults.standard.hasOnboarded {
            print("Status has Changed")
            UserDefaults.standard.hasOnboarded = false
        }
    }
}
