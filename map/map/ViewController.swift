//
//  ViewController.swift
//  map
//
//  Created by 楊信之 on 20/01/2017.
//  Copyright © 2017 楊信之. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet var mapView: MKMapView!
    
    let lm = LocationManager.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.showsUserLocation = true
        lm.start()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func addAnn(_ sender: Any) {
        addAnnotation()
    }

    func addAnnotation() {
        let ann = MKPointAnnotation()
        let location = lm.getLocation() as (Double, Double)
        print(location)
        print(lm.getCountry())
        ann.coordinate = CLLocationCoordinate2DMake(location.0, location.1)
        ann.title = lm.getCountry()
        self.mapView.addAnnotation(ann)
    }

}


