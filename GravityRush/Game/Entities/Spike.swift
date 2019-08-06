//
//  Spike.swift
//  GravityRush
//
//  Created by Luiz Felipe Trindade on 02/08/19.
//  Copyright © 2019 Luiz Felipe Trindade. All rights reserved.
//

import Foundation
import GameplayKit

final class Spike: GKEntity {
    override init() {
        super.init()
        
        let spriteComponent = SpriteComponent(imageName: "player1")
        self.addComponent(spriteComponent)
        
        let physiscsComponent = PhysicsComponent(category: PhysicsCategory.Enemy, contact: PhysicsCategory.Hero, collision: PhysicsCategory.None, spriteComponent: spriteComponent)
        self.addComponent(physiscsComponent)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("do not use decoders")
    }
}
