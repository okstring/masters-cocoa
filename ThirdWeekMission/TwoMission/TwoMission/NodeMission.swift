import Foundation


struct NodeMission {
    public func enumerateList(_ A: [Int]) {
        var lastNode = 0
        while lastNode != -1 {
            A[lastNode] != -1 ? print(A[lastNode], terminator: " -> ") : print(A[lastNode])
            lastNode = A[lastNode]
        }
    }

    public func countOfList(_ A: [Int]) -> Int {
        return A.count
    }

    public func isFullList(_ A: [Int]) -> Bool {
        func traversing (_ A: [Int]) -> Int {
            var count = 0; var lastNode = 0
            while lastNode != -1 {
                lastNode = A[lastNode]
                count += 1
            }
            return count
        }
        return countOfList(A) == traversing(A)
    }



}
