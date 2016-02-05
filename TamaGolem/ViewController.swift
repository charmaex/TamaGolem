//
//  ViewController.swift
//  TamaGolem
//
//  Created by Jan Dammshäuser on 03.02.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bgImg: BackgroundForImageView!
    @IBOutlet weak var groundImg: BackgroundForImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bgImg.setBackgroundImage("bg.png")
        groundImg.setBackgroundImage("ground.png")
    }
    
    
}

