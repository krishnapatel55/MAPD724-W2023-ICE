//
//  GameViewController.swift
//  MAPD724-W2023-ICE1
//
//  Created by Kisu on 2023-01-18.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    //Instance Variables
    var currentScene: GKScene?
    
    @IBOutlet weak var LivesLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var StartLabel: UILabel!
    @IBOutlet weak var StartButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentStartScene()
    
        CollisionManager.gameViewController = self
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func updateLivesLabel(){
        LivesLabel.text = "Lives: \(ScoreManager.Lives)"
    }
    
    func updateScoreLabel(){
        ScoreLabel.text = "Score: \(ScoreManager.Score)"
    }
    
    func setScene(sceneName: String) -> Void {
        currentScene = GKScene(fileNamed: sceneName)
        // Get the SKScene from the loaded GKScene
        if let scene = currentScene!.rootNode as! SKScene? {
            
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .aspectFill
            
            // Present the scene
            if let view = self.view as! SKView? {
                view.presentScene(scene)
                view.ignoresSiblingOrder = true
            }
        }
    }
    
    func presentStartScene() {
        ScoreLabel.isHidden = true
        LivesLabel.isHidden = true
        StartLabel.isHidden = false
        StartButton.isHidden = false
        setScene(sceneName: "StartScene")
    }
    
    func presentEndScene() {
        
    }
    
    @IBAction func StartButtonPressed(_ sender: UIButton) {
        ScoreLabel.isHidden = false
        LivesLabel.isHidden = false
        StartLabel.isHidden = true
        StartButton.isHidden = true
        
        //initialize the Lives and Score
        ScoreManager.Score = 0
        ScoreManager.Lives = 5
        updateLivesLabel()
        updateScoreLabel()
        
        setScene(sceneName: "GameScene")
    }
    
}
