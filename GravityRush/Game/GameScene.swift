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

class GameScene: SKScene {
    private var label : SKLabelNode?
    //    private var spinnyNode : SKShapeNode?
    
    let player = SKSpriteNode(imageNamed: "player1")
    let floor = SKSpriteNode(imageNamed: "floor")
    let box = SKSpriteNode(imageNamed: "box")
    
    let motionManager = CMMotionManager()
    var previousTime: TimeInterval = 0.0
    
    
    override func didMove(to view: SKView) {
//        let all = SKScene(fileNamed: "Storage")!
        let storage = SKScene(fileNamed: "Storage")!
        let floor = storage.childNode(withName: "floor")!.copy() as! SKNode
        
        let playerAnimation: SKAction
        var textures: [SKTexture] = []
        
        for i in 1...3 {
            textures.append(SKTexture(imageNamed: "player\(i)"))
        }
        //        textures.append(textures[2])
        //        textures.append(textures[1])
        //        playerAnimation = SKAction.animate(with: textures, timePerFrame: 0.1)
        playerAnimation = SKAction.animate(with: textures, timePerFrame: 0.2, resize: true, restore: true)
        
        self.physicsBody = SKPhysicsBody.init(edgeLoopFrom: self.frame)
        
        backgroundColor = SKColor.darkGray
        
        player.position = CGPoint(x: size.width * 0.01, y: size.height * 0.1)
        floor.position = CGPoint(x: size.width * 0.0, y: size.height * 0.0)
        box.position = CGPoint(x: size.width * 0.05, y: size.height * 0.05)
        
        player.run(SKAction.repeatForever(playerAnimation))
        
        player.setScale(4.0)
        box.setScale(4.0)
        floor.setScale(2.0)
        
        player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        box.physicsBody = SKPhysicsBody(rectangleOf: box.size)
        
        player.physicsBody?.restitution = 0.0
        box.physicsBody?.restitution = 0.0
        floor.physicsBody?.restitution = 0.0
        
        motionManager.startGyroUpdates()
        motionManager.startMagnetometerUpdates()
        motionManager.startDeviceMotionUpdates()
        
        addChild(floor)
        addChild(player)
        addChild(box)
        
        
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
        self.player.zRotation = CGFloat(Double.pi/2)
        print("swipe Right")
    }
    
    @objc func swipedLeft(sender: UISwipeGestureRecognizer) {
        self.physicsWorld.gravity.dx = -1.5
        self.physicsWorld.gravity.dy = 0.0
        self.player.zRotation = -CGFloat(Double.pi/2)
        print("swipe Left")
    }
    
    @objc func swipedUp(sender: UISwipeGestureRecognizer) {
        self.physicsWorld.gravity.dx = 0.0
        self.physicsWorld.gravity.dy = 1.5
        self.player.zRotation = -CGFloat(Double.pi)
        print("swipe Up")
    }
    
    @objc func swipedDown(sender: UISwipeGestureRecognizer) {
        self.physicsWorld.gravity.dx = 0.0
        self.physicsWorld.gravity.dy = -1.5
        self.player.zRotation = 0.0
        print("swipe Down")
    }
    
    //
    //    func touchDown(atPoint pos : CGPoint) {
    //        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
    //            n.position = pos
    //            n.strokeColor = SKColor.green
    //            self.addChild(n)
    //        }
    //    }
    //
    //    func touchMoved(toPoint pos : CGPoint) {
    //        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
    //            n.position = pos
    //            n.strokeColor = SKColor.blue
    //            self.addChild(n)
    //        }
    //    }
    //
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    func move(timeOffset: TimeInterval) {
        //        if let deviceMotion = motionManager.deviceMotion {
        //
        //            //            player.position.x += CGFloat((motionManager.deviceMotion?.rotationRate.z ?? 0) * timeOffset * -100)
        //            if deviceMotion.attitude.yaw < -1.5 {
        //                player.position.x += CGFloat(50 * timeOffset)
        //                print(deviceMotion.attitude.yaw)
        //            }
        //        }
        motionManager.startDeviceMotionUpdates(to: OperationQueue.main) { (motion, error) in
            let motion = self.motionManager.deviceMotion
            let radians = atan2((motion?.gravity.x)!, (motion?.gravity.y)!) - .pi
            
            let degrees = radians * 180.0  / .pi
            
            if (-degrees > 95 && -degrees < 115) {
                self.player.position.x += CGFloat(80 * timeOffset)
                print("1", -degrees)
            } else if (-degrees > 55 && -degrees <= 85) {
                self.player.position.x += CGFloat(80 * timeOffset) * -1
                print("2", -degrees)
            }
            //            else if (-degrees >= 180 && -degrees < 205) {
            //                self.player.position.y -= CGFloat(50 * timeOffset)
            //                print("2", -degrees)
            //            } else if (-degrees >= 295 && -degrees < 300) {
            //                self.player.position.x += CGFloat(-50 * timeOffset)
            //                print("3", -degrees)
            //            } else if (-degrees >= 215 && -degrees < 305) {
            //                print("4", -degrees)
            ////                self.player.position.y += CGFloat(50 * timeOffset)
            //            }
        }
        
    }
    //
    //        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    //    }
    //
    //    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    //        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    //    }
    //
    //    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    //        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    //    }
    //
    //    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    //        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    //    }
    //
    //
    override func update(_ currentTime: TimeInterval) {
        if previousTime.isZero {
            previousTime = currentTime
        } else {
            let timeOffset = currentTime - previousTime
            previousTime = currentTime
            move(timeOffset: timeOffset)
        }
        
        //        print(motionManager.deviceMotion?.attitude.yaw)
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
