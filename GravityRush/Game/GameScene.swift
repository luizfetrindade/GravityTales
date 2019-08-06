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
    
    lazy var entityManager: EntityManager = EntityManager(scene: self)

    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        scene?.anchorPoint = CGPoint(x: 0, y: 0)
        
        createWorld()
        
        self.physicsBody = SKPhysicsBody.init(edgeLoopFrom: self.frame)
        
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
    
    private func createWorld() {
        guard let scene = scene else { fatalError() }
        
        let height: CGFloat = scene.size.height
        let width: CGFloat = height * (CGFloat(16) / CGFloat(9))
        
        let wallHorizontal = Wall()
        let wallHorizontalWidth = wallHorizontal.component(ofType: SpriteComponent.self)!.spriteNode.size.width
        let wallHorizontalHeight = wallHorizontal.component(ofType: SpriteComponent.self)!.spriteNode.size.height
        
        var horizontalAccu: C = 0
        
        while horizontalAccu < (width + wallHorizontalWidth + 10) {
            <#code#>
        }
        
        
        
        let gosmito = Hero()
        gosmito.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: 50, y: 50)
        entityManager.add(entity: gosmito)
        
        
    }
        
    
    @objc func swipedRight(sender: UISwipeGestureRecognizer, x: CGFloat, y: CGFloat, z: CGFloat) {
        self.physicsWorld.gravity.dx = 1.5
        self.physicsWorld.gravity.dy = 0.0
    }
    
    @objc func swipedLeft(sender: UISwipeGestureRecognizer) {
        self.physicsWorld.gravity.dx = -1.5
        self.physicsWorld.gravity.dy = 0.0
    }
    
    @objc func swipedUp(sender: UISwipeGestureRecognizer) {
        self.physicsWorld.gravity.dx = 0.0
        self.physicsWorld.gravity.dy = 1.5
    }
    
    @objc func swipedDown(sender: UISwipeGestureRecognizer) {
        self.physicsWorld.gravity.dx = 0.0
        self.physicsWorld.gravity.dy = -1.5
    }

    
    override func update(_ currentTime: TimeInterval) {
        if lastTime != 0.0 { entityManager.update(with: currentTime - lastTime) }
        lastTime = currentTime
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
}

extension GameScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        
        
//        // 2
//        if ((firstBody.categoryBitMask & PhysicsCategory.monster != 0) &&
//            (secondBody.categoryBitMask & PhysicsCategory.projectile != 0)) {
//            if let monster = firstBody.node as? SKSpriteNode,
//                let projectile = secondBody.node as? SKSpriteNode {
//                projectileDidCollideWithMonster(projectile: projectile, monster: monster)
//            }
//        }
    }
}
