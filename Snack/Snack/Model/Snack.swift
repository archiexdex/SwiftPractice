//
//  Snack.swift
//  Snack
//
//  Created by 楊信之 on 9/26/16.
//  Copyright © 2016 楊信之. All rights reserved.
//

import UIKit

enum Direction : Int {
    case north
    case east
    case south
    case west
}

class Snack: NSObject {

    // MARK: - Private Variable
    private var snackLength : Int!
    private var snackBody   : [(Int, Int)]!
    
    
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
    private func getPos() -> ( Int, Int ) {
        let pos = ( Int(arc4random()) , Int(arc4random()) )
        return pos
    }
    
    // MARK: - Public Function
    func eat( pos : (Int,Int) ) {
        
        // 1. Add a new body in the head
        snackBody.insert(pos, at: 0)
    }
    
    func move( way : Direction ) {
        
        // 1. Remove the last one
        let ptr = snackBody.count - 1
        snackBody.remove(at: ptr)
        
        // 2. Create a new body in the next step
        let nPos : (Int, Int)!
        let (headX, headY) = snackBody[0]
        switch way {
        case .east:
            nPos = (headX + 1 , headY)
        case .west:
            nPos = (headX - 1 , headY)
        case .north :
            nPos = (headX , headY + 1)
        case .south:
            nPos = (headX , headY - 1)
        }
        
        // 3. Insert new body into head
        snackBody.insert(nPos, at: 0)
    }
    
    func isCollision( pos : (Int, Int) ) -> Bool {
        
        let head = snackBody[0] as (Int, Int)
        return head == pos
    }
    
    func isCollideSelf() -> Bool {
        
        let head = snackBody[0] as (Int ,Int)
        
        for ptr in 1..<snackBody.count {
            //
            if head == snackBody[ptr] {
                return false
            }
        }
        
        return true
    }
}
