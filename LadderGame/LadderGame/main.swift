//
//  main.swift
//  LadderGame
//
//  Created by Maylily on 2020/11/05.
//

import Foundation

struct LadderGame {
    typealias Ladder = Array<Array<String>>
    
    func drawLadder(participant: String?, height: Int) -> Ladder {
        let participantNum = Int(participant!)!
        var resultLadder = Array(repeating: Array(repeating: "|", count: participantNum * 2 - 1), count: height)
        
        for rowIndex in 0..<height {
            for columnIndex in 0..<participantNum * 2 - 1 {
                if columnIndex % 2 == 1 && Int.random(in: 0...1) == 1 {
                    resultLadder[rowIndex][columnIndex] = "-"
                } else if columnIndex % 2 == 1 {
                    resultLadder[rowIndex][columnIndex] = " "
                }
            }
        }
        return resultLadder
    }
    
    func printLadder(ladder: Ladder) {
        for (index, _) in ladder.enumerated() {
            print(ladder[index].joined())
        }
        print()
    }
}

var ladderGame = LadderGame()
while let participantNum = readLine() {
    guard Int(participantNum)! <= 2 || Int(participantNum)! <= 8 else {
        break
    }
    var resultLadder = ladderGame.drawLadder(participant: participantNum, height: 4)
    ladderGame.printLadder(ladder: resultLadder)
}
