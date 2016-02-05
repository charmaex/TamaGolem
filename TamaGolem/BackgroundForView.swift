//
//  BackgroundForView.swift
//  TamaGolem
//
//  Created by Jan Dammshäuser on 05.02.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

class BackgroundForImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setBackgroundImage(imgName: String) {
        guard let image = UIImage(named: imgName) else { return }
        let color = UIColor(patternImage: image)
        
        self.image = nil
        self.backgroundColor = color
    }
    
}
