//
//  Model.swift
//  TamaGolem
//
//  Created by Jan Dammshäuser on 05.02.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import Foundation
import AVFoundation

class Model: NSObject {
    
    private let PLAYER_LIST: [(String, Int)] = [("golem", 5), ("snail", 3), ("miner", 5)]
    private let MAX_LIFES: Int = 3
    
    private var musicBG: AVAudioPlayer!
    private var sfxFood: AVAudioPlayer!
    private var sfxHeart: AVAudioPlayer!
    private var sfxSkull: AVAudioPlayer!
    private var sfxDead: AVAudioPlayer!
    
    private var _player: Int?
    private var _timer: NSTimer!
    private var _lifes: Int = 0
    
    private var _currentAction: Int = 0
    private var _itemDropped: Bool = false
    
    var lifes: Int {
        return _lifes
    }
    
    var isDead: Bool {
        return lifes >= MAX_LIFES
    }
    
    var player: (String, Int) {
        guard let index = _player else {
            return PLAYER_LIST[0]
        }
        return PLAYER_LIST[index]
    }
    
    override init() {
        super.init()
        do {
            try musicBG = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("cave-music", ofType: "mp3")!))
            try sfxFood = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("bite", ofType: "wav")!))
            try sfxHeart = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("heart", ofType: "wav")!))
            try sfxSkull = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("skull", ofType: "wav")!))
            try sfxDead = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("death", ofType: "wav")!))
            
            musicBG.prepareToPlay()
            musicBG.play()
            sfxFood.prepareToPlay()
            sfxHeart.prepareToPlay()
            sfxSkull.prepareToPlay()
        } catch let err as NSError {
            print(err.description)
        }
    }
    
    
    func startGame(withPlayer index: Int) {
        _player = index
        _lifes = 0
        startTimer()
    }
    
    func changeGame() {
        if _itemDropped {
            petHappy()
        } else {
            _lifes++
            sfxSkull.play()
            
            if lifes == MAX_LIFES {
                sfxDead.play()
                stopTimer()
            }
            
            petLostLife()
        }
        
        _itemDropped = false
    }
    
    func itemDropped(currentAction: Int) {
        _itemDropped = true
        
        if currentAction == 0 {
            sfxFood.play()
        } else {
            sfxHeart.play()
        }
        
        startTimer()
    }
    
    private func stopTimer() {
        if _timer != nil {
            _timer!.invalidate()
        }
    }
    
    private func startTimer() {
        stopTimer()
        
        _timer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "changeGame", userInfo: nil, repeats: true)
    }
    
    private func petHappy() {
        NSNotificationCenter.defaultCenter().postNotificationName("petHappy", object: nil)
    }
    
    private func petLostLife() {
        NSNotificationCenter.defaultCenter().postNotificationName("petLostLife", object: nil)
    }

}
