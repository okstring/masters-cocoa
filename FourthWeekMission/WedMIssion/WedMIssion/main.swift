import Foundation

let exploreFile = ExploreFile()
print(exploreFile.files(at: "/Users/maylily/Desktop"))
print(exploreFile.isExist(filename: "Hi.csv", at: "/Users/maylily/Desktop"))

print(String(repeating: "-", count: 15))

var masters = """
name, email, language, grade
JK, jk@codesquad.kr, swift, 5
head, head@codesquad.kr, JS, 3
honux, honux@codesquad.kr, SQL, 1
crong, crong@codesquad.kr, TS, 2
"""
var csvManager = CommaSeperatedValue(of: masters)
csvManager.add(name: "Issac", email: "okstring@kakao.com", language: "swift", grade: 1)
print(csvManager.findBy(name: "Issac"))
print(csvManager.removeBy(email: "head@codesquad.kr"))
print(csvManager.write(to: "HiHello"))

print(String(repeating: "-", count: 15))

var generateMultipleThread = GenerateMultipleThreads()
generateMultipleThread.readBook(by: "bookfile.txt")
generateMultipleThread.unusedDispatchQueue()
print("---")
generateMultipleThread.usedDispatchQueue()
RunLoop.main.run()
