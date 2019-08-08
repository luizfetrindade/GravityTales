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
    public static let Box: UInt32 = 0b10000
    public static let Button: UInt32 = 0b100000
    public static let All: UInt32 = UInt32.max
}

final class PhysicsComponent: GKComponent {
    let physicsBody: SKPhysicsBody
    
    init(category: UInt32, contact: UInt32, collision: UInt32, spriteComponent: SpriteComponent) {
        self.physicsBody = SKPhysicsBody(rectangleOf: spriteComponent.spriteNode.size)
        self.physicsBody.categoryBitMask = category
        self.physicsBody.contactTestBitMask = contact
        self.physicsBody.collisionBitMask = collision
        
        
        //Defaults
        self.physicsBody.affectedByGravity = false
        self.physicsBody.restitution = 0.0
        self.physicsBody.allowsRotation = false
        self.physicsBody.isDynamic = false
        self.physicsBody.usesPreciseCollisionDetection = true
        self.physicsBody.friction = 0.5
        
        spriteComponent.spriteNode.physicsBody = self.physicsBody
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("do not use decoders ever!")
    }
}
