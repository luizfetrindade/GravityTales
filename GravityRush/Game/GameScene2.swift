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
        
        let wall4 = Wall(imageName: "wallHorizontal", hasPhysicsBody: true)
        entityManager.add(entity: wall4)
        wall4.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: sceneWidth/2, y: sceneHeight - 140)
        
        let spike1 = Spike()
        entityManager.add(entity: spike1)
        spike1.component(ofType: SpriteComponent.self)?.spriteNode.position = CGPoint(x: (sceneWidth/2) + (sceneWidth/3), y: 200)
    }
}
