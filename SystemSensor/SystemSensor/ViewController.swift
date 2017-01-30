//
//  ViewController.swift
//  SystemSensor
//
//  Created by 楊信之 on 10/1/16.
//  Copyright © 2016 楊信之. All rights reserved.
//

import UIKit
import CoreLocation
import CoreMotion

class ViewController: UIViewController {

//    let lm = LocationManager.sharedInstance
    var lm : CLLocationManager?
    var mm : CMMotionManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        lm = CLLocationManager()
        mm = CMMotionManager()
        
        lm?.delegate = self
        lm?.startUpdatingHeading()
        
        let que = OperationQueue()
        // For accelerator
//        mm?.startAccelerometerUpdates(to: que, withHandler: { (data, error) in
//            //
//            if (data != nil) {
//                print(">>accelero x \(data?.acceleration.x) y \(data?.acceleration.y) z \(data?.acceleration.z) ")
//            }
//        })
        
        // For gyroscope
//        mm?.startGyroUpdates(to: que, withHandler: { (data, error) in
//            if data != nil {
//                print(">> gyro x \(data!.rotationRate.x) y \(data!.rotationRate.y) z \(data!.rotationRate.z)")
//            }
//        })
        
        //For magnetometer
//        mm?.startMagnetometerUpdates(to: que, withHandler: { (data, error) in
//            if data != nil {
//                print(">> magnet x \(data!.magneticField.x) y \(data!.magneticField.y) z \(data!.magneticField.z)")
//
//            }
//        })
        
        // For device motion
//        mm?.startDeviceMotionUpdates(to: que, withHandler: { (motion, error) in
//            
//            motion?.attitude.pitch
//            motion?.attitude.roll
//            motion?.attitude.yaw
//        
//            motion?.rotationRate.x
//            motion?.rotationRate.y
//            motion?.rotationRate.z
//        
//            motion?.gravity.x
//            motion?.gravity.y
//            motion?.gravity.z
//        
//            motion?.userAcceleration.x
//            motion?.userAcceleration.y
//            motion?.userAcceleration.z
//        
//            motion?.magneticField.field.x
//            motion?.magneticField.field.y
//            motion?.magneticField.field.z
//        
//        })
        
        let device = UIDevice()
        device.isProximityMonitoringEnabled = true
        
        if device.isProximityMonitoringEnabled == false {
            print("GG")
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func start(_ sender: AnyObject) {
        
        print("QQ")
        
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        //
        
        if event?.subtype == UIEventSubtype.motionShake {
            print(">> I am shaking")
        }
        
    }
    
    
}

extension ViewController : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        //
        if newHeading.headingAccuracy < 0 {
            print("OAO")
        }
        //print(">> Facing \(newHeading.magneticHeading)")
    }
}
