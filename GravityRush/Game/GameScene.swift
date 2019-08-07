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
    
    var lastTime: TimeInterval = 0.0
    
    lazy var entityManager: EntityManager = EntityManager(scene: self)
    
    var gosmito: Hero?

    override func didMove(to view: SKView) {
        super.didMove(to: view)
//        self.view?.showsPhysics = true
        physicsWorld.contactDelegate = self
        
        scene?.anchorPoint = CGPoint(x: 0, y: 0)
        
        createWorld()
        createLevel()
        
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
        
        let sceneHeight: CGFloat = scene.size.height
        let sceneWidth: CGFloat = sceneHeight * (CGFloat(16) / CGFloat(9))
        
        let offset = ((scene.size.width - sceneWidth) / 2) / scene.size.width
        
        if offset > 0 {
            scene.anchorPoint = CGPoint(x: offset, y: 0)
        }
        
        let wallFloor = Wall(imageName: "boundaryBottomWall", hasPhysicsBody: true)
        entityManager.add(entity: wallFloor)
        wallFloor.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: sceneWidth/2, y: 0)
        
//        let wallFloorWidth = wallFloor.component(ofType: SpriteComponent.self)!.spriteNode.size.width
//        var floorAccu: CGFloat = 0
//        while floorAccu < (sceneWidth + wallFloorWidth + 10) {
//            let wall = Wall(imageName: "floor", hasPhysicsBody: false)
//            entityManager.add(entity: wall)
//            wall.component(ofType: SpriteComponent.self)?.spriteNode.position.x = floorAccu
//            floorAccu += wallFloorWidth
//        }

        let wallCeiling = Wall(imageName: "boundaryTopWall", hasPhysicsBody: true)
        entityManager.add(entity: wallCeiling)
        wallCeiling.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: sceneWidth/2, y: sceneHeight)
        
//        let wallCeilingWidth = wallCeiling.component(ofType: SpriteComponent.self)!.spriteNode.size.width
//        var ceilingAccu: CGFloat = 0
//        while ceilingAccu < (sceneWidth + wallCeilingWidth + 10) {
//            let wall = Wall(imageName: "ceiling", hasPhysicsBody: false)
//            entityManager.add(entity: wall)
//            wall.component(ofType: SpriteComponent.self)?.spriteNode.position.y = sceneHeight
//            wall.component(ofType: SpriteComponent.self)?.spriteNode.position.x = ceilingAccu
//            ceilingAccu += wallCeilingWidth
//        }
        
        let wallLeft = Wall(imageName: "boundaryLeftWall", hasPhysicsBody: true)
        entityManager.add(entity: wallLeft)
        wallLeft.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: 0, y: sceneHeight/2)
        
//        let wallLeftHeight = wallLeft.component(ofType: SpriteComponent.self)!.spriteNode.size.height
//        var leftAccu: CGFloat = 0
//        while leftAccu < (sceneHeight + wallLeftHeight + 10) {
//            let wall = Wall(imageName: "wallLeft", hasPhysicsBody: false)
//            entityManager.add(entity: wall)
//            wall.component(ofType: SpriteComponent.self)?.spriteNode.position.y = leftAccu
//            leftAccu += wallLeftHeight
//        }

        let wallRight = Wall(imageName: "boundaryRightWall", hasPhysicsBody: true)
        entityManager.add(entity: wallRight)
        wallRight.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: sceneWidth, y: sceneHeight/2)
        
//        let wallRightHeight = wallRight.component(ofType: SpriteComponent.self)!.spriteNode.size.height
//        var rightAccu: CGFloat = 0
//        while rightAccu < (sceneHeight + wallRightHeight + 10) {
//            let wall = Wall(imageName: "wallRight", hasPhysicsBody: false)
//            entityManager.add(entity: wall)
//            wall.component(ofType: SpriteComponent.self)?.spriteNode.position.x = sceneWidth
//            wall.component(ofType: SpriteComponent.self)?.spriteNode.position.y = rightAccu
//            rightAccu += wallRightHeight
//        }
        
        let gosmito = Hero()
        gosmito.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: 80, y: 80)
        entityManager.add(entity: gosmito)
        self.gosmito = gosmito
        
        let exit = Exit()
        exit.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: 660, y: 80)
        exit.component(ofType: SpriteComponent.self)?.spriteNode.zPosition = CGFloat(-1)
        entityManager.add(entity: exit)
    }
    
    public func createLevel() {
        guard let scene = scene else { fatalError() }
        
        for _ in 1 ... 15 {
            let box = Box()
            box.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: 120, y: 80)
            entityManager.add(entity: box)
        }

        let sceneHeight: CGFloat = scene.size.height
        let sceneWidth: CGFloat = sceneHeight * (CGFloat(16) / CGFloat(9))
        
        let wall = Wall(imageName: "wallVertical", hasPhysicsBody: true)
        entityManager.add(entity: wall)
        wall.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: sceneWidth/2, y: wall.component(ofType: SpriteComponent.self)!.spriteNode.size.height/2)
        
    }
        
    
    @objc func swipedRight(sender: UISwipeGestureRecognizer, x: CGFloat, y: CGFloat, z: CGFloat) {
        self.physicsWorld.gravity.dx = 1.5
        self.physicsWorld.gravity.dy = 0.0
        gosmito?.component(ofType: RotationComponent.self)?.rotate(direction: "right")
    }
    
    @objc func swipedLeft(sender: UISwipeGestureRecognizer) {
        self.physicsWorld.gravity.dx = -1.5
        self.physicsWorld.gravity.dy = 0.0
        gosmito?.component(ofType: RotationComponent.self)?.rotate(direction: "left")

    }
    
    @objc func swipedUp(sender: UISwipeGestureRecognizer) {
        self.physicsWorld.gravity.dx = 0.0
        self.physicsWorld.gravity.dy = 1.5
        gosmito?.component(ofType: RotationComponent.self)?.rotate(direction: "up")

    }
    
    @objc func swipedDown(sender: UISwipeGestureRecognizer) {
        self.physicsWorld.gravity.dx = 0.0
        self.physicsWorld.gravity.dy = -1.5
        gosmito?.component(ofType: RotationComponent.self)?.rotate(direction: "down")

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
        
        if contact.bodyA.node?.name == "sphere" || contact.bodyB.node?.name == "sphere" {
            let scene = MenuScene(size: self.view!.bounds.size)
            scene.congratsLabel.text = "you failed all who trusted in you"
            scene.startLabel.text = "Try again"
            scene.scaleMode = .aspectFit
            scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            let transition = SKTransition.crossFade(withDuration: 2.0)
            self.view?.presentScene(scene, transition: transition)
            return
        }
        else if contact.bodyA.node?.name == "player1" || contact.bodyB.node?.name == "player1" {
            let scene = MenuScene(size: self.view!.bounds.size)
            scene.congratsLabel.text = "Congrats dog"
            scene.startLabel.text = "Level 2"
            scene.scaleMode = .aspectFit
            scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            let transition = SKTransition.crossFade(withDuration: 2.0)
            self.view?.presentScene(scene, transition: transition)
            return
        }
    }
}

