import Foundation

var A = Array(repeating: 0, count: 5)

A[0] = 1
A[1] = 4
A[2] = -1
A[3] = 3
A[4] = 2


var nodeMission = NodeMission()

nodeMission.enumerateList(A)
print(nodeMission.countOfList(A))
print(nodeMission.isFullList(A))

