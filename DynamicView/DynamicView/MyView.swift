//
//  MyView.swift
//  DynamicView
//
//  Created by 楊信之 on 9/30/16.
//  Copyright © 2016 楊信之. All rights reserved.
//

import UIKit
import QuartzCore

class MyView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        // 1. Get a drawing zone
        let context = UIGraphicsGetCurrentContext()!
        
        // 2. Save current sate
        context.saveGState()
        
        // 3. Draw
        line(context: context)
//        dash(context: context)
        triangle(context: context)
        rectangle(context: context)
        arc(context: context)
        circle(context: context)
        curve(context: context)
        quadCurve(context: context)
        image(context: context)
        
        // 4. Restore state
        context.restoreGState()
        
    }
 
    // MARK: - Function
    func line( context : CGContext ) {
        context.setLineWidth(10)
        context.setStrokeColor(red: 0, green: 1, blue: 0, alpha: 1)
        context.move(to: CGPoint(x: 10, y: 100) )
        context.addLine(to: CGPoint(x: 100, y: 100) )
        context.drawPath(using: .stroke)
    }
    
    func dash( context : CGContext ) {
        context.setLineWidth(10)
        context.setStrokeColor(red: 0, green: 0.5, blue: 0, alpha: 1)
        let dashes : [CGFloat] = [ 20 , 3]
        context.setLineDash(phase: 10, lengths: dashes)
        context.move(to: CGPoint(x: 10, y: 120 ) )
        context.addLine(to: CGPoint(x: 100, y: 120) )
        context.drawPath(using: .stroke)
    }
    
    func triangle( context : CGContext ) {
        context.setLineWidth(10)
        context.setStrokeColor(red: 0, green: 0, blue: 1, alpha: 1)
        context.beginPath()
        context.move(to: CGPoint(x: 10, y: 150 ) )
        context.addLine(to: CGPoint(x: 70, y: 150) )
        context.addLine(to:  CGPoint(x: 150, y: 170) )
        context.addLine(to: CGPoint(x: 100, y: 200) )
        context.closePath()
        context.drawPath(using: .stroke)
    }
    
    func rectangle( context : CGContext ) {
        context.setFillColor(red: 0.3, green: 0, blue: 0, alpha: 0.5)
        context.addRect(CGRect(x: 140, y: 40, width: 100, height: 100) )
        context.drawPath(using: .fill)
    }
    
    func arc( context : CGContext ) {
        context.setLineWidth(5)
        context.setStrokeColor(red: 0.1, green: 0.3, blue: 0.5, alpha: 0.8)
        
        let center = CGPoint(x: 200, y: 200)
        context.addArc(center: center, radius: 50, startAngle: 0, endAngle: CGFloat( 45 / 180.0 * M_PI) , clockwise: false)
        let next = CGPoint(x: 270, y: 200)
        context.move(to: next)
        context.addArc(center: center, radius: 70, startAngle: 0, endAngle: CGFloat( -90 / 180.0 * M_PI ), clockwise: true)
        context.drawPath(using: .stroke)
    }
    
    func circle( context : CGContext ) {
        context.setFillColor(red: 0.7, green: 0.3, blue: 0.6, alpha: 0.3)
        context.addEllipse(in: CGRect(x: 20, y: 300, width: 200, height: 70) )
        context.drawPath(using: .fillStroke)
    }
    
    func curve( context : CGContext ) {
        context.setStrokeColor(red: 0.3, green: 0.4, blue: 0.1, alpha: 1)
        context.setLineWidth(2)
        
        context.move(to: CGPoint(x: 300, y:300) )
        let center = CGPoint(x: 20, y: 500)
        let controll1 = CGPoint(x: 40, y: 550)
        let controll2 = CGPoint(x: 60, y: 550)
        context.addCurve(to: center, control1: controll1, control2: controll2)
        context.drawPath(using: .stroke)
    }
    
    func quadCurve( context : CGContext ) {
        context.setStrokeColor(red: 0, green: 0.4, blue: 0.8, alpha: 0.6)
        
        context.move(to: CGPoint(x: 400, y:400) )
        let cen2 = CGPoint(x: 60, y: 600)
        let con1 = CGPoint(x: 40, y: 600)
        context.addQuadCurve(to: cen2, control: con1)
        context.drawPath(using: .fillStroke)
    }
    
    func image( context : CGContext ) {
        
        let image = UIImage(named: "roo.png")?.cgImage
        
        let ptr = CGRect(x: 150, y: 30, width: 150, height: 150)
        context.draw(image!, in: ptr)
        
        let subRect = CGRect(x: 0, y: 0, width: 100, height: 100)
        let subImg = image?.cropping(to: subRect)
        let ptr2 = CGRect(x: 200, y: 300, width: 150, height: 150)
        context.draw(subImg!, in: ptr2)
        
    }
    
}
