import Foundation

struct ExploreFile {
    func files(at path: String) -> Array<String> {
        let fileManager = FileManager.default
        do {
            return try fileManager.contentsOfDirectory(atPath: path)
        } catch let error as NSError {
            print(error)
            return Array<String>()
        }
    }

    func isExist(filename: String, at path: String) -> Bool {
        let fileManager = FileManager.default
        let path = URL(fileURLWithPath: path).appendingPathComponent(filename).path
        return fileManager.fileExists(atPath: path)
        
    }
}
