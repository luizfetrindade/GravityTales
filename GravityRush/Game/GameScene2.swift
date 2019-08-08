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

final class GameScene2: GameScene {
    override func createLevel() {
        guard let scene = scene else { fatalError() }
        
        let sceneHeight: CGFloat = scene.size.height
        let sceneWidth: CGFloat = sceneHeight * (CGFloat(16) / CGFloat(9))
        
        
        let wall = Wall(imageName: "wallVertical", hasPhysicsBody: true)
        entityManager.add(entity: wall)
        wall.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: sceneWidth/2, y: 20)
        
        let wall2 = Wall(imageName: "wallVertical", hasPhysicsBody: true)
        entityManager.add(entity: wall2)
        wall2.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: sceneWidth/2, y: sceneHeight - 20)
        
        let wall3 = Wall(imageName: "wallHorizontal", hasPhysicsBody: true)
        entityManager.add(entity: wall3)
        wall3.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: sceneWidth/2, y: 140)
        
        let spikeUp1 = Spike(imageName: "spikesPUP")
        entityManager.add(entity: spikeUp1)
        spikeUp1.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: sceneWidth/2 - spikeUp1.component(ofType: SpriteComponent.self)!.spriteNode.size.width, y: 140 + 15)
        
        let spikeUp2 = Spike(imageName: "spikesPUP")
        entityManager.add(entity: spikeUp2)
        spikeUp2.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: sceneWidth/2 + spikeUp2.component(ofType: SpriteComponent.self)!.spriteNode.size.width, y: 140 + 15)
        
        let wall4 = Wall(imageName: "wallHorizontal", hasPhysicsBody: true)
        entityManager.add(entity: wall4)
        wall4.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: sceneWidth/2, y: sceneHeight - 140)
        
        let spikeDown1 = Spike(imageName: "spikesPDOWN")
        entityManager.add(entity: spikeDown1)
        spikeDown1.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: sceneWidth/2 - spikeDown1.component(ofType: SpriteComponent.self)!.spriteNode.size.width, y: sceneHeight - 140 - 15)
        
        let spikeDown2 = Spike(imageName: "spikesPDOWN")
        entityManager.add(entity: spikeDown2)
        spikeDown2.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: sceneWidth/2 + spikeDown2.component(ofType: SpriteComponent.self)!.spriteNode.size.width, y: sceneHeight - 140 - 15)
        
        let exit = Exit()
        exit.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: universalUnit(14.5), y: universalUnit(1.5))
        exit.component(ofType: SpriteComponent.self)?.spriteNode.zPosition = CGFloat(-0.999)
        entityManager.add(entity: exit)
    }
}
