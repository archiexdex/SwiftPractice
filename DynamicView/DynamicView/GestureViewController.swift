//
//  GestureViewController.swift
//  DynamicView
//
//  Created by 楊信之 on 9/30/16.
//  Copyright © 2016 楊信之. All rights reserved.
//

import UIKit

class GestureViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapAction(_ sender: UITapGestureRecognizer) {
        
        
        let point = sender.location(in: sender.view)
        print("I tap location \(point)")
        
    }

    
    @IBAction func pinchAction(_ sender: UIPinchGestureRecognizer) {
        
//        if sender.state == .began {
//            print("start pinch")
//        }
//        else if sender.state == .changed {
//            print(sender.scale)
//        }
//        else if sender.state == .ended {
//            print("end pinch")
//        }
        
    }
    
    @IBAction func rotateAction(_ sender: UIRotationGestureRecognizer) {
        
        let rad = sender.rotation
        let deg = rad / CGFloat(M_PI) * 180.0
        
        if rad > CGFloat(0) {
            print("circle")
        }
        else {
            print("recircle")
        }
        print(" rad : \(rad) , degree : \(deg)")
    }
    
    @IBAction func swipeAction(_ sender: UISwipeGestureRecognizer) {
        
        print("!!!")
        switch sender.direction {
        case UISwipeGestureRecognizerDirection.right:
            print("right")
        case UISwipeGestureRecognizerDirection.left:
            print("left")
        case UISwipeGestureRecognizerDirection.up:
            print("up")
        case UISwipeGestureRecognizerDirection.down:
            print("down")
        default : break
            
        }
    }
    
    @IBAction func panAction(_ sender: UIPanGestureRecognizer) {
        
//        for ptr in 0..<sender.numberOfTouches {
//            //
//            let point = sender.location(ofTouch: ptr, in: sender.view)
//            print(">>pan \(ptr)th location : \(point)")
//        }
    }
    
    @IBAction func screenEdgPanAction(_ sender: UIScreenEdgePanGestureRecognizer) {
        
        if sender.state == .ended {
            print("!! screen edge")
        }
    }
    
    @IBAction func longPressAction(_ sender: UILongPressGestureRecognizer) {
        
        for ptr in 0..<sender.numberOfTouchesRequired {
            let point = sender.location(ofTouch: ptr, in: sender.view)
            print(">>long press \(ptr)th location : \(point)")
        }
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
