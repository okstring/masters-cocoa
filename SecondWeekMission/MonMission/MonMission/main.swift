// 연습문제 1-1
var myArray = ArrayPractice()
myArray.printArray(array: myArray.fillArray())

// 연습문제 1-2
var boolArray = myArray.setBoolArray()
myArray.printArray(array: boolArray, newChar: "$")

// 연습문제 1-3
var magicSquare = myArray.makeMagicSquare(row: 7)
myArray.printMagicSquare(array: magicSquare)


print(String(repeating: "-", count: 10))


var filterCharacter = FilterCharacter()
// 연습문제 2
print(filterCharacter.IDValidator(ID: "lsdfhgknepo"))

// 연습문제 3
print(filterCharacter.examinePassword(password: "asdfasdff!1"))

//// 연습문제 4
print(filterCharacter.isNationalIdectificationNumber(number: "1234561122330"))


print(String(repeating: "-", count: 10))


var otherMission = OtherMission()

// 연습문제 5
var antFunctionResultArr = otherMission.antFunction(inputArray: [1, 2, 3, 4, 5, 5, 1])
print(antFunctionResultArr)

// 연습문제 6
var duplicatedWordsArr = otherMission.duplicatedWords(inputWords: ["가을", "우주", "너굴", "우주", "겨울", "봄봄", "너굴", "너굴"])
print(duplicatedWordsArr)
