//
//  Model.swift
//  TamaGolem
//
//  Created by Jan Dammshäuser on 05.02.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import Foundation

class Model {
    
    private let PLAYER_LIST: [(String, Int)] = [("golem", 5), ("snail", 3), ("miner", 5)]
    
    private var _player: Int?
    
    var player: (String, Int) {
        guard let index = _player else {
            return PLAYER_LIST[0]
        }
        return PLAYER_LIST[index]
    }
    
    
    func startGame(withPlayer index: Int) {
        _player = index
        startGame()
    }
    
    private func startGame() {
        
    }
}