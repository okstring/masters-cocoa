//
//  p8958.swift
//  Friday-algorithm
//
//  Created by Maylily on 2020/11/06.
//

import Foundation

func p8958() {
    let inputQuizNum = readLine()!
    var inputQuiz: String?

    func fibonacci(num: Int) -> Int {
        if num == 1 { return 1 }
        return fibonacci(num: num - 1) + num
    }

    // X를 기준으로 나눠 Arr를 만들기(split),
    // O 반복된 횟수를 fibonacci 함수에 넣어 각각 계산하고(map)
    // Arr value 전체 더하기(reduce)
    for _ in 0...Int(inputQuizNum)! - 1 {
        inputQuiz = readLine()!
        print(inputQuiz!.split(separator: "X").map( { fibonacci(num: Int($0.count)) } ).reduce(0, { $0 + $1 }))
    }
}
