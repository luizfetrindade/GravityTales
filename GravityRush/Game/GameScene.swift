//
//  GameScene.swift
//  GravityRush
//
//  Created by Luiz Felipe Trindade on 24/07/19.
//  Copyright © 2019 Luiz Felipe Trindade. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreMotion

final class GameScene: SKScene {
    
    var lastTime: TimeInterval = 0.0
    
    lazy var entityManager = EntityManager(scene: world)
    
    var world: SKNode = SKNode()
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        addChild(world)
        
        let swipeRight : UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(GameScene.swipedRight))
        let swipeLeft : UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(GameScene.swipedLeft))
        let swipeUp : UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(GameScene.swipedUp))
        let swipeDown : UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(GameScene.swipedDown))
        
        swipeLeft.direction = .left
        swipeRight.direction = .right
        swipeUp.direction = .up
        swipeDown.direction = .down
        
        view.addGestureRecognizer(swipeRight)
        view.addGestureRecognizer(swipeLeft)
        view.addGestureRecognizer(swipeUp)
        view.addGestureRecognizer(swipeDown)
    }
        
        
        @objc func swipedRight(sender: UISwipeGestureRecognizer, x: CGFloat, y: CGFloat, z: CGFloat) {
            self.physicsWorld.gravity.dx = 1.5
            self.physicsWorld.gravity.dy = 0.0
//            self.player.zRotation = CGFloat(Double.pi/2)
        }
        
        @objc func swipedLeft(sender: UISwipeGestureRecognizer) {
            self.physicsWorld.gravity.dx = -1.5
            self.physicsWorld.gravity.dy = 0.0
//            self.player.zRotation = -CGFloat(Double.pi/2)
        }
        
        @objc func swipedUp(sender: UISwipeGestureRecognizer) {
            self.physicsWorld.gravity.dx = 0.0
            self.physicsWorld.gravity.dy = 1.5
//            self.player.zRotation = -CGFloat(Double.pi)
        }
        
        @objc func swipedDown(sender: UISwipeGestureRecognizer) {
            self.physicsWorld.gravity.dx = 0.0
            self.physicsWorld.gravity.dy = -1.5
//            self.player.zRotation = 0.0
        }
    
    
    override func update(_ currentTime: TimeInterval) {
        if lastTime != 0.0 { entityManager.update(with: currentTime - lastTime) }
        lastTime = currentTime
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
}
