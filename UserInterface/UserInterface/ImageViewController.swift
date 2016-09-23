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
        
    }

}
