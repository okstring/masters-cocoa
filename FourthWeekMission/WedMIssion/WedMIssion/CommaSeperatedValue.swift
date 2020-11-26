import Foundation


struct CommaSeperatedValue {
    private var csvData: Array<Dictionary<String, Any>> = [[:]]
    private var rawData: String = ""

    init(of data: String) {
        self.rawData = data
        let componentsString = data.components(separatedBy: "\n").map({ $0.components(separatedBy: ", ") })
        let columns = componentsString[0]
        for rowIndex in 1..<componentsString.count {
            var row: Dictionary<String, Any> = [:]
            _ = columns.enumerated().map({ (colIndex, column) in
                row[column] = componentsString[rowIndex][colIndex]
            })
            self.csvData.append(row)
        }
    }

    mutating func add(name: String, email: String, language: String, grade: Int) {
        var row = Dictionary<String, Any>()
        row["name"] = name; row["email"] = email; row["language"] = language; row["grade"] = grade
        csvData.append(row)
    }

    func findBy(name: String) -> Dictionary<String, Any> {
        for row in csvData {
            if let rowName = row["name"] as? String {
                if rowName == name { return row }
            }
        }
        return Dictionary<String, Any>()
    }

    mutating func removeBy(email: String) -> Bool {
        for row in csvData {
            if let index = csvData.firstIndex(where: { _ in row["email"] as? String ?? "" == email }) {
                self.csvData.remove(at: index)
                return true
            }
        }
        return false
    }

    mutating func write(to file: String) -> Bool {
        let desktopPath = "/Users/maylily/Desktop"
        let desktopPathURL = URL.init(fileURLWithPath: "/Users/maylily/Desktop")
        let csvPath = "\(file).csv"
        var value = ""
        
        if let lastRow = csvData.last {
            value += lastRow.keys.joined(separator: ", ") + "\n"
        }
        for row in csvData {
            for (index, col) in row.values.enumerated() {
                value += index == row.values.count - 1 ? "\(col)" : "\(col), "
            }
            value += "\n"
        }
        
        do {
            let exploreFile = ExploreFile()
            if exploreFile.isExist(filename: csvPath, at: desktopPath) { return false }
            
            try value.write(to: desktopPathURL.appendingPathComponent(csvPath), atomically: false, encoding: .utf8)
            return true
            
        } catch let error as NSError {
            print("Error : \(error.localizedDescription)")
            return false
        }
    }
}
