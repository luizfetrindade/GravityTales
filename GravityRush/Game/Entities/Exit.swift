//
//  Exit.swift
//  GravityRush
//
//  Created by Raul Rodrigues on 8/5/19.
//  Copyright © 2019 Luiz Felipe Trindade. All rights reserved.
//

import Foundation
import GameplayKit

final class Exit: GKEntity {
    override init() {
        super.init()
        
        let spriteComponent = SpriteComponent(imageName: "door")
        self.addComponent(spriteComponent)
        
        let physiscsComponent = PhysicsComponent(category: PhysicsCategory.Exit, contact: PhysicsCategory.Hero, collision: PhysicsCategory.None, spriteComponent: spriteComponent)
        self.addComponent(physiscsComponent)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("do not use decoders")
    }
}
