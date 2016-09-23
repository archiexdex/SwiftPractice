//
//  ImageViewController.swift
//  UserInterface
//
//  Created by 楊信之 on 9/23/16.
//  Copyright © 2016 楊信之. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Variable
    var imageList : [UIImage]? = []
    var isRun     : Bool = false
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewSetting()
        isRun = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - View Setting
    func viewSetting() {
        
        // 1. Image Setting
        for ptr in 0...7 {
            let imageName = "\(ptr)" + ".png"
            self.imageList!.append( UIImage(named: imageName)! )
        }
        self.imageView.animationImages = imageList
        self.imageView.animationDuration = 1 // 1s
        self.imageView.image = imageList?[0]
        
        // 2. Button Setting
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 164, y: 236, width: 50, height: 30)
        button.setTitle("Run", for: .normal)
        button.addTarget(self, action:  #selector(self.runAction) , for: .touchUpInside)
        self.view.addSubview(button)
        
        // 3. Slider
        let slider = UISlider()
        slider.frame = CGRect(x: 164, y: 300, width: 100, height: 50)
        slider.maximumValue = 1.0
        slider.minimumValue = 0.1
        slider.addTarget(self, action: #selector(self.speedChange), for: .touchUpInside)
        self.view.addSubview(slider)
        
        // 4. Switch
        let sw = UISwitch()
        sw.frame = CGRect(x: 300, y: 300, width: 50, height: 50)
        sw.isOn = false
        sw.addTarget(self, action: #selector(self.speedMore(sender:)), for: .touchUpInside)
        self.view.addSubview(sw)
    }
    
    // MARK: - Function
    func runAction() {
        
        if imageView.isAnimating {
            imageView.stopAnimating()
        }
        else {
            imageView.startAnimating()
        }
        
    }
    
    func speedChange( sender : UISlider) {
        print(">> \(sender.value)")
        
        imageView.animationDuration = TimeInterval(sender.value)
        print(imageView.isAnimating)
        imageView.startAnimating()
    }
    
    func speedMore( sender : UISwitch) -> Void {
        print(">> \(sender.isOn)")
    }
    
}
