//
//  main.swift
//  LadderGame
//
//  Created by Maylily on 2020/11/05.
//

import Foundation

print("인원수를 입력해주세요")

func printLadder(participant: String?, height: Int) {
    let participantNum = Int(participant!)!
    var resultLadder = Array(repeating: Array(repeating: "|", count: participantNum * 2 - 1), count: height)
    
    for rowIndex in 0..<height {
        for columnIndex in 0..<participantNum * 2 - 1 {
            if columnIndex % 2 == 1 && Int.random(in: 0...1) == 1 {
                resultLadder[rowIndex][columnIndex] = "-"
            } else if columnIndex % 2 == 1 {
                resultLadder[rowIndex][columnIndex] = " "
            }
            print(resultLadder[rowIndex][columnIndex], terminator: "")
        }
        print()
    }
}

printLadder(participant: readLine(), height: 4)
