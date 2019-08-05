//
//  Wall.swift
//  GravityRush
//
//  Created by Raul Rodrigues on 8/2/19.
//  Copyright © 2019 Luiz Felipe Trindade. All rights reserved.
//

import Foundation
import GameplayKit

final class Wall: GKEntity {
    override init() {
        super.init()
        
        let physiscsComponent = PhysicsComponent(category: PhysicsCategory.Wall)
        self.addComponent(physiscsComponent)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("do not use decoders")
    }
}
