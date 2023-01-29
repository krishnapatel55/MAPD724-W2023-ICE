//
//  Player.swift
//  MAPD724-W2023-ICE1
//
//  Created by Kisu on 2023-01-21.
//

import GameplayKit
import SpriteKit

class Player : GameObject {
    //constructor / initializer
    init() {
        super.init(imageString: "plane", initialScale: 2.0)
        Start()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //LifeCycle functions
    override func Start() {
        zPosition = 2
        verticleSpeed = 5.0
    }
    override func Update() {
        CheckBounds()
    }
    override func CheckBounds() {
        //constraint the player on the left boundry
        if (position.x <= -255) {
            position.x = -255
        }
        
        //constraint the player on the right boundry
        if (position.x >= 255) {
            position.x = 255
        }
    }
    override func Reset() {
        position.y = -495
    }
    func TouchMove(newPos: CGPoint) {
        position = newPos
    }
}
