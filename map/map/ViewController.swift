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
    var mode : Int = 0
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
        print("QQ")
    }
    @IBAction func changeTypeAction(_ sender: Any) {
        mode = mode + 1
        switch mode {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .satellite
        case 2:
            mapView.mapType = .satelliteFlyover
        case 3:
            mapView.mapType = .hybrid
        case 4:
            mapView.mapType = .hybridFlyover
        default:
            mapView.mapType = .standard
        }
    }

    func addAnnotation() {
        let ann = MKPointAnnotation()
        var arr : [CLLocationCoordinate2D] = []
        let location = lm.getLocation() as (Double, Double)
        arr.append(CLLocationCoordinate2DMake(location.0     , location.1     ))
        arr.append(CLLocationCoordinate2DMake(location.0+0.01, location.1     ))
        arr.append(CLLocationCoordinate2DMake(location.0+0.01, location.1+0.01))
        arr.append(CLLocationCoordinate2DMake(location.0     , location.1+0.01))
        let poly = MKPolygon(coordinates: arr, count: arr.count)
        mapView.add(poly)
//        ann.coordinate = CLLocationCoordinate2DMake(location.0, location.1)
//        ann.title = lm.getCountry()
//        self.mapView.addAnnotation(ann)
    }
    
    func act() {
        print("OWO")
    }

}
extension ViewController : MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        //
        
        var view : MKPinAnnotationView?
        var pict : MKAnnotationView?
        view = mapView.dequeueReusableAnnotationView(withIdentifier: "Pin") as? MKPinAnnotationView
        pict = mapView.dequeueReusableAnnotationView(withIdentifier: "Pin")
        
        if view == nil {
            view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "Pin")
        }
        if (annotation.title)!! as String == "Taiwan" {
            view?.pinTintColor = .green
            let imgView = UIImageView(image: UIImage(named: "a.jpg"))
            view?.leftCalloutAccessoryView = imgView
            let btn = UIButton(type: .detailDisclosure)
            btn.tag = 0
            btn.addTarget(self, action: #selector(act), for: .touchUpInside)
            view?.rightCalloutAccessoryView = btn
            
        }
        view?.isDraggable    = true
        view?.canShowCallout = true
        return view

        
//        if pict == nil {
//            pict = MKAnnotationView(annotation: annotation, reuseIdentifier: "Pin")
//            print("!!")
//        }
//        pict?.image = UIImage(named: "a.jpg")
//        pict?.isDraggable = true
//        pict?.canShowCallout = true
//        return pict
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, didChange newState: MKAnnotationViewDragState, fromOldState oldState: MKAnnotationViewDragState) {
        if newState == .ending {
            view.dragState = .none
            print("WW")
        }
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        //
        
        print("select now")
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let render = MKPolygonRenderer(overlay: overlay)
        render.fillColor = UIColor.green.withAlphaComponent(0.5)
        render.strokeColor = (.blue)
        render.lineWidth = 5.0
        return render
    }
}

