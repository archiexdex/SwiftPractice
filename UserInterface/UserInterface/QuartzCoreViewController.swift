//
//  QuartzCoreViewController.swift
//  UserInterface
//
//  Created by 楊信之 on 9/25/16.
//  Copyright © 2016 楊信之. All rights reserved.
//

import UIKit
import QuartzCore

class QuartzCoreViewController: UIViewController {

    // MARK: - Variable
    let layer = CALayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewSetting()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - View Setting
    func viewSetting() {
        
        let image = UIImage(named: "image.png")
        let ratio = (image?.size.width)! / (image?.size.height)!
        
        let rect = CGRect(x: 50, y: 100, width: 200, height: 200 / ratio)
        layer.frame = rect
        
        layer.contents = image?.cgImage
        
        
        // Get cornerRadius
        layer.cornerRadius = 20.0
        layer.masksToBounds = true
        
        
        // Get shadow
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 10, height: 10)
        layer.shadowOpacity = 0.87
        layer.shadowRadius = 10.0
        
        view.layer.addSublayer(layer)
    }
    
    
    @IBAction func circleAction(_ sender: UISlider) {
        
        let degree = CGFloat(sender.value)
        let rad    = degree / 180.0 * CGFloat(M_PI)
        
        let rotation = CGAffineTransform(rotationAngle: rad)
        layer.setAffineTransform(rotation)
    }

}
