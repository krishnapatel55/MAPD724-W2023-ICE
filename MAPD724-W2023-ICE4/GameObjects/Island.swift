//
//  Island.swift
//  MAPD724-W2023-ICE2
//
//  Created by Kisu on 2023-01-29.
//

import GameplayKit
import SpriteKit

class Island : GameObject
{
    //initializer
    init() {
        super.init(imageString: "island", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //lifecycle functions
    override func Start() {
        zPosition = Layer.island.rawValue
        verticleSpeed = 5.0
        Reset()
    }
    override func Update() {
        Move()
        CheckBounds()
    }
    override func CheckBounds() {
        if(position.y <= -876) {
            Reset()
        }
    }
    override func Reset() {
        position.y = 876
        //get a pseudo random number
        let randomX:Int = (randomSource?.nextInt(upperBound: 626))! - 313
        position.x = CGFloat(randomX)
        isColliding = false
    }
    
    //public method
    func Move() {
        position.y -= verticleSpeed!
    }
}
