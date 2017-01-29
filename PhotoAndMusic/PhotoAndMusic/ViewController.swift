//
//  ViewController.swift
//  PhotoAndMusic
//
//  Created by 楊信之 on 22/01/2017.
//  Copyright © 2017 楊信之. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var theSlide: UISlider!
    fileprivate var mode : Int = 0
    var musicHandler = MusicHandler.sharedInstance
    var timer : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - IBAction
    @IBAction func playAction(_ sender: Any) {
        
        musicHandler.setMusic(name: "PPAP", type: "mp3")
        self.theSlide.minimumValue = 0
        self.theSlide.maximumValue = musicHandler.getMusicDuration()
        self.theSlide.value = 0
        
        musicHandler.play()
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ticker), userInfo: nil, repeats: false)
    }
    @IBAction func pickerAction(_ sender: UIView) {
        mode = 0
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.modalPresentationStyle = .popover
        let popover = picker.popoverPresentationController
        popover?.sourceView = sender
        popover?.sourceRect = sender.bounds
        popover?.permittedArrowDirections = .any
        
        self.present(picker, animated: true, completion: nil)
    }
    
    @IBAction func action(_ sender: Any) {
        mode = 1
        guard checkDevice() else {
            return
        }
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        self.present(imagePicker, animated: true, completion: nil)
        
    }

    //MARK: - Function
    func checkDevice() -> Bool {
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            print("Device has camera")
            if UIImagePickerController.isCameraDeviceAvailable(.front) {
                print("Device has front camera")
            }
            if UIImagePickerController.isCameraDeviceAvailable(.rear) {
                print("Device has rear camera")
            }
            if UIImagePickerController.isFlashAvailable(for: .front) {
                print("Device has front flash")
            }
            if UIImagePickerController.isFlashAvailable(for: .rear) {
                print("Device has rear flash")
            }
            
            return true
        }
        
        print("Device don't have camera")
        return false
        
    }
    
    func ticker() {
        self.theSlide.value = musicHandler.getCurrentTime()
    }
    
}
extension ViewController : UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //
        guard (info[UIImagePickerControllerOriginalImage] != nil) else {
            return
        }
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        switch mode {
        case 0:
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        default: break
        }
        
        self.imageView.image = image
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //
        self.dismiss(animated: true, completion: nil)
    }
}
extension ViewController : UINavigationControllerDelegate {
    
}
