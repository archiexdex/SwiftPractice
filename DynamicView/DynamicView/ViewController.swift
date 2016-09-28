//
//  ViewController.swift
//  DynamicView
//
//  Created by 楊信之 on 9/28/16.
//  Copyright © 2016 楊信之. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var item: UIView!
    @IBOutlet weak var anchor: UILabel!
    @IBOutlet weak var gravItem: UIView!
    @IBOutlet weak var snapItem: UIView!
    
    
    // MARK: - Variable
    var attachA     : UIDynamicAnimator!
    var gravityA    : UIDynamicAnimator!
    var snapA       : UIDynamicAnimator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        attachMent()
        gravity()
        push()
        snap()
        collision()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Function
    func attachMent() {
        
        attachA = UIDynamicAnimator(referenceView: self.view)
        
        let behavior = UIAttachmentBehavior(item: item, offsetFromCenter: UIOffsetMake(25, 25), attachedToAnchor: anchor.center)
        attachA.addBehavior(behavior)
        
    }
    
    func gravity() {
        
        gravityA = UIDynamicAnimator(referenceView: self.view)
        
        let behavior = UIGravityBehavior(items: [gravItem])
        behavior.gravityDirection = CGVector(dx: 0.0, dy: 1.0)
        
        gravityA.addBehavior(behavior)
        
    }
    
    func collision() {
        
        let behavior = UICollisionBehavior(items: [self.gravItem])
        behavior.translatesReferenceBoundsIntoBoundary = true
        
        gravityA.addBehavior(behavior)
    }
    
    func push() {
        
        // .continuous
        // .instantaneous
        let behavior = UIPushBehavior(items: [gravItem], mode: .continuous)
        behavior.magnitude = 1.0
        /**     
        *       90
         *  0       180
         *     -90
         */
        behavior.angle = CGFloat( 90 / 180.0 * M_PI)
        
        gravityA.addBehavior(behavior)
        
    }
    
    func snap() {
        
        snapA = UIDynamicAnimator(referenceView: self.view)
        
    }
    
    

    @IBAction func panGestureHandler(_ sender: UIPanGestureRecognizer) {
        //
        // 1. Get pan location
        let point = sender.location(in: self.view)
        
        // 2. Move anchor
        anchor.center = point
        
        // 3. Get behavior
        let behavior = attachA.behaviors.first as! UIAttachmentBehavior
        
        // 4. Assign new position to item
        behavior.anchorPoint = point
    }
    
    @IBAction func tapGestureHandler(_ sender: UITapGestureRecognizer) {
        
        // 1. Get Point
        let point = sender.location(in: self.view)
        
        // 2. Create Behavior
        let behavior = UISnapBehavior(item: snapItem, snapTo: point)
        
        // 3. Setting
        behavior.damping = 0.5
        
        // 4. Remove perious behavior and Add new behavior
        snapA.removeAllBehaviors()
        snapA.addBehavior(behavior)
    }
    

}

