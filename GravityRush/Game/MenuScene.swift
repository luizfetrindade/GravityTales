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
    var congratsLabel = SKLabelNode(text: "")
    var startLabel = SKLabelNode(text: "Start")
    
    override func didMove(to view: SKView) {
        
        startButton.position = CGPoint(x: 0, y: 0)
        self.addChild(startButton)
        
        startButton.size = CGSize(width: startButton.size.width+100, height: startButton.size.height)
        
        congratsLabel.color = .black
        congratsLabel.position = CGPoint(x: startLabel.position.x, y: startLabel.position.y + 100)
        self.addChild(congratsLabel)
        
        startLabel.color = .black
        startLabel.position = startButton.position
        startButton.addChild(startLabel)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if startButton.contains(location) {
                if startLabel.text == "Try again" {
                    let scene = GameScene2(size: self.view!.bounds.size)
                    let transition = SKTransition.crossFade(withDuration: 2.0)
                    self.view?.presentScene(scene, transition: transition)
                    return
                }
                else if startLabel.text == "Level 2" {
                    let scene = GameScene2(size: self.view!.bounds.size)
                    let transition = SKTransition.crossFade(withDuration: 2.0)
                    self.view?.presentScene(scene, transition: transition)
                    return
                }
                else {
                    let scene = GameScene2(size: self.view!.bounds.size)
                    let transition = SKTransition.crossFade(withDuration: 2.0)
                    self.view?.presentScene(scene, transition: transition)
                    return
                }
            }
        }
    }
    
}
