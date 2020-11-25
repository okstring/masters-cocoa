import Foundation

class GenerateMultipleThreads {
    private var book = ""
    private let findWordsList = ["대중", "경제", "재산", "자유", "국제", "시장","사상", "부자", "학자", "개인", "욕망", "생활", "자원", "사람", "노동", "인물", "소비", "사회", "이론", "새로운"]
    private var lap:TimeInterval = 0
    var countWords = Dictionary<String, Int>()
    var group = DispatchGroup()

    func readBook(by fileName: String) {
        let path = FileManager.default.urls(for: .desktopDirectory, in: .userDomainMask)[0].appendingPathComponent(fileName)
        do {
            try self.book = String(contentsOf: path, encoding: .utf8)
        } catch let error as NSError {
            print(error)
        }
    }
    private func findWords(of word: String) {
        countWords[word] = self.book.components(separatedBy: word).count - 1
    }

    func unusedDispatchQueue() {
        countWords = Dictionary<String, Int>()
        lap = 0
        let beforeLap = Date().timeIntervalSince1970
        for word in self.findWordsList{
            findWords(of: word)
        }
        let afterLap = Date().timeIntervalSince1970
        print(afterLap - beforeLap)
        print(countWords)
    }

    func usedDispatchQueue() {
        countWords = Dictionary<String, Int>()
        lap = 0
        let beforeLap = Date().timeIntervalSince1970
        for word in self.findWordsList{
            group.enter()
            print("\(word)이(가) 작업에 들어갑니다.")
            DispatchQueue.global().async {
                self.findWords(of: word)
                print("\(word) 카운팅 작업이 끝났습니다.")
                self.group.leave()
            }
        }
        
        group.notify(queue: .main, execute: {
            let afterLap = Date().timeIntervalSince1970
            print(afterLap - beforeLap)
            print(self.countWords)
        })
    }
}
