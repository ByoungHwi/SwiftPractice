//
//  ViewController.swift
//  Chap3Practice
//
//  Created by Byoung-Hwi Yoon on 2020/07/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imgView: UIImageView!
    
    var imgNum : Int = 0
    var imgList  = [UIImage(named: "1.png"),UIImage(named: "2.png"),UIImage(named: "3.png")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgView.image = imgList[0]
    }

    @IBAction func btnPre(_ sender: UIButton) {
        imgNum += 1
        
        if(imgNum > 2){
            imgNum = 0
        }
        
        imgView.image = imgList[imgNum]
        
    }
    
    @IBAction func btnNext(_ sender: UIButton) {
        imgNum -= 1
        
        if(imgNum<0){
            imgNum = 2
        }
        
        imgView.image = imgList[imgNum]
    }
   
}

