//
//  Snack.swift
//  Snack
//
//  Created by 楊信之 on 9/26/16.
//  Copyright © 2016 楊信之. All rights reserved.
//

import UIKit

struct position {
    var x : Int
    var y : Int
    
    init( _x : Int , _y : Int) {
        self.x = _x
        self.y = _y
    }
}

class Snack: NSObject {

    // MARK: - Private Variable
    private var snackLength : Int!
    private var snackBody   : [position]!
    
    
    // MARK: - Singleton
    class var sharedInstance : Snack{
        struct Singleton {
            static let instance = Snack()
        }
        return Singleton.instance
    }
    
    // MARK: - Initial
    override init() {
        //
        super.init()
        snackLength = 1
        let pos = getPos()
        snackBody.append(pos)
    }
    
    // MARK: - Private Function
    private func getPos() -> position {
        let pos = position(_x: Int(arc4random()), _y: Int(arc4random()) )
        return pos
    }
    
    // MARK: - Public Function
    func eat( pos : position ) {
        
        // 1. Add a new body in the head
        snackBody.insert(pos, at: 0)
    }
    
    func move( ) {
        
        // 1. Remove the last one
        let ptr = snackBody.count - 1
        snackBody.remove(at: ptr)
        
        // 2. Create a new body in the next step
        
        // 3. Insert new body into head
        
    }
    
}
