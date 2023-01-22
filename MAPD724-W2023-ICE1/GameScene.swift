//
//  GameScene.swift
//  MAPD724-W2023-ICE1
//
//  Created by Kisu on 2023-01-18.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    //instance variables
    var ocean : Ocean?
    
    override func sceneDidLoad() {
        name = "GAME"
        //add the ocean to the scene
        ocean = Ocean()
        ocean?.Reset()
        addChild(ocean!)
    }
    
    func touchDown(atPoint pos : CGPoint) {
        print("Touch Down")
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        print("Touch Move")
    }
    
    func touchUp(atPoint pos : CGPoint) {
        print("Touch Up")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        ocean?.Update()
    }
}
