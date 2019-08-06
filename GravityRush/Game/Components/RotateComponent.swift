//
//  RotateComponent.swift
//  GravityRush
//
//  Created by Luiz Felipe Trindade on 05/08/19.
//  Copyright © 2019 Luiz Felipe Trindade. All rights reserved.
//

import Foundation
import GameplayKit

final class RotateComponent: GKComponent {
    let node: SKNode
    
    init(node: SKNode) {
        self.node = node
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func rotate(direction: String) {
        if direction == "left" {
            node.zRotation = -CGFloat(Double.pi/2)
        } else if direction == "right" {
            node.zRotation = CGFloat(Double.pi/2)
        } else if direction == "up" {
            node.zRotation = -CGFloat(Double.pi)
        } else if direction == "down" {
            node.zRotation = 0.0
        } else { fatalError("Direction is wrong") }
    }
}
