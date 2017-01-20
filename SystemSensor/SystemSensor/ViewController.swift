//
//  ViewController.swift
//  SystemSensor
//
//  Created by 楊信之 on 10/1/16.
//  Copyright © 2016 楊信之. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    let lm = LocationManager.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        lm.requestAlwaysInUse()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func start(_ sender: AnyObject) {
        
        lm.start()
        
    }
    
    @IBAction func startMap(_ sender: Any) {
        let MVC = self.storyboard?.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        self.present(MVC, animated: true, completion: nil)
        
        
    }
}

extension ViewController : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //
        let location = locations.last
        let lati = location?.coordinate.latitude
        let long = location?.coordinate.longitude
        let alti = location?.altitude
        print(" \(lati) \(long) \(alti)")
    }
}
