//
//  ScaleComponent.swift
//  GravityRush
//
//  Created by Raul Rodrigues on 8/5/19.
//  Copyright © 2019 Luiz Felipe Trindade. All rights reserved.
//

import Foundation
import GameKit

final class ScaleComponent: GKComponent {
    let scale: CGFloat
    
    init(scale: CGFloat, spriteComponent: SpriteComponent) {
        self.scale = scale
        super.init()
        spriteComponent.spriteNode.xScale = defaultScale * scale
        spriteComponent.spriteNode.yScale = defaultScale * scale
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("do not use decoders")
    }
}
