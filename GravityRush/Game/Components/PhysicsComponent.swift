//
//  PhysicsComponent.swift
//  GravityRush
//
//  Created by Raul Rodrigues on 8/5/19.
//  Copyright © 2019 Luiz Felipe Trindade. All rights reserved.
//

import Foundation
import GameplayKit

public struct PhysicsCategory {
    public static let None: UInt32 = 0b0
    public static let Hero: UInt32 = 0b1
    public static let Wall: UInt32 = 0b10
    public static let Exit: UInt32 = 0b100
    public static let Enemy: UInt32  = 0b1000
    public static let All: UInt32 = UInt32.max
}

final class PhysicsComponent: GKComponent {
    let physicsBody: SKPhysicsBody
    
    init(category: UInt32, contact: UInt32, collision: UInt32, physicsBody: SKPhysicsBody) {
        self.physicsBody = physicsBody
        self.physicsBody.categoryBitMask = category
        self.physicsBody.contactTestBitMask = contact
        self.physicsBody.collisionBitMask = collision
        super.init()
    }
    
    init(category: UInt32, contact: UInt32, collision: UInt32, spriteComponent: SpriteComponent) {
        self.physicsBody = SKPhysicsBody(rectangleOf: spriteComponent.spriteNode.frame.size)
        self.physicsBody.categoryBitMask = category
        self.physicsBody.contactTestBitMask = contact
        self.physicsBody.collisionBitMask = collision
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("do not use decoders ever!")
    }
}

/*
 
 
 extension GameScene: SKPhysicsContactDelegate {
 func didBegin(_ contact: SKPhysicsContact) {
 // 1
 var firstBody: SKPhysicsBody
 var secondBody: SKPhysicsBody
 if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
 firstBody = contact.bodyA
 secondBody = contact.bodyB
 } else {
 firstBody = contact.bodyB
 secondBody = contact.bodyA
 }
 
 // 2
 if ((firstBody.categoryBitMask & PhysicsCategory.monster != 0) &&
 (secondBody.categoryBitMask & PhysicsCategory.projectile != 0)) {
 if let monster = firstBody.node as? SKSpriteNode,
 let projectile = secondBody.node as? SKSpriteNode {
 projectileDidCollideWithMonster(projectile: projectile, monster: monster)
 }
 }
 }
 }

*/
