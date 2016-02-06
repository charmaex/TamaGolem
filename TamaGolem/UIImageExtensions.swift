//
//  UIImageDim.swift
//  TamaGolem
//
//  Created by Jan Dammshäuser on 05.02.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func dimImgView(dimming b: Bool) {
        self.alpha = b ? 0.4 : 1
    }
    
    func dimImgViewAndDisable(dimming b:Bool) {
        self.userInteractionEnabled = false == b
        dimImgView(dimming: b)
    }
    
    override func setBackgroundImage(imgName: String) {
        super.setBackgroundImage(imgName)
        
        self.image = nil
    }
}

extension UIView {
    func setBackgroundImage(imgName: String) {
        guard let image = UIImage(named: imgName) else { return }
        let color = UIColor(patternImage: image)
        
        self.backgroundColor = color
    }
}
