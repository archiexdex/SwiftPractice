//
//  ViewController.swift
//  3DCube
//
//  Created by HsinChih Yang on 20/05/2017.
//  Copyright © 2017 Archie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let screenSize = UIScreen.main.bounds.size
    var diceView : UIView!
    var angle = CGPoint(x: 0, y: 0)
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //View Setting
        viewSetting()
        
        //Add Gesture
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.viewTransform) )
        diceView.addGestureRecognizer(panGesture)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//MARK: - Function
    func viewSetting() {
        
        diceView = UIView()
        diceView.frame = CGRect(origin: CGPoint(x: 0, y: screenSize.height / 2 - 50) , size: CGSize(width: screenSize.width, height: 100) )
        diceView.backgroundColor = .blue
        
        var diceTransform = CATransform3DIdentity
        
        let dice1 = UIImageView(image: UIImage(named: "dice1.jpg"))
        dice1.frame = CGRect(x: screenSize.width / 2 - 50, y: 0, width: 100, height: 100)
        diceTransform = CATransform3DTranslate(diceTransform, 0, 0, 50)
        dice1.layer.transform = diceTransform
        diceView.addSubview(dice1)
        
        let dice6 = UIImageView(image: UIImage(named: "dice6.jpg"))
        dice6.frame = CGRect(x: screenSize.width / 2 - 50, y: 0, width: 100, height: 100)
        diceTransform = CATransform3DTranslate(diceTransform, 0, 0, -100)
        dice6.layer.transform = diceTransform
        diceView.addSubview(dice6)
        
        let dice2 = UIImageView(image: UIImage(named: "dice2.jpg"))
        dice2.frame = CGRect(x: screenSize.width / 2 - 50, y: 0, width: 100, height: 100)
        diceTransform = CATransform3DRotate(CATransform3DIdentity, CGFloat.pi / 2, 0, 1, 0)
        diceTransform = CATransform3DTranslate(diceTransform, 0, 0, 50)
        dice2.layer.transform = diceTransform
        diceView.addSubview(dice2)
        
        let dice5 = UIImageView(image: UIImage(named: "dice5.jpg"))
        dice5.frame = CGRect(x: screenSize.width / 2 - 50, y: 0, width: 100, height: 100)
        diceTransform = CATransform3DRotate(CATransform3DIdentity, -CGFloat.pi / 2, 0, 1, 0)
        diceTransform = CATransform3DTranslate(diceTransform, 0, 0, 50)
        dice5.layer.transform = diceTransform
        diceView.addSubview(dice5)
        
        let dice3 = UIImageView(image: UIImage(named: "dice3.jpg"))
        dice3.frame = CGRect(x: screenSize.width / 2 - 50, y: 0, width: 100, height: 100)
        diceTransform = CATransform3DRotate(CATransform3DIdentity, -(CGFloat.pi / 2), 1, 0, 0)
        diceTransform = CATransform3DTranslate(diceTransform, 0, 0, 50)
        dice3.layer.transform = diceTransform
        diceView.addSubview(dice3)
        
        let dice4 = UIImageView(image: UIImage(named: "dice4.jpg"))
        dice4.frame = CGRect(x: screenSize.width / 2 - 50, y: 0, width: 100, height: 100)
        diceTransform = CATransform3DRotate(CATransform3DIdentity, (CGFloat.pi / 2), 1, 0, 0)
        diceTransform = CATransform3DTranslate(diceTransform, 0, 0, 50)
        dice4.layer.transform = diceTransform
        diceView.addSubview(dice4)
        
        
        self.view.addSubview(diceView)
        
    }
    func viewTransform(sender: UIPanGestureRecognizer) {
        
        let point = sender.translation(in: self.diceView)
        let angleX = self.angle.x + point.x / 30
        let angleY = self.angle.y + point.y / 30
        
        
        var transform = CATransform3DIdentity
        transform.m34 = -1 / 500
        transform = CATransform3DRotate(transform, angleX, 0, 1, 0)
        transform = CATransform3DRotate(transform, angleY, 1, 0, 0)
        self.diceView.layer.sublayerTransform = transform
        
    }
    
    
}

