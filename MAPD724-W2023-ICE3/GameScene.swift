//
//  GameScene.swift
//  MAPD724-W2023-ICE1
//
//  Created by Kisu on 2023-01-18.
//

import SpriteKit
import GameplayKit
import AVFoundation
import UIKit

class GameScene: SKScene {
    //instance variables
    var ocean1 : Ocean?
    var ocean2 : Ocean?
    var player : Player?
    var island : Island?
    var clouds : [Cloud] = []
    
    override func sceneDidLoad() {
        name = "GAME"
        //add the first ocean to the scene
        ocean1 = Ocean()
        ocean1?.Reset()
        addChild(ocean1!)
        
        //add the second ocean to the scene
        ocean2 = Ocean()
        ocean2?.position.y = -773
        addChild(ocean2!)
        
        //add the player to the scene
        player = Player()
        addChild(player!)
        
        //add the island to the scene
        island = Island()
        addChild(island!)
        
        //add 3 clouds to the scene
        for _ in 0...2 {
            let cloud = Cloud()
            clouds.append(cloud)
            addChild(cloud)
        }
        
        //Engine sound - Background noise/ Music
        let engineSound = SKAudioNode(fileNamed: "engine.mp3")
        addChild(engineSound)
        engineSound.autoplayLooped = true
        //engineSound.run(SKAction.changeVolume(to: 0.5, duration: 0))
        
        //preload or prewarm impulse sounds
        do {
            let sounds: [String] = ["thunder", "yay"]
            for sound in sounds
            {
                let path: String = Bundle.main.path(forResource: sound, ofType: "mp3") ?? "mp3"
                let url:URL = URL(fileURLWithPath: path)
                let avPlayer: AVAudioPlayer = try AVAudioPlayer(contentsOf: url)
                avPlayer.prepareToPlay()
                //avPlayer.setVolume(0.5, fadeDuration: 0)
            }
        }
        catch {
            
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
        player?.TouchMove(newPos: CGPoint(x:pos.x, y:-495))
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        player?.TouchMove(newPos: CGPoint(x:pos.x, y:-495))
    }
    
    func touchUp(atPoint pos : CGPoint) {
        player?.TouchMove(newPos: CGPoint(x:pos.x, y:-495))
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
        ocean1?.Update()
        ocean2?.Update()
        player?.Update()
        island?.Update()
        
        CollisionManager.SquaredRadiusCheck(scene: self, object1: player!, object2: island!)
        
        //update each cloud in the clouds array
        for cloud in clouds {
            cloud.Update()
            CollisionManager.SquaredRadiusCheck(scene: self, object1: player!, object2: cloud)
        }
    }
}
