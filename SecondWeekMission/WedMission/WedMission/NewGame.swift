import Foundation

struct NewGame {
    var tryCount: Int = 0
    var result: Bool = false
    private var solutionNumbers: Array<Int> = []
    
    mutating func suffleNumber() {
        var solutionNumberToSet = Set<Int>()
        while solutionNumberToSet.count < 3 { solutionNumberToSet.insert(Int.random(in: 0...9)) }
        solutionNumbers = Array(solutionNumberToSet)
    }
    
    mutating func hit(num: Int) -> (strikeCount: Int, ballCount: Int){
        if tryCount == 0 { suffleNumber() }
        var (strikeCount, ballCount) = (0, 0)
        // 입력받은 num 값을 Int로 변환
        let answerNumbers = String(describing: num).compactMap{ Int(String($0))}
        // 해당 value가 답에 들어있는지 && 해당 위치에 있는지
        answerNumbers.enumerated().map{ (index, value) in
            if solutionNumbers.contains(value) && solutionNumbers[index] == value {
                strikeCount += 1
            } else if solutionNumbers.contains(value) {
                ballCount += 1
            }
        }
        // 9번 안에 3 strike 맞추면 result 값 true
        if strikeCount == 3 && tryCount <= 9 { result = true }
        tryCount += 1
        return (strikeCount, ballCount)
    }
    
    func showGameScore() -> Bool {
        return result
    }
}
