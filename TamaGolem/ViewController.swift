//
//  ViewController.swift
//  TamaGolem
//
//  Created by Jan Dammshäuser on 03.02.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    var model = Model()
    
    var currentAction: Int = 0
    
    @IBOutlet weak var bgImg: UIImageView!
    @IBOutlet weak var groundImg: UIImageView!
    @IBOutlet weak var skull1: UIImageView!
    @IBOutlet weak var skull2: UIImageView!
    @IBOutlet weak var skull3: UIImageView!
    @IBOutlet var skulls: [UIImageView]!
    @IBOutlet weak var heartImg: DragImage!
    @IBOutlet weak var foodImg: DragImage!
    @IBOutlet weak var petImg: PetImg!
    @IBOutlet weak var flowerRockImg: UIImageView!
    @IBOutlet weak var playerChooseMenu: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let player = model.player
        petImg.setPlayer(player.0, deadCount: player.1)
        
        bgImg.setBackgroundImage("bg.png")
        groundImg.setBackgroundImage("ground.png")
        
        heartImg.targetView = petImg
        foodImg.targetView = petImg
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "itemDropped:", name: "droppedOnTarget", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "petLostLife", name: "petLostLife", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "newItem", name: "petHappy", object: nil)
        
    }
    
    func newItem() {
        let rand = arc4random_uniform(2)
        
        currentAction = Int(rand)
        
        if rand == 0 {
            foodImg.dimImgViewAndDisable(dimming: false)
            heartImg.dimImgViewAndDisable(dimming: true)
        } else {
            foodImg.dimImgViewAndDisable(dimming: true)
            heartImg.dimImgViewAndDisable(dimming: false)
        }
    }
    
    func petLostLife() {
        let lifes = model.lifes
        if lifes == 1 {
            skull1.dimImgView(dimming: false)
        } else if lifes == 2 {
            skull2.dimImgView(dimming: false)
        } else if lifes == 3 {
            skull3.dimImgView(dimming: false)
        }
        
        if model.isDead {
            petImg.deathAnimation()
            
            let dispatchTime: dispatch_time_t = dispatch_time(DISPATCH_TIME_NOW, Int64(2 * Double(NSEC_PER_SEC)))
            dispatch_after(dispatchTime, dispatch_get_main_queue(), {
                self.playerChooseMenu.hidden = false
            })
        } else {
            newItem()
        }
    }
    
    func itemDropped(notif: AnyObject) {
        heartImg.dimImgViewAndDisable(dimming: true)
        foodImg.dimImgViewAndDisable(dimming: true)
        
        model.itemDropped(currentAction)
    }
    
    func startGame(index: Int, image: UIImage) {
        playerChooseMenu.hidden = true
        heartImg.dimImgViewAndDisable(dimming: true)
        foodImg.dimImgViewAndDisable(dimming: true)
        
        for skull in skulls {
            skull.dimImgView(dimming: true)
        }
        
        model.startGame(withPlayer: index)
        
        flowerRockImg.image = image
        
        let player = model.player
        petImg.setPlayer(player.0, deadCount: player.1)
        
        newItem()
    }
    
    @IBAction func playerGolem(sender: AnyObject) {
        startGame(0, image: UIImage(named: "rock.png")!)
    }
    
    @IBAction func playerSnail(sender: AnyObject) {
        startGame(1, image: UIImage(named: "plant.png")!)
    }
    
}

