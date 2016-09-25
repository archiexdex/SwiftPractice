//
//  ScrollViewController.swift
//  UserInterface
//
//  Created by 楊信之 on 9/25/16.
//  Copyright © 2016 楊信之. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewSetting()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewSetting() {
        var images : [UIImageView] = []
        images.append(UIImageView(image: UIImage(named: "0.png") ) )
        images.append(UIImageView(image: UIImage(named: "1.png") ) )
        images.append(UIImageView(image: UIImage(named: "2.png") ) )
        
        var size = CGSize()
        let rect = scrollView.bounds
        var top : UIImageView? = nil
        
        for ptr in images {
            //
            ptr.contentMode = .scaleAspectFit
            
            if top == nil {
                ptr.frame = rect
            }
            else {
                
                if let offset = top?.frame.offsetBy(dx: (top?.frame.size.width)!, dy: 0) {
                    print(">> \(offset)")
                    ptr.frame = offset
                }
            }
            
            top = ptr
            
            size = CGSize(width: size.width + ptr.frame.size.width , height: rect.size.height)
            print(">>>size width \(size.width) height \(size.height), image width \(ptr.frame.size.width) height \(rect.size.height)")
            
            self.scrollView.addSubview(ptr)
        }
        
        self.scrollView.contentSize = size
    }
    @IBAction func didEndOnExit(_ sender: UITextField) {
        let a = sender.resignFirstResponder()
        print(">> resign first responder : \(a)")
    }
    
}
