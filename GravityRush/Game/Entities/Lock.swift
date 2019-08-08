//
//  exitLock.swift
//  GravityRush
//
//  Created by Raul Rodrigues on 8/8/19.
//  Copyright © 2019 Luiz Felipe Trindade. All rights reserved.
//

import Foundation
import GameplayKit

class Lock: GKEntity {
    let nodeOpen: SKSpriteNode
    let nodeLocked: SKSpriteNode
    
    override init() {
        let spriteComponentOpen = SpriteComponent(imageName: "lockOpen")
        self.nodeOpen = spriteComponentOpen.spriteNode

        let spriteComponentLocked = SpriteComponent(imageName: "lockClosed")
        self.nodeLocked = spriteComponentLocked.spriteNode
        
        self.nodeOpen.isHidden = true
        self.nodeLocked.isHidden = false

        super.init()
        
        self.addComponent(spriteComponentOpen)
        self.addComponent(spriteComponentLocked)
    }
    
    func open() {
        self.nodeOpen.isHidden = false
        self.nodeLocked.isHidden = true
    }
    
    func lock() {
        self.nodeOpen.isHidden = true
        self.nodeLocked.isHidden = false
    }
    
    func setPosition(_ position: CGPoint) {
        self.nodeOpen.position = position
        self.nodeLocked.position = position
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("do not use decoders")
    }
}
