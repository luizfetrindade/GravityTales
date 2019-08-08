//
//  Button.swift
//  GravityRush
//
//  Created by Raul Rodrigues on 8/8/19.
//  Copyright © 2019 Luiz Felipe Trindade. All rights reserved.
//

import Foundation
import GameplayKit

class Button: GKEntity {
    override init() {
        super.init()
        
        let spriteComponent = SpriteComponent(imageName: "buttonOFF")
        self.addComponent(spriteComponent)
        spriteComponent.spriteNode.zPosition = 0.9
        
        let physicsComponent = PhysicsComponent(category: PhysicsCategory.Button, contact: PhysicsCategory.Box | PhysicsCategory.Hero, collision: PhysicsCategory.Hero | PhysicsCategory.Box, spriteComponent: spriteComponent)
        self.addComponent(physicsComponent)
    }
    
    func turnOn(_ distance: CGFloat) {
        self.component(ofType: SpriteComponent.self)?.spriteNode.position.y += 3
    }
    
    func turnOff(_ distance: CGFloat) {
        self.component(ofType: SpriteComponent.self)?.spriteNode.position.y -= 3
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("do not use decoders")
    }
}
