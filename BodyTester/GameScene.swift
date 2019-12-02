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
    let nameLabel=SKLabelNode(fontNamed: "Chalkduster")
    
    let NUMVAR:Int=3
    
    let headName=["Veron","Quack","Scorp"]
    let bodyName=["a", "ano", "io"]
    let legName=["ni", "lo", "so"]
    
    var creatureName=""
    
    var bScale:CGFloat=8.0
    override func didMove(to view: SKView) {
        
        nameLabel.position.y=size.height*0.45
        addChild(nameLabel)
        
        
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

        createCreature()
        
        
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
    
    func createCreature()
    {
        let legInt=Int(random(min: 0, max: CGFloat(NUMVAR)-0.00000001))
        let bodyInt=Int(random(min: 0, max: CGFloat(NUMVAR)-0.00000001))
        let headInt=Int(random(min: 0, max: CGFloat(NUMVAR)-0.00000001))
        
        body.texture=SKTexture(imageNamed: "body0\(bodyInt)")
        legs.texture=SKTexture(imageNamed: "legs0\(legInt)")
        head.texture=SKTexture(imageNamed: "head0\(headInt)")
        
        body.texture?.filteringMode=SKTextureFilteringMode.nearest
        head.texture?.filteringMode=SKTextureFilteringMode.nearest
        legs.texture?.filteringMode=SKTextureFilteringMode.nearest
        
        creatureName=headName[headInt]+bodyName[bodyInt]+legName[legInt]
        print(creatureName)
        nameLabel.text=creatureName
        
        
    }
    
    override func keyDown(with event: NSEvent) {
        switch event.keyCode {

        case 49:
            createCreature()
        default:
            print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
