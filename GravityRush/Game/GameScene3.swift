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
    override func createLevel() {
        guard let scene = scene else { fatalError() }
        
//        let wall_1 = Wall(imageName: "wallSection", hasPhysicsBody: true)
//        entityManager.add(entity: wall_1)
//        wall_1.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: universalUnit(4), y: universalUnit(0))
//
        let wall_2 = Wall(imageName: "wallSection", hasPhysicsBody: true)
        entityManager.add(entity: wall_2)
        wall_2.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: universalUnit(5), y: universalUnit(1))
        
        let wall_3 = Wall(imageName: "wallSection", hasPhysicsBody: true)
        entityManager.add(entity: wall_3)
        wall_3.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: universalUnit(6), y: universalUnit(2))
        
        let wall_8 = Wall(imageName: "wallSection", hasPhysicsBody: true)
        entityManager.add(entity: wall_8)
        wall_8.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: universalUnit(6), y: universalUnit(1))
        
        let wall_4 = Wall(imageName: "wallSection", hasPhysicsBody: true)
        entityManager.add(entity: wall_4)
        wall_4.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: universalUnit(7), y: universalUnit(3))
        
        let wall_5 = Wall(imageName: "wallSection", hasPhysicsBody: true)
        entityManager.add(entity: wall_5)
        wall_5.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: universalUnit(8), y: universalUnit(3))
        
        let wall_6 = Wall(imageName: "wallSection", hasPhysicsBody: true)
        entityManager.add(entity: wall_6)
        wall_6.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: universalUnit(9), y: universalUnit(3))
        
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
        
        for _ in 1 ... 2 {
            let box = Box()
            entityManager.add(entity: box)
            box.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: universalUnit(11), y: universalUnit(7.5))
        }
        
    }
}
