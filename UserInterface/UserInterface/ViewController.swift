//
//  ViewController.swift
//  UserInterface
//
//  Created by 楊信之 on 9/22/16.
//  Copyright © 2016 楊信之. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var alertViewButton: UIButton!
    
    // MARK: - Variable
    var pickerViewList : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        viewSetting()
        config()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - View Config
    func viewSetting() {
        //
        
    }
    
    // MARK: - Config
    func config() {
        self.pickerViewList = ["1","2","3","4","5","6","7","8","9","0"]
    }
    
    // MARK: - IBAction
    @IBAction func alertViewAction(_ sender: AnyObject) {
        
        let alertController = UIAlertController(title: "alertView", message: "This is alertView dialog", preferredStyle: .alert)
        let doneAction = UIAlertAction(title: "done", style: .default , handler : nil)
        alertController.addAction(doneAction)
        alertController.addTextField { (textField) in
            //
            textField.placeholder = "USER ID"
        }
        alertController.addTextField { (textField) in
            //
            textField.placeholder = "PASSWORD"
            textField.isSecureTextEntry = true
        }
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func datePickVC(_ sender: AnyObject) {
        
        let DPVC = self.storyboard?.instantiateViewController(withIdentifier: "DatePickerViewController") as! DatePickerViewController
        
        self.present(DPVC, animated: true, completion: nil)
    }
    
    @IBAction func ImageViewAction(_ sender: AnyObject) {
        
        let IVC = self.storyboard?.instantiateViewController(withIdentifier: "ImageViewController") as! ImageViewController
        
        self.present(IVC, animated: true, completion: nil)
    }
    
    @IBAction func ScrollBarAction(_ sender: AnyObject) {
        
        let SBVC = self.storyboard?.instantiateViewController(withIdentifier: "ScrollBarViewController") as! ScrollBarViewController
        self.present(SBVC, animated: true, completion: nil)
    }
    
    
    @IBAction func ScrollViewAction(_ sender: AnyObject) {
        
        let SVC = self.storyboard?.instantiateViewController(withIdentifier: "ScrollViewController") as! ScrollViewController
        self.present(SVC, animated: true, completion: nil)
    }
    
    @IBAction func WebViewAction(_ sender: AnyObject) {
        
        let WVC = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        self.present(WVC, animated: true, completion: nil)
    }
    
    @IBAction func QuartzCoreAction(_ sender: AnyObject) {
        
        let QCVC = self.storyboard?.instantiateViewController(withIdentifier: "QuartzCoreViewController") as! QuartzCoreViewController
        self.present(QCVC, animated: true, completion: nil)
    }
    
    
}

