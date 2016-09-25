//
//  WebViewController.swift
//  UserInterface
//
//  Created by 楊信之 on 9/25/16.
//  Copyright © 2016 楊信之. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewSetting()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Function
    func viewSetting() {
        
        let url = NSURL(string: "https://www.google.com")
        let request = NSURLRequest(url: url as! URL)
        
        webView.loadRequest(request as URLRequest)
        
//        let html = "<html><p>hello world</p></html>"
//        self.webView.loadHTMLString(html, baseURL: nil)
    }
    
}
