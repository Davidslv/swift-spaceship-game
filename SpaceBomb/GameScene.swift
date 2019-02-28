//
//  GameScene.swift
//  SpaceBomb
//
//  Created by David Silva on 28/02/2019.
//  Copyright © 2019 David Silva. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var ship = SKSpriteNode()
    var shipMoveUp = SKAction()
    var shipMoveDown = SKAction()
    
    override func didMove(to view: SKView) {
        self.backgroundColor = .white
        self.addShip()
        
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
    }
    
    func addShip() {
        ship = SKSpriteNode(imageNamed: "Spaceship")
        ship.setScale(0.25)
        ship.zRotation = CGFloat(-Double.pi/2)
        
        ship.physicsBody = SKPhysicsBody(rectangleOf: ship.size)
        ship.physicsBody?.isDynamic = true
        ship.name = "ship"
        ship.position = CGPoint(x: 120, y: 160)
        
        shipMoveUp = SKAction.moveBy(x: 0, y: 30, duration: 0.2)
        shipMoveDown = SKAction.moveBy(x: 0, y: -30, duration: 0.2)
        
        self.addChild(ship)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.location(in: self)
            
            if location.y > ship.position.y {
                if ship.position.y < 300 {
                    ship.run(shipMoveUp)
                }
            }
            else {
                if ship.position.y > 100 {
                    ship.run(shipMoveDown)
                }
            }
        }
    }
}
