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
        
        physicsWorld.contactDelegate = self
        
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
        
        checkPhysics()
    }
    
    private func createWorld() {
        guard let scene = scene else { fatalError() }
        
        let sceneHeight: CGFloat = scene.size.height
        let sceneWidth: CGFloat = sceneHeight * (CGFloat(16) / CGFloat(9))
        
        let wallFloor = Wall(imageName: "floor")
        let wallFloorWidth = wallFloor.component(ofType: SpriteComponent.self)!.spriteNode.size.width
        var floorAccu: CGFloat = 0
        while floorAccu < (sceneWidth + wallFloorWidth + 10) {
            let wall = Wall(imageName: "floor")
            entityManager.add(entity: wall)
            wall.component(ofType: SpriteComponent.self)?.spriteNode.position.x = floorAccu
            floorAccu += wallFloorWidth
        }

        let wallCeiling = Wall(imageName: "ceiling")
        let wallCeilingWidth = wallCeiling.component(ofType: SpriteComponent.self)!.spriteNode.size.width
        var ceilingAccu: CGFloat = 0
        while ceilingAccu < (sceneWidth + wallCeilingWidth + 10) {
            let wall = Wall(imageName: "ceiling")
            entityManager.add(entity: wall)
            wall.component(ofType: SpriteComponent.self)?.spriteNode.position.y = sceneHeight
            wall.component(ofType: SpriteComponent.self)?.spriteNode.position.x = ceilingAccu
            ceilingAccu += wallCeilingWidth
        }
        
        let wallLeft = Wall(imageName: "wallLeft")
        let wallLeftHeight = wallLeft.component(ofType: SpriteComponent.self)!.spriteNode.size.height
        var leftAccu: CGFloat = 0
        while leftAccu < (sceneHeight + wallLeftHeight + 10) {
            let wall = Wall(imageName: "wallLeft")
            entityManager.add(entity: wall)
            wall.component(ofType: SpriteComponent.self)?.spriteNode.position.y = leftAccu
            leftAccu += wallLeftHeight
        }
        
        let wallRight = Wall(imageName: "wallRight")
        let wallRightHeight = wallRight.component(ofType: SpriteComponent.self)!.spriteNode.size.height
        var rightAccu: CGFloat = 0
        while rightAccu < (sceneHeight + wallRightHeight + 10) {
            let wall = Wall(imageName: "wallRight")
            entityManager.add(entity: wall)
            wall.component(ofType: SpriteComponent.self)?.spriteNode.position.x = sceneWidth
            wall.component(ofType: SpriteComponent.self)?.spriteNode.position.y = rightAccu
            rightAccu += wallRightHeight
        }
        
        for _ in 1 ... 1 {
            let box = Box()
            box.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: 120, y: 80)
            entityManager.add(entity: box)
        }
        
        let gosmito = Hero()
        gosmito.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: 80, y: 80)
        entityManager.add(entity: gosmito)
        
        let exit = Exit()
        exit.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: 200, y: 200)
        exit.component(ofType: SpriteComponent.self)?.spriteNode.zPosition = CGFloat(-1)
        entityManager.add(entity: exit)
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
        
        if contact.bodyA.node?.name == "player1" || contact.bodyB.node?.name == "player1" {
            print("\n\n\n\n====================================================================================")
            print("hero contact")
            checkPhysics()
        }
    }
}

extension GameScene {
    func checkPhysics() {
        
        // Create an array of all the nodes with physicsBodies
        var physicsNodes = [SKNode]()
        
        //Get all physics bodies
        enumerateChildNodes(withName: "//.") { node, _ in
            if let _ = node.physicsBody {
                physicsNodes.append(node)
            } else {
                print("\(node.name) does not have a physics body so cannot collide or be involved in contacts.")
            }
        }
        
        //For each node, check it's category against every other node's collion and contctTest bit mask
        for node in physicsNodes {
            let category = node.physicsBody!.categoryBitMask
            // Identify the node by its category if the name is blank
            let name = node.name != nil ? node.name : "Category \(category)"
            let collisionMask = node.physicsBody!.collisionBitMask
            let contactMask = node.physicsBody!.contactTestBitMask
            
            // If all bits of the collisonmask set, just say it collides with everything.
            if collisionMask == UInt32.max {
                print("\(name) collides with everything")
            }
            
            for otherNode in physicsNodes {
                if (node != otherNode) && (node.physicsBody?.isDynamic == true) {
                    let otherCategory = otherNode.physicsBody!.categoryBitMask
                    // Identify the node by its category if the name is blank
                    let otherName = otherNode.name != nil ? otherNode.name : "Category \(otherCategory)"
                    
                    // If the collisonmask and category match, they will collide
                    if ((collisionMask & otherCategory) != 0) && (collisionMask != UInt32.max) {
                        print("\(name) collides with \(otherName)")
                    }
                    // If the contactMAsk and category match, they will contact
                    if (contactMask & otherCategory) != 0 {print("\(name) notifies when contacting \(otherName)")}
                }
            }
        }
    }
}
