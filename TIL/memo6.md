# 새로 알아간 것들



```swift
// 연속되는 수 배열로 바로 만들기
var continuousNumberArr = Array<Int>(1...5)
print(continuousNumberArr)

// [1, 2, 3, 4, 5]
```



## 정규식 예제

```swift
func isPossibleCharacter(str: String) -> Bool {
    let pattern = "[A-Za-z0-9\\-]{5,23}" // 5자 이상 23자 이하 소문자, 대문자, "-"를 찾기
    let regex = try! NSRegularExpression(pattern:pattern, options:[])
    let range = NSRange(location: 0, length: str.utf16.count) // NSRange
    let n = regex.firstMatch(in: str, options: [], range: range) // furstMatch 첫번째로 조건에 만족하는 것 위치를 반환한다
    if n == nil { // 찾는 조건이 없으면 nil을 반환하므로 
        return false
    }
    return true
}
```



## 정규식 - 탐색 메소드

```swift
// 탐색에 쓰이는 메소드는 크게 네 가지로 나뉜다

numberOfMatches(in:options:range:) -> Int // – 테스트 결과 매치되는 영역의 개수를 리턴한다.
firstMatch(in:options:range:) -> TextCheckingResult? // – 첫 매치를 리턴한다.
matches(in:options:range:) -> [TextCheckingResult] // – 모든 매치를 리턴한다.
enumerateMatches(in:options:range:using) // – 각 매치에 대해서 블럭을 적용한다.
```

https://soooprmx.com/archives/6710





## 문자열의 인덱싱 - Array와 다르다........... String.index

```swift
let str = "abcde"
print(str[0]) 
// 'subscript(_:)' is unavailable: cannot subscript String with an Int, use a String.Index instead.
// Array와 같다고 생각하면 오산

print(str[str.startIndex])
// "a"
// 이렇게 해야한다

print(str[str.endIndex])
// String index is out of bounds
// String.index는 5를 반환한다

let endIndex = str.index(before: str.endIndex) // before - 1, after + 1
print(str[endIndex])
// 이렇게 해야 마지막 인덱스를 설정 가능하다

let startIndex = str.index(str.startIndex, offsetBy: 2) // 세 번째 숫자
print(str[startIndex])
// 중간에 있는 문자 인덱싱은 이렇게

```

http://seorenn.blogspot.com/2018/05/swift-string-index.html



## String을 Array로 변환 시 주의사항

```swift
let arrayofstring = Array("Hello") // 각 value는 string.character로 변환되니 주의!!!
```



## dictionary

```swift
var dic : [Int : String] = [:]
var dic2 = [Int : String]()
var dic3 : Dictionary = [Int:String]()
var dic4 : Dictionary<Int, String> = Dictionary<Int, String>()

출처: https://zeddios.tistory.com/129 [ZeddiOS]
```



```swift
// dictionary 해당 key의 value 값을 초기에 설정하려면
var countVAlueDict: [String:Int] = [:]
var inputWords = ["a", "b", "b", "c"]
for value in inputWords {
    countValueDict[value, default: 0] += 1 // default를 써주면 된다
}
```



# as







