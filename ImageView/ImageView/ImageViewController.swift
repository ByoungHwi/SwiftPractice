//
//  ViewController.swift
//  ImageView
//
//  Created by Byoung-Hwi Yoon on 2020/07/20.
//

import UIKit

class ImageViewController: UIViewController {
    
    var isZoom = false
    var imgOn: UIImage?
    var imgOff: UIImage?
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var btnResize: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named: "lamp_off.png")
        
        imgView.image = imgOn
    }
    
    
    @IBAction func btnResizeImage(_ sender: UIButton) {
        let scale : CGFloat = 2.0
        var newWidth : CGFloat
        var newHeight : CGFloat
        
        if(isZoom){
            newWidth = imgView.frame.width/scale
            newHeight = imgView.frame.height/scale
            btnResize.setTitle("Size Up", for: .normal)
        }else{
            newWidth = imgView.frame.width*scale
            newHeight = imgView.frame.height*scale
            btnResize.setTitle("Size Down", for: .normal)
        }
        
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom
    }
    
    @IBAction func swithImageOnOff(_ sender: UISwitch) {
        if sender.isOn{
            imgView.image = imgOn
        } else {
            imgView.image = imgOff
        }
    }
    
}

