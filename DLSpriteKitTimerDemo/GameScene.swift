//
//  GameScene.swift
//  DLSpriteKitTimerDemo
//
//  Created by David Lechón Quiñones on 26/10/15.
//  Copyright (c) 2015 dlqapps. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var timer = DLSpriteKitTimer(usingLabel: SKLabelNode(fontNamed:"Helvetica Neue"), seconds: 10, withActionPersecond: { () -> () in
        print("One second passed.")
        }, withFiringAction: { () -> () in
        print("Time out!")
        }, decreasing: false)
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        timer.label.fontSize = 45;
        timer.label.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        self.addChild(timer.label)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if timer.running {
            timer.stop()
        } else {
            timer.start()
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
