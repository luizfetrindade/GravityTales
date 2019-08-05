//
//  EntityManager.swift
//  GravityRush
//
//  Created by Luiz Felipe Trindade on 02/08/19.
//  Copyright © 2019 Luiz Felipe Trindade. All rights reserved.
//

import GameplayKit
import SpriteKit

final class EntityManager {
    
    var entities: [GKEntity] = []
    
    weak var sceneNode: SKNode?
    
    init(scene: SKNode) {
        self.sceneNode = scene
    }
    
    func update(with delta: TimeInterval) {
        entities.forEach {
            $0.update(deltaTime: delta)
        }
    }
    
    func add(entity: GKEntity) {
        if let node = entity.component(ofType: SpriteComponent.self)?.spriteNode {
            sceneNode?.addChild(node)
        }
        entities.append(entity)
    }
    
    func remove(entity: GKEntity) {
        entity.component(ofType: SpriteComponent.self)?.spriteNode.removeFromParent()
        entities.removeAll{ $0 == entity }
    }
    
    func removeAllEntities() {
        while let entity = entities.last { remove(entity: entity) }
    }
}

