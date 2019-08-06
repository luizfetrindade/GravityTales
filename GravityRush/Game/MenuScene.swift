//
//  MenuScene.swift
//  GravityRush
//
//  Created by Fernando Locatelli Maioli on 05/08/19.
//  Copyright © 2019 Luiz Felipe Trindade. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreMotion

class MenuScene: SKScene {
    
    var startButton: SKSpriteNode = SKSpriteNode(color: UIColor.gray, size: CGSize(width: 100, height: 75))
    var isGoingToNextLevel = false
    
    override func didMove(to view: SKView) {
        
        startButton.position = CGPoint(x: 0, y: 0)
        self.addChild(startButton)
        
        if isGoingToNextLevel {
            startButton.size = CGSize(width: startButton.size.width+100, height: startButton.size.height)
            
            let startLabel = SKLabelNode(text: "Next Level")
            startLabel.color = .black
            startLabel.position = startButton.position
            startButton.addChild(startLabel)
            
            let congratsLabel = SKLabelNode(text: "Congrats dog")
            congratsLabel.color = .black
            congratsLabel.position = CGPoint(x: startLabel.position.x, y: startLabel.position.y + 100)
            self.addChild(congratsLabel)
        }
        else {
            let startLabel = SKLabelNode(text: "Start")
            startLabel.color = .black
            startLabel.position = startButton.position
            startButton.addChild(startLabel)
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if startButton.contains(location) {
                let scene = GameScene2(size: self.view!.bounds.size)
                let transition = SKTransition.crossFade(withDuration: 2.0)
                self.view?.presentScene(scene, transition: transition)
                return
            }
        }
    }
    
}
