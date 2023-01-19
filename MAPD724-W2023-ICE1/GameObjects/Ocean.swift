//
//  Ocean.swift
//  MAPD724-W2023-ICE1
//
//  Created by Kisu on 2023-01-18.
//

import GameplayKit
import SpriteKit

class Ocean : GameObject {
    //constructor / initializer
    init() {
        super.init(imageString: "ocean", initialScale: 2.0)
        Start()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func Start() {
        zPosition = 0
        verticleSpeed = 5.0
    }
    override func Update() {
        Move()
        CheckBounds()
    }
    override func CheckBounds() {
        if (position.y <= -773) {
            Reset()
        }
    }
    override func Reset() {
        position.y = 773
    }
    func Move() {
        position.y -= verticleSpeed!
    }
}
