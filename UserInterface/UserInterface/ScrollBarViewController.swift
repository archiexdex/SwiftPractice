//
//  ScrollBarViewController.swift
//  UserInterface
//
//  Created by 楊信之 on 9/24/16.
//  Copyright © 2016 楊信之. All rights reserved.
//

import UIKit

class ScrollBarViewController: UIViewController  {

    // MARK: - IBOutlet
    
    // MARK: - Variable
    var scrollView  : UIScrollView!
    var imageView   : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewSetting()
        setZoomScale()
        setGestureRecognizer()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        //
        setZoomScale()
    }
    
    // MARK: - View Setting
    func viewSetting() {
        
        imageView = UIImageView(image: UIImage(named: "Minions1.jpg"))

        scrollView = UIScrollView(frame: view.bounds)
        scrollView.backgroundColor = .black
        scrollView.contentSize = imageView.bounds.size
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.delegate = self
        
        
        scrollView.addSubview(imageView)
        view.addSubview(scrollView)
    }
    
    func setZoomScale() {
        let imageViewSize = imageView.bounds.size
        let scrollViewSize = scrollView.bounds.size
        let widthScale = scrollViewSize.width / imageViewSize.width
        let heightScale = scrollViewSize.height / imageViewSize.height
        
        scrollView.minimumZoomScale = min(widthScale, heightScale)
        scrollView.zoomScale = 1.0
    }
    
    // MARK: - Function
    func setGestureRecognizer() {
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(self.doubleTapHandler(recognizer:) ) )
        doubleTap.numberOfTapsRequired = 2
        scrollView.addGestureRecognizer(doubleTap)
    }
    
    func doubleTapHandler(recognizer: UITapGestureRecognizer) {
        
        if (scrollView.zoomScale > scrollView.minimumZoomScale) {
            scrollView.setZoomScale(scrollView.minimumZoomScale, animated: true)
        } else {
            scrollView.setZoomScale(scrollView.maximumZoomScale, animated: true)
        }
    }
}

extension ScrollBarViewController : UIScrollViewDelegate {
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        //
        print("forzooming")
        return imageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        //
        let imageViewSize = imageView.frame.size
        let scrollViewSize = scrollView.bounds.size
        
        let verticalPadding = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.height) / 2 : 0
        let horizontalPadding = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2 : 0
        
        scrollView.contentInset = UIEdgeInsets(top: verticalPadding, left: horizontalPadding, bottom: verticalPadding, right: horizontalPadding)
        print("didzoom")

    }
}
