//
//  GolemImg.swift
//  TamaGolem
//
//  Created by Jan Dammshäuser on 05.02.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit
import Foundation

class PetImg: UIImageView {
    
    enum AnimationTypes: String {
        case Death = "dead", Idle = "idle"
    }
    
    private var _playerName: String?
    private var _playerDeadImageCount: Int?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setPlayer(name: String, deadCount: Int) {
        _playerName = name
        _playerDeadImageCount = deadCount
        
        animate(.Idle)
    }
    
    func deathAnimation() {
        animate(.Death)
    }
    
    private func animate(type: AnimationTypes) {
        
        guard let name = _playerName, let deadCount = _playerDeadImageCount else {
            return
        }
        
        var imageCount = 4
        
        switch type {
        case .Idle:
            self.animationRepeatCount = 0
            self.image = UIImage(named: "\(name)_\(type.rawValue)1.png")
        case .Death:
            self.animationRepeatCount = 1
            self.image = UIImage(named: "\(name)_\(type.rawValue)\(deadCount).png")
            imageCount = deadCount
        }
        
        var imageList = [UIImage]()
        
        for  x in 1...imageCount {
            guard let img = UIImage(named: "\(name)_\(type.rawValue)\(x).png") else {
                continue
            }
            imageList.append(img)
        }
        
        self.animationImages = imageList
        self.animationDuration = 0.6
        self.startAnimating()
    }
    
    
}