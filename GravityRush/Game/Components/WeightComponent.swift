//
//  WeightComponent.swift
//  GravityRush
//
//  Created by Fernando Locatelli Maioli on 02/08/19.
//  Copyright © 2019 Luiz Felipe Trindade. All rights reserved.
//

import GameplayKit

final class WeightComponent: GKComponent {
    
    init(physicsComponent: PhysicsComponent) {
        super.init()
        physicsComponent.physicsBody.isDynamic = true
        physicsComponent.physicsBody.affectedByGravity = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
