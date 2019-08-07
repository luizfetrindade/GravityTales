//
//  MoveComponent.swift
//  GravityRush
//
//  Created by Raul Rodrigues on 8/2/19.
//  Copyright © 2019 Luiz Felipe Trindade. All rights reserved.
//

import Foundation
import GameplayKit

final class MoveComponent: GKComponent {
    let node: SKNode
    let timeOffset: TimeInterval
    
    init(node: SKNode, timeOffset: TimeInterval) {
        self.node = node
        self.timeOffset = timeOffset
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("do not use decoders")
    }
    
    func move(timeOffset: TimeInterval, direction: String) {
        if direction == "left" {
            node.position.x += CGFloat(80 * timeOffset)
        } else if direction == "right" {
            node.position.x -= CGFloat(80 * timeOffset)
        } else {
            fatalError("Direction is wrong")
        }
//        node.position = pos
    }
}
