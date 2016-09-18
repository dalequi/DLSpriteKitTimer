# DLSpriteKitTimer **Deprecated**
Simple Timer for SpriteKit Games written in Swift.

This timer is used in [Elem](http://www.elem.rocks).

## Overview
DLSpriteKitTimer is a subclass of SKLabelNode, so it's ready to be added to any GameScene as a subchild.

It has two modes, being selected in the initializer with the parameter decreasing: Bool
* Decreasing time: The timer goes from the selected seconds to zero.
* Increasing time: The timer goes from zero to the selected seconds.

It also allows to set a function executed every second, passing an optional closure to the parameter withActionPersecond: (() -> ())? in the initializer.

It requires a function that is executed at the end of the timer. The parameter is called withFiringAction: () -> () in the initializer.

## API

- func start()

- func pause()

- func stop()

- func reset()

## Demo Project

The demo was built using Xcode 7 and Swift 2.0. Run and touch the screen to start the counters.

![Screenshot](http://i.imgur.com/NgzMxsp.png)
