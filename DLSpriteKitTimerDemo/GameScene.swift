//
//  GameScene.swift
//  DLSpriteKitTimerDemo
//
//  Created by David Lechón Quiñones on 26/10/15.
//  Copyright (c) 2015 dlqapps. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var timer = DLSpriteKitTimer(seconds: 10, withActionPersecond: { () -> () in
        print("One second decreased.")
        }, withFiringAction: { () -> () in
        print("Time out!")
        }, decreasing: true)
    
    var secondTimer = DLSpriteKitTimer(seconds: 10, withActionPersecond: { () -> () in
        print("One second increased.")
        }, withFiringAction: { () -> () in
            print("Time out!")
        }, decreasing: false)
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        timer.fontSize = 45
        timer.fontName = "Helvetica Neue"
        timer.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        
        secondTimer.fontSize = 45
        secondTimer.fontName = "Helvetica Neue"
        secondTimer.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame) - 50)
        
        self.addChild(timer)
        self.addChild(secondTimer)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if timer.running {
            timer.stop()
            secondTimer.stop()
        } else {
            timer.start()
            secondTimer.start()
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
