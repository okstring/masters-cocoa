import Foundation

// MARK:- Mission1
var interestCalcurator = GetInterestRate()

func testInterest(unitDay: Int) -> Double {
    func recursiveCulcurator(addDay: Int) {
        if addDay > 365 {
            return
        }
        // 소수점 이하 올림, Int형 변환(소수점 절삭)
        print("거치일: \(String(addDay))일 \(String(Int(ceil(interestCalcurator.calculateAmount(day: addDay, amount: 1_000_000)))))원")
        recursiveCulcurator(addDay: addDay + unitDay)
    }
    recursiveCulcurator(addDay: unitDay)
    return interestCalcurator.calculateAmount(day: 365, amount: 1_000_000)
}

print("거치일: 365일 \(String(Int(ceil(testInterest(unitDay: 10)))))원")


// MARK:- MIssion2(TestCode)
/// 3 strike가 나올때까지 while loop
var result: Bool = false
while true {
    var newGame = NewGame()
    print(newGame.hit(num: 123))
    print(newGame.hit(num: 234))
    print(newGame.hit(num: 345))
    print(newGame.hit(num: 456))
    print(newGame.hit(num: 567))
    print(newGame.hit(num: 678))
    print(newGame.hit(num: 789))
    print(newGame.hit(num: 890))
    print(newGame.hit(num: 012))
    if newGame.showGameScore() { break }
}
