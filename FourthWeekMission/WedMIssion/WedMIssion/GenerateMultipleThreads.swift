import Foundation

class GenerateMultipleThreads {
    private var book = ""
    private let findWordsList = ["대중", "경제", "재산", "자유", "국제", "시장","사상", "부자", "학자", "개인", "욕망", "생활", "자원", "사람", "노동", "인물", "소비", "사회", "이론", "새로운"]
    var countWords = Dictionary<String, Int>()
    
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
    
    func useMain() {
        countWords = Dictionary<String, Int>()
        let beforeTime = Date().timeIntervalSince1970
        for word in findWordsList {
            findWords(of: word)
        }
        let afterTime = Date().timeIntervalSince1970
        print(countWords)
        print("\(afterTime - beforeTime)초")
    }
    
    func useThread() {
        countWords = Dictionary<String, Int>()
        let beforeTime = Date().timeIntervalSince1970
        for word in findWordsList {
            DispatchQueue.global().async {
                self.findWords(of: word)
            }
        }
        let afterTime = Date().timeIntervalSince1970
        
        sleep(2)
        
        print(countWords)
        DispatchQueue.main.async {
            print("\(afterTime - beforeTime)초")
        }
    }
}
