import Foundation

class BubbleSort {
    private var array = Array<Int>()
    private var result = Array<Int>()
    init(of array: Array<Int>) {
        self.array = array
        self.result = array
    }
    
    func sorted(isAscending: Bool) -> Array<Int> {
        var swapped: Bool
        var temp = 0, swapCounter = 0
        var comparator: (Int, Int) -> Bool = (>)
        if !isAscending { comparator = (<) }
        
        func swap(aIndex: Int, bIndex: Int) {
            temp = self.result[aIndex]
            self.result[aIndex] = self.result[bIndex]
            self.result[bIndex] = temp
        }
        
        repeat {
            swapped = false
            for i in 0..<result.count - swapCounter - 1 {
                // Ascending: >, Descending: <
                if comparator(self.result[i], self.result[i + 1]) {
                    swapped = true
                    swap(aIndex: i, bIndex: i + 1)
                }
            }
            swapCounter += 1
        } while swapped
        
        return result
    }
}
