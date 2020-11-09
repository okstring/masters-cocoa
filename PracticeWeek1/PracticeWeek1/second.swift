import Foundation

func printDiamond(lines: Int) -> Array<Array<String>> {
    let result: Array<Array<String>> = []
    
    for index in 1...lines {
        let middle = (lines + 1) / 2
        let values = (index <= middle) ? index * 2 - 1 : (lines - index) * 2 + 1
        let spaces = (index <= middle) ? middle - index : index - middle - (1 - lines % 2)
        print("middle = \(middle), values = \(values), spaces = \(spaces)")
        
    }
    return result
}
