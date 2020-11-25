import Foundation

class GenerateMultipleThreads {
    private var book = ""
    private let findWordsList = ["대중", "경제", "재산", "자유", "국제", "시장","사상", "부자", "학자", "개인", "욕망", "생활", "자원", "사람", "노동", "인물", "소비", "사회", "이론", "새로운"]
    private var lap: TimeInterval = 0

    func readBook(by fileName: String) {
        let path = FileManager.default.urls(for: .desktopDirectory, in: .userDomainMask)[0].appendingPathComponent(fileName)
        do {
            try self.book = String(contentsOf: path, encoding: .utf8)
        } catch let error as NSError {
            print(error)
        }
    }
    private func findWords() {
        lap = 0
        var countWords = Dictionary<String, Int>()
        for word in self.findWordsList {
            let beforeLap = Date().timeIntervalSince1970
            countWords[word] = self.book.components(separatedBy: word).count - 1
            let afterLap = Date().timeIntervalSince1970
            lap += afterLap - beforeLap
        }
        print(countWords)
        print(lap)
    }

    func unusedDispatchQueue() {
        findWords()
    }

    func usedDispatchQueue() {
        DispatchQueue.main.async {
            self.findWords()
        }
    }
}
