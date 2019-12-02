//
//  GameScene.swift
//  BodyTester
//
//  Created by Tom Shiflet on 12/1/19.
//  Copyright © 2019 Tom Shiflet. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    

    let body=SKSpriteNode(imageNamed: "body00")
    let head=SKSpriteNode(imageNamed: "head00")
    let legs=SKSpriteNode(imageNamed: "legs00")
    
    var bScale:CGFloat=8.0
    override func didMove(to view: SKView) {
        
        addChild(body)
        body.texture?.filteringMode=SKTextureFilteringMode.nearest
        head.texture?.filteringMode=SKTextureFilteringMode.nearest
        legs.texture?.filteringMode=SKTextureFilteringMode.nearest
        body.addChild(head)
        body.addChild(legs)
        body.setScale(bScale)
        head.position.y = body.size.height/(body.yScale)
        legs.position.y = -body.size.height/(body.yScale)
        
        body.run(SKAction.repeatForever(SKAction.sequence([SKAction.scale(to: bScale*1.2, duration: 0.33),SKAction.scale(to: bScale, duration: 0.33)])))

    }
    
    
    func touchDown(atPoint pos : CGPoint) {

    }
    
    func touchMoved(toPoint pos : CGPoint) {

    }
    
    func touchUp(atPoint pos : CGPoint) {

    }
    
    override func mouseDown(with event: NSEvent) {
        self.touchDown(atPoint: event.location(in: self))
    }
    
    override func mouseDragged(with event: NSEvent) {
        self.touchMoved(toPoint: event.location(in: self))
    }
    
    override func mouseUp(with event: NSEvent) {
        self.touchUp(atPoint: event.location(in: self))
    }
    
    override func keyDown(with event: NSEvent) {
        switch event.keyCode {

        case 49:
            let legInt=Int(random(min: 0, max: 1.99999999))
            let bodyInt=Int(random(min: 0, max: 1.99999999))
            let headInt=Int(random(min: 0, max: 1.99999999))
            
            body.texture=SKTexture(imageNamed: "body0\(bodyInt)")
            legs.texture=SKTexture(imageNamed: "legs0\(legInt)")
            head.texture=SKTexture(imageNamed: "head0\(headInt)")
            
            body.texture?.filteringMode=SKTextureFilteringMode.nearest
            head.texture?.filteringMode=SKTextureFilteringMode.nearest
            legs.texture?.filteringMode=SKTextureFilteringMode.nearest
            
        default:
            print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
