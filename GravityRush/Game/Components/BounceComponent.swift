//
//  BounceComponent.swift
//  GravityRush
//
//  Created by Raul Rodrigues on 8/5/19.
//  Copyright © 2019 Luiz Felipe Trindade. All rights reserved.
//

import Foundation
import GameplayKit

final class BounceComponent: GKComponent {
    
    init(restitution: Double, physicsComponent: PhysicsComponent) {
        super.init()
        physicsComponent.physicsBody.restitution = CGFloat(restitution)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("do not use decoders ever")
    }
}
