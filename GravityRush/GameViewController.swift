//
//  GameViewController.swift
//  GravityRush
//
//  Created by Luiz Felipe Trindade on 24/07/19.
//  Copyright © 2019 Luiz Felipe Trindade. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func loadView() {
        view = SKView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let view = view as? SKView else { return }
        let scene = GameScene(size: view.bounds.size)
        scene.scaleMode = .aspectFit
        
        scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        view.presentScene(scene)

        createFakeEntities(for: scene)
    }
}

extension GameViewController {
    
    func createFakeEntities(for scene: GameScene) {
        
        let hero = Hero()
        scene.entityManager.add(entity: hero)
        
        let box = Box()
        scene.entityManager.add(entity: box)
    
        let wall = Wall()
        scene.entityManager.add(entity: wall)
    }
}
