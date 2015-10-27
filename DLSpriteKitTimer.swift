//
//  DLSpriteKitTimer.swift
//  DLSpriteKitTimerDemo
//
//  Created by David Lechón Quiñones on 26/10/15.
//  Copyright © 2015 dlqapps. All rights reserved.
//

import Foundation
import SpriteKit

class DLSpriteKitTimer: SKLabelNode {
    init(seconds: Int, withActionPersecond: (() -> ())?, withFiringAction: () -> (), decreasing: Bool) {
        self.running = false
        self.actionPerSecond = withActionPersecond
        self.firingAction = withFiringAction
        self.decreasingTime = decreasing
        
        if self.decreasingTime {
            self.firstSecond = seconds
            self.lastSecond = 0
        } else {
            self.firstSecond = 0
            self.lastSecond = seconds
        }
        
        self.counter = self.firstSecond
    
        super.init()
        
        self.text = String(self.counter)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func start() {
        running = true
        timerAction = SKAction.repeatActionForever(SKAction.sequence([actionwait,actionForEverySecond(actionPerSecond)]))
        
        if let timerAction = timerAction {
            self.runAction(timerAction, withKey: "timer")
        }
    }
    
    func pause() {
        running = false
        self.removeActionForKey("timer")
    }
    
    func stop() {
        pause()
        counter = firstSecond
    }
    
    func reset() {
        stop()
        start()
    }

    var running: Bool
    
    private let firstSecond: Int
    
    private let lastSecond: Int
    
    private let actionPerSecond: (() -> ())?
    
    private let firingAction: () -> ()
    
    private var decreasingTime = false

    private var counter: Int {
        didSet {
            self.text = String(counter)
        }
    }
    
    private var timerAction: SKAction?
    
    private let actionwait = SKAction.waitForDuration(1)
    
    private func decreaseOrIncreaseTime() {
        if decreasingTime {
            if counter > lastSecond {
                counter--
            }
            
        } else {
            if counter < lastSecond {
                counter++
            }
        }
        
        if decreasingTime && counter == 0 || !decreasingTime && counter == lastSecond{
            stop()
            firingAction()
        }
    }
    
    private func actionForEverySecond(action: (() -> ())?) -> SKAction{
        let actionRun = SKAction.runBlock({
            self.decreaseOrIncreaseTime()
            if let action = action {
                if self.running {
                    action()
                }
                
            }
            
        })
        
        return actionRun
    }
    
}

