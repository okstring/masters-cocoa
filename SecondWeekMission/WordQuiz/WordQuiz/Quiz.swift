import Foundation

struct Quiz {
    var wordList = ["I", "really", "really", "want", "to", "buy", "the", "new", "MacBook", "Pro"].shuffled()
    
    mutating func getWord() -> String? {
        return wordList.popLast()
    }
}
