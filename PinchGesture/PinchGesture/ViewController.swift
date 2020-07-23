//
//  ViewController.swift
//  PinchGesture
//
//  Created by Byoung-Hwi Yoon on 2020/07/23.
//

import UIKit

class ViewController: UIViewController {

    var initialFontSize: CGFloat!
    
    @IBOutlet var imgPinch: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(doPinch(_:)))
        self.view.addGestureRecognizer(pinch)
    }
    
    @objc func doPinch(_ pinch: UIPinchGestureRecognizer){
        
        imgPinch.transform = imgPinch.transform.scaledBy(x: pinch.scale, y: pinch.scale)
        pinch.scale = 1
        
        if pinch.state == UIPinchGestureRecognizer.State.ended {
            imgPinch.transform = CGAffineTransform.identity
        }
        
    }


}

