//
//  GameScene.swift
//  GravityRush
//
//  Created by Luiz Felipe Trindade on 24/07/19.
//  Copyright © 2019 Luiz Felipe Trindade. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var lastTime: TimeInterval = 0.0
    
    lazy var entityManager: EntityManager = EntityManager(scene: self)
    
    var touched:Bool = false
    var location = CGPoint.zero
    var gosmito: Hero?
    var timeOffset: TimeInterval = 0.0
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        physicsWorld.contactDelegate = self
        self.physicsWorld.gravity.dy = -1.5
        
        scene?.anchorPoint = CGPoint(x: 0, y: 0)
        
        createWorld()
        createLevel()
        
        self.physicsBody = SKPhysicsBody.init(edgeLoopFrom: self.frame)
        
        let swipeRight : UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(GameScene.swipedRight))
        let swipeLeft : UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(GameScene.swipedLeft))
        let swipeUp : UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(GameScene.swipedUp))
        let swipeDown : UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(GameScene.swipedDown))
        
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(GameScene.taped))
        tap.numberOfTapsRequired = 1
        
        let longPress : UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(GameScene.handleLongPress))
        
        longPress.delegate = self
//        tap.delegate = self
        
        swipeLeft.direction = .left
        swipeRight.direction = .right
        swipeUp.direction = .up
        swipeDown.direction = .down
    
        view.addGestureRecognizer(longPress)
        view.addGestureRecognizer(tap)
        
        view.addGestureRecognizer(swipeRight)
        view.addGestureRecognizer(swipeLeft)
        view.addGestureRecognizer(swipeUp)
        view.addGestureRecognizer(swipeDown)
    }
    
    private func createWorld() {
        guard let scene = scene else { fatalError() }
        
        scene.backgroundColor = #colorLiteral(red: 0.4391688704, green: 0.4392459095, blue: 0.3695387244, alpha: 1)
        
//        let background = SKSpriteNode(imageNamed: "background")
//        background.anchorPoint = CGPoint(x: 0, y: 0)
//        background.position = CGPoint(x: 0, y: 0)
//        background.zPosition = CGFloat(-1)
//        scene.addChild(background)
        
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
        
        
    }
    
    public func createLevel() {
        guard let scene = scene else { fatalError() }

//        for _ in 1 ... 15 {
//            let box = Box()
//            box.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: 120, y: 80)
//            entityManager.add(entity: box)
//        }

        let sceneHeight: CGFloat = scene.size.height
        let sceneWidth: CGFloat = sceneHeight * (CGFloat(16) / CGFloat(9))
        
        let wall = Wall(imageName: "wallVertical", hasPhysicsBody: true)
        entityManager.add(entity: wall)
        wall.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: sceneWidth/2, y: wall.component(ofType: SpriteComponent.self)!.spriteNode.size.height/2)

        
        let exit = Exit()
        exit.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: universalUnit(14.5), y: universalUnit(1.5))
        exit.component(ofType: SpriteComponent.self)?.spriteNode.zPosition = CGFloat(-0.999)
        entityManager.add(entity: exit)
    }
    
//    @objc func longPressed(sender: UILongPressGestureRecognizer) {
//        print("long")
//    }
    
    @objc func handleLongPress(gestureReconizer: UILongPressGestureRecognizer) {
        if gestureReconizer.state != UIGestureRecognizer.State.ended {
            touched = true
            location = gestureReconizer.location(in: self.view)
            print("long true")
        }
        else {
           touched = false
            print("long false")
        }
    }
    
    @objc func taped(sender: UITapGestureRecognizer){
        if touched {
            gosmito?.component(ofType: JumpComponent.self)?.jump()
            print("jump")
        }
    }
    
    @objc func swipedRight(sender: UISwipeGestureRecognizer) {
        self.physicsWorld.gravity.dx = 1.5
        self.physicsWorld.gravity.dy = 0.0
        gosmito?.component(ofType: RotationComponent.self)?.rotate(direction: "right")
        touched = false
    }
    
    @objc func swipedLeft(sender: UISwipeGestureRecognizer) {
        self.physicsWorld.gravity.dx = -1.5
        self.physicsWorld.gravity.dy = 0.0
        gosmito?.component(ofType: RotationComponent.self)?.rotate(direction: "left")
        touched = false
    }
    
    @objc func swipedUp(sender: UISwipeGestureRecognizer) {
        self.physicsWorld.gravity.dx = 0.0
        self.physicsWorld.gravity.dy = 1.5
        gosmito?.component(ofType: RotationComponent.self)?.rotate(direction: "up")
        touched = false
    }
    
    @objc func swipedDown(sender: UISwipeGestureRecognizer) {
        self.physicsWorld.gravity.dx = 0.0
        self.physicsWorld.gravity.dy = -1.5
        gosmito?.component(ofType: RotationComponent.self)?.rotate(direction: "down")
        touched = false
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        if lastTime != 0.0 {
            timeOffset = currentTime - lastTime
            entityManager.update(with: currentTime - lastTime)
        }
        lastTime = currentTime
        
        if (touched) {
            moveNodeToLocation(pos: location)
        }
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        touched = true
//        print("tapped")
//        for touch in touches {
//            location = touch.location(in: self)
//        }
//    }
    
//    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//        touched = false
//    }
    
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        touched = true
//        for touch in touches {
//            location = touch.location(in: self)
//        }
//    }
    
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        // Stop node from moving to touch
//        print("ended")
//        touched = false
//    }
//
    func moveNodeToLocation(pos : CGPoint) {
        if self.physicsWorld.gravity.dx.isZero {
            if pos.x < 380 {
                gosmito?.component(ofType: MoveComponent.self)?.move(timeOffset: timeOffset, direction: "right")
            } else {
                gosmito?.component(ofType: MoveComponent.self)?.move(timeOffset: timeOffset, direction: "left")
            }
        } else if pos.y < 200 {
            gosmito?.component(ofType: MoveComponent.self)?.move(timeOffset: timeOffset, direction: "down")
        } else {
            gosmito?.component(ofType: MoveComponent.self)?.move(timeOffset: timeOffset, direction: "up")
        }
    }
}

extension GameScene: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    
//    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRequireFailureOf otherGestureRecognizer: UIGestureRecognizer) -> Bool {
//
//    }
}

extension GameScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        
        if contact.bodyA.node?.name == "spikes" || contact.bodyB.node?.name == "spikes" {
            let scene = MenuScene(size: self.view!.bounds.size)
            scene.congratsLabel.text = "you failed all who trusted in you"
            scene.startLabel.text = "Try level 1 again"
            scene.scaleMode = .aspectFit
            scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            let transition = SKTransition.crossFade(withDuration: 2.0)
            self.view?.presentScene(scene, transition: transition)
            return
        }
        else if contact.bodyA.node?.name == "player1" || contact.bodyB.node?.name == "player1" {
            let scene = MenuScene(size: self.view!.bounds.size)
            scene.congratsLabel.text = "Congrats dog"
            scene.startLabel.text = "Go to level 2"
            scene.scaleMode = .aspectFit
            scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            let transition = SKTransition.crossFade(withDuration: 2.0)
            self.view?.presentScene(scene, transition: transition)
            return
        }
    }
}

