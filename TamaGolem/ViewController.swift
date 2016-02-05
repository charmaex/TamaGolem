//
//  ViewController.swift
//  TamaGolem
//
//  Created by Jan Dammshäuser on 03.02.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var model = Model()
    
    @IBOutlet weak var bgImg: UIImageView!
    @IBOutlet weak var groundImg: UIImageView!
    @IBOutlet weak var skull1: UIImageView!
    @IBOutlet weak var skull2: UIImageView!
    @IBOutlet weak var skull3: UIImageView!
    @IBOutlet var skulls: [UIImageView]!
    @IBOutlet weak var heartImg: DragImage!
    @IBOutlet weak var foodImg: DragImage!
    @IBOutlet weak var petImg: PetImg!
    
    @IBOutlet weak var playerChooseMenu: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let player = model.player
        petImg.setPlayer(player.0, deadCount: player.1)
        
        bgImg.setBackgroundImage("bg.png")
        groundImg.setBackgroundImage("ground.png")
        
        for skull in skulls {
            skull.dimImgView(dimming: true)
        }
        
        heartImg.dimImgView(andDisable_dimming: true)
        foodImg.dimImgView(andDisable_dimming: true)
        
    }
    
    
    @IBAction func playerGolem(sender: AnyObject) {
    
    }
    
    @IBAction func playerSnail(sender: AnyObject) {
    
    }
    
    @IBAction func playerMiner(sender: AnyObject) {
    
    }
    
}

