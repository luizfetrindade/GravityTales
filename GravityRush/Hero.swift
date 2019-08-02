//
//  Hero.swift
//  GravityRush
//
//  Created by Raul Rodrigues on 8/2/19.
//  Copyright © 2019 Luiz Felipe Trindade. All rights reserved.
//

import Foundation
import GameplayKit

final class Hero: GKEntity {
    override init() {
        super.init()

        
        let moveComponent = MoveComponent(node: SKNode.init(), timeOffset: 3)
        self.addComponent(moveComponent)
        
        let jumpComponent = JumpComponent(node: SKNode.init(), strength: 2)
        self.addComponent(jumpComponent)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("do not use decoders")
    }
}
