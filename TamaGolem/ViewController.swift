//
//  ViewController.swift
//  TamaGolem
//
//  Created by Jan Dammshäuser on 03.02.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bgImg: UIImageView!
    @IBOutlet weak var groundImg: UIImageView!
    @IBOutlet weak var skull1: UIImageView!
    @IBOutlet weak var skull2: UIImageView!
    @IBOutlet weak var skull3: UIImageView!
    @IBOutlet weak var heartImg: DragImage!
    @IBOutlet weak var foodImg: DragImage!
    @IBOutlet weak var petImg: PetImg!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bgImg.setBackgroundImage("bg.png")
        groundImg.setBackgroundImage("ground.png")
    }
    
    
}

