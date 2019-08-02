//
//  SpriteComponent.swift
//  GravityRush
//
//  Created by Fernando Locatelli Maioli on 02/08/19.
//  Copyright © 2019 Luiz Felipe Trindade. All rights reserved.
//


import GameplayKit

final class SpriteComponent: GKComponent {
    
    var spriteNode: SKSpriteNode
    
    init(imageNamed imageName: String) {
        spriteNode = SKSpriteNode(imageNamed: imageName)
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
