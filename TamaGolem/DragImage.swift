//
//  DragImage.swift
//  TamaGolem
//
//  Created by Jan Dammshäuser on 05.02.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

class DragImage: UIImageView {

    var originalPosition: CGPoint!
    var targetView: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        originalPosition = self.center
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        guard let position = getPosition(touches, absolutePosition: false) else {
            return
        }
        
        self.center = CGPointMake(position.x, position.y)
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.center = originalPosition
        
        guard let position = getPosition(touches, absolutePosition: true), let target = targetView else {
            return
        }
        
        
        if target.frame.contains(position) {
            NSNotificationCenter.defaultCenter().postNotificationName("droppedOnTarget", object: nil)
        }
    }
    
    private func getPosition(input: Set<UITouch>, absolutePosition: Bool) -> CGPoint? {
        guard let touch = input.first else {
            return nil
        }
        
        if absolutePosition {
            return touch.locationInView(super.superview?.superview)
        }
        return touch.locationInView(super.superview)
        
    }
    
}
