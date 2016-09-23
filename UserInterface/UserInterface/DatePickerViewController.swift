//
//  DatePickerViewController.swift
//  UserInterface
//
//  Created by 楊信之 on 9/22/16.
//  Copyright © 2016 楊信之. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

    // MARK: - IBOutlet
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //
        super.viewWillAppear(animated)
        
    }
    
    @IBAction func datePickAction(_ sender: UIDatePicker) {
        
        print(">>\(sender.date)")
    }
    
    @IBAction func countDownAction(_ sender: UIDatePicker) {
        
        let time = sender.countDownDuration
        print(">> count down time is \(time)")
    }
    

}
