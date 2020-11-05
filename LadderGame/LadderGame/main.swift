//
//  main.swift
//  LadderGame
//
//  Created by Maylily on 2020/11/05.
//

import Foundation

print("인원수를 입력해주세요")
while var participant = readLine() {
    guard Int(participant)! < 2 || Int(participant)! < 8 else {
        break
    }
}
