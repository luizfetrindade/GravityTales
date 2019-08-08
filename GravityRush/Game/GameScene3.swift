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

final class GameScene3: GameScene {
    var lock: Lock?
    var button: Button?
    
    override func createLevel() {
        guard let scene = scene else { fatalError() }
        
//        let wall_1 = Wall(imageName: "wallSection", hasPhysicsBody: true)
//        entityManager.add(entity: wall_1)
//        wall_1.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: universalUnit(4), y: universalUnit(0))

        let wall_2 = Wall(imageName: "wallSection", hasPhysicsBody: true)
        entityManager.add(entity: wall_2)
        wall_2.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: universalUnit(5), y: universalUnit(1))
        
        let spikeLeft1 = Spike(imageName: "spikesPLEFT")
        entityManager.add(entity: spikeLeft1)
        spikeLeft1.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: universalUnit(4) + 15, y: universalUnit(1) + 8)
        
        let wall_3 = Wall(imageName: "wallSection", hasPhysicsBody: true)
        entityManager.add(entity: wall_3)
        wall_3.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: universalUnit(6), y: universalUnit(2))
        
        let spikeLeft2 = Spike(imageName: "spikesPLEFT")
        entityManager.add(entity: spikeLeft2)
        spikeLeft2.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: universalUnit(5) + 15, y: universalUnit(2) + 8)
        
        let wall_8 = Wall(imageName: "wallSection", hasPhysicsBody: true)
        entityManager.add(entity: wall_8)
        wall_8.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: universalUnit(6), y: universalUnit(1))
        
        let wall_14 = Wall(imageName: "wallSection", hasPhysicsBody: true)
        entityManager.add(entity: wall_14)
        wall_14.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: universalUnit(7), y: universalUnit(1))
        
        let wall_15 = Wall(imageName: "wallSection", hasPhysicsBody: true)
        entityManager.add(entity: wall_15)
        wall_15.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: universalUnit(7), y: universalUnit(2))

        let wall_16 = Wall(imageName: "wallSection", hasPhysicsBody: true)
        entityManager.add(entity: wall_16)
        wall_16.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: universalUnit(8), y: universalUnit(1))
        
        let wall_17 = Wall(imageName: "wallSection", hasPhysicsBody: true)
        entityManager.add(entity: wall_17)
        wall_17.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: universalUnit(8), y: universalUnit(2))
        
        let wall_18 = Wall(imageName: "wallSection", hasPhysicsBody: true)
        entityManager.add(entity: wall_18)
        wall_18.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: universalUnit(11), y: universalUnit(3))
        
        let wall_19 = Wall(imageName: "wallSection", hasPhysicsBody: true)
        entityManager.add(entity: wall_19)
        wall_19.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: universalUnit(11), y: universalUnit(2.75))
        
        let wall_4 = Wall(imageName: "wallSection", hasPhysicsBody: true)
        entityManager.add(entity: wall_4)
        wall_4.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: universalUnit(7), y: universalUnit(3))
        
        let spikeLeft3 = Spike(imageName: "spikesPLEFT")
        entityManager.add(entity: spikeLeft3)
        spikeLeft3.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: universalUnit(6) + 15, y: universalUnit(3) + 8)
        
        let wall_5 = Wall(imageName: "wallSection", hasPhysicsBody: true)
        entityManager.add(entity: wall_5)
        wall_5.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: universalUnit(8), y: universalUnit(3))
        
        let wall_6 = Wall(imageName: "wallSection", hasPhysicsBody: true)
        entityManager.add(entity: wall_6)
        wall_6.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: universalUnit(9), y: universalUnit(3))
        
        let button = Button()
        entityManager.add(entity: button)
        button.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: universalUnit(9.5), y: universalUnit(2) + 12)
        self.button = button
        
        let wall_7 = Wall(imageName: "wallSection", hasPhysicsBody: true)
        entityManager.add(entity: wall_7)
        wall_7.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: universalUnit(10), y: universalUnit(3))
        
        let wall_9 = Wall(imageName: "wallSection", hasPhysicsBody: true)
        entityManager.add(entity: wall_9)
        wall_9.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: universalUnit(9), y: universalUnit(8))
        
        let wall_10 = Wall(imageName: "wallSection", hasPhysicsBody: true)
        entityManager.add(entity: wall_10)
        wall_10.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: universalUnit(9), y: universalUnit(7))
        
        let wall_11 = Wall(imageName: "wallSection", hasPhysicsBody: true)
        entityManager.add(entity: wall_11)
        wall_11.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: universalUnit(9), y: universalUnit(6))
        
        let wall_12 = Wall(imageName: "wallSection", hasPhysicsBody: true)
        entityManager.add(entity: wall_12)
        wall_12.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: universalUnit(10), y: universalUnit(6))
        
        let wall_13 = Wall(imageName: "wallSection", hasPhysicsBody: true)
        entityManager.add(entity: wall_13)
        wall_13.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: universalUnit(11), y: universalUnit(6))
        
        var accu: CGFloat = 0
        
        for _ in 1 ... 11 {
            let spikeDown = Spike(imageName: "spikesPDOWN")
            let spikeWith = spikeDown.component(ofType: SpriteComponent.self)!.spriteNode.size.width + 1.5
            entityManager.add(entity: spikeDown)
            spikeDown.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: universalUnit(1) + 5 + accu + 1.5, y: universalUnit(8) + 15)
            accu += spikeWith
        }
        
        let spikeDown = Spike(imageName: "spikesPDOWN")
        let spikeWith = spikeDown.component(ofType: SpriteComponent.self)?.spriteNode.size.width
        entityManager.add(entity: spikeDown)
        spikeDown.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: universalUnit(1) + 5, y: universalUnit(8) + 15)
        
        for _ in 1 ... 1 {
            let box = Box()
            entityManager.add(entity: box)
            box.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: universalUnit(11), y: universalUnit(7.5))
        }
        
        let lock = Lock()
        entityManager.add(entity: lock)
        lock.setPosition(CGPoint(x: universalUnit(1.7), y: universalUnit(7.2)))
        self.lock = lock
        
        let exit = Exit()
        exit.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: universalUnit(1.7), y: universalUnit(7.2))
        exit.component(ofType: SpriteComponent.self)?.spriteNode.zPosition = CGFloat(-0.999)
        entityManager.add(entity: exit)
    }
    
    override func didBegin(_ contact: SKPhysicsContact) {
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        
        if contact.bodyA.node?.name == "buttonOFF" || contact.bodyB.node?.name == "buttonOFF" {
            button?.turnOn(3)
            lock!.open()
        }
        else if (contact.bodyA.node?.name == "player1" || contact.bodyB.node?.name == "player1") && !lock!.nodeOpen.isHidden {
            let scene = MenuScene(size: self.view!.bounds.size)
            scene.congratsLabel.text = "Congrats dog"
            scene.startLabel.text = "Level 2"
            scene.scaleMode = .aspectFit
            scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            let transition = SKTransition.crossFade(withDuration: 2.0)
            self.view?.presentScene(scene, transition: transition)
            return
        }
        
        if contact.bodyA.node!.name!.contains("spikes") || contact.bodyB.node!.name!.contains("spikes") {
            let scene = MenuScene(size: self.view!.bounds.size)
            scene.congratsLabel.text = "you failed all who trusted in you"
            scene.startLabel.text = "Try again"
            scene.scaleMode = .aspectFit
            scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            let transition = SKTransition.crossFade(withDuration: 2.0)
            self.view?.presentScene(scene, transition: transition)
            return
        }
    }
    
    func didEnd(_ contact: SKPhysicsContact) {
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        
        if contact.bodyA.node?.name == "buttonOFF" || contact.bodyB.node?.name == "buttonOFF" {
            button?.turnOff(3)
            lock!.lock()
        }
    }
}
