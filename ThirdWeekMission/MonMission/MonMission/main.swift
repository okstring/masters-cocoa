import Foundation


var firstMatrix = Matrix(a: 2, b: 4, c: 2, d: 3)
var secondMatrix = Matrix(a: 3, b: 5, c: 3, d: 5)
var thirdMatrix = Matrix()

print(firstMatrix.sum(with: secondMatrix).a)
print(firstMatrix.product(with: secondMatrix).a)

print(thirdMatrix.sum(with: secondMatrix).a)
print(thirdMatrix.product(with: secondMatrix).a)


print(String(repeating: "-", count: 10))


var bubbleSort = BubbleSort(of: [1, 2, 4, 2, 4, 5, 1, 2, 6, 1, 2, 3])
print(bubbleSort.sorted(isAscending: false))


print(String(repeating: "-", count: 10))


var specialBinary = SpecialBinary(with: 5)
print(specialBinary.count)
print(specialBinary.find(by: 3))
