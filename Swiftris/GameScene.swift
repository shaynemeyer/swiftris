//
//  GameScene.swift
//  Swiftris
//
//  Created by Shayne Meyer on 10/4/14.
//  Copyright (c) 2014 Maynesoft LLC. All rights reserved.
//

import SpriteKit

// This is the slowest speed our shapes will travel. 6/10ths of a second.
let TickLengthLevelOne = NSTimeInterval(600)

class GameScene: SKScene {

    // a closure that takes no parameters and returns nothing. It is optional and may be nil as denoted by the ?
    var tick:(() -> ())?
    var tickLengthMillis = TickLengthLevelOne
    var lastTick: NSDate?
    
    required init(coder aDecoder: (NSCoder!)) {
        fatalError("NSCoder not supported")
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        // 3
        if lastTick == nil {
            return
        }
        var timePassed = lastTick!.timeIntervalSinceNow * -1000.0
        if timePassed > tickLengthMillis {
            lastTick = NSDate.date()
            tick?() // ask swift if tick exists, if so, call it with no parameters
        }
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        
        anchorPoint = CGPoint(x: 0, y: 1.0)
        
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: 0, y: 0)
        background.anchorPoint = CGPoint(x: 0, y: 1.0)
        addChild(background)
    }
    
    // provide external access to start and stop the ticker.
    func startTicking() {
        lastTick = NSDate.date()
    }
    
    func stopTicking() {
        lastTick = nil
    }
}
