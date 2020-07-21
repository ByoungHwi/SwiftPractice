//
//  ViewController.swift
//  Tab
//
//  Created by Byoung-Hwi Yoon on 2020/07/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnMoveImageView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    @IBAction func btnMoveDateView(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
    
}

