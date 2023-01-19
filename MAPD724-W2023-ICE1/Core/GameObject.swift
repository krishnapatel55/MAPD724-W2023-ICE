//
//  GameObject.swift
//  MAPD724-W2023-ICE1
//
//  Created by Kisu on 2023-01-18.
//

import GameplayKit
import SpriteKit

class GameObject : SKSpriteNode, GameProtocol {
    
    //public instance members
    var horizontalSpeed: CGFloat?
    var verticleSpeed: CGFloat?
    var width: CGFloat?
    var height: CGFloat?
    var halfWidth: CGFloat?
    var halfHeight: CGFloat?
    var scale: CGFloat?
    var isColliding: Bool?
    var randomSource: GKARC4RandomSource?
    var randomDist: GKRandomDistribution?
    
    //Constructor / Initializer
    init(imageString: String, initialScale: CGFloat) {
        //initialize the game object with an image
        let texture = SKTexture(imageNamed: imageString)
        let color = UIColor.clear
        super.init(texture: texture, color: color, size: texture.size())
        
        //configuration
        scale = initialScale
        setScale(scale!)
        width = texture.size().width * scale!
        height = texture.size().width * scale!
        halfWidth = width! * 0.5
        halfHeight = height! * 0.5
        isColliding = false
        name = imageString
        randomSource = GKARC4RandomSource()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //LifeCycle Functions
    func Start() {
        <#code#>
    }
    
    func Update() {
        <#code#>
    }
    
    func CheckBounds() {
        <#code#>
    }
    
    func Reset() {
        <#code#>
    }
}
