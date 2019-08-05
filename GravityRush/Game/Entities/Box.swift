//
//  Box.swift
//  GravityRush
//
//  Created by Fernando Locatelli Maioli on 02/08/19.
//  Copyright © 2019 Luiz Felipe Trindade. All rights reserved.
//

import Foundation
import GameplayKit

final class Box: GKEntity {
    override init() {
        super.init()
        
        let spriteComponent = SpriteComponent(imageNamed: "box")
        self.addComponent(spriteComponent)
        
        let weightComponent = WeightComponent(node: SKNode.init())
        self.addComponent(weightComponent)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("do not use decoders")
    }
}
