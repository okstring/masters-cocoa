import Foundation

let some = BackgroundWork()

func foo() {
    print("Hello")
}

some.doTimeConsumingOperation(operation: foo())
some.doTimeConsumingOperation(operation: foo())


var fileManager = FileManager.default
print(try fileManager.contentsOfDirectory(atPath: "/System/Library/Desktop Pictures"))
print(fileManager.currentDirectoryPath)



