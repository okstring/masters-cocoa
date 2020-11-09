## 프로시저

예전에는 리턴값이 없는 함수를 프로시저라고 불렀다.

## 변수(상수) 이름 짓기

- 길이제한 없음
- 첫 문자는 문자(유니코드, 알파벳), $, _ 만 가능
- 숫자로 시작하면 안됨
- 카멜표기법 (Camel case)
- 예약어는 안되고, _, $로 시작하는 변수도 권장하지 않음

## 부동 소수형

### Float

부호(1자리) + 지수(8자리) + 가수(23자리) = 32비트

```
single-precision 32-bit IEEE 754 floating point
```

### Double

부호(1자리) + 지수(11자리) + 가수(52자리) = 64비트

```
double-precision 64-bit IEEE 754 floating point
```



## 다른 언어와 비교해서 스위프트 문법을 나름대로 정리해본다.

`Dictionary`

```swift
// Dictionary 값 할당
var responseMessages = [200: "OK",
                        403: "Access forbidden",
                        404: "File not found",
                        500: "Internal server error"]

// emptyDict
var emptyDict: [String: String] = [:]

// uses key-based
let httpResponseCodes = [200, 403, 301]
for code in httpResponseCodes {
    if let message = responseMessages[code] {
        print("Response \(code): \(message)")
    } else {
        print("Unknown response \(code)")
    }
}
// Prints "Response 200: OK"
// Prints "Response 403: Access Forbidden"
// Prints "Unknown response 301"

var interestingNumbers = ["primes": [2, 3, 5, 7, 11, 13, 17],
                          "triangular": [1, 3, 6, 10, 15, 21, 28],
                          "hexagonal": [1, 6, 15, 28, 45, 66, 91]]
for key in interestingNumbers.keys {
    interestingNumbers[key]?.sort(by: >)
}

print(interestingNumbers["primes"]!)
// Prints "[17, 13, 11, 7, 5, 3, 2]"
```





## Xcode Playground에서 원하는 형태로 함수를 선언하고 호출하는 코드를 연습한다.



### 오늘 배운 메소드 (Method)

### **components**

`func components(separatedBy separator: String) -> [String]`

### **split**

`func split(separator: Character, maxSplits: Int = Int.max, omittingEmptySubsequences: Bool = true) -> [Substring]`

String.components와 String.split은 비슷하다

**Conclusion** : `split(separator:)` is faster than `components(separatedBy:)`.



### `characterSet.decimalDigits.inverted`

- 십진수의 반대가(문자열) 리턴된다

### `joined()`

- Array를 join하여 String으로 반환

### `contains`

해당 문자열(String)에 비교하는 문자가 있는지 확인

```swift
// sort() vs sorted()

// sort()는 mutable 
var students = ["Kofi", "Abena", "Peter", "Kweku", "Akosua"]
students.sort()
print(students)
// Prints "["Abena", "Akosua", "Kofi", "Kweku", "Peter"]"

// sorted()는 immutable 
let students: Set = ["Kofi", "Abena", "Peter", "Kweku", "Akosua"]
let sortedStudents = students.sorted()
print(sortedStudents)
// Prints "["Abena", "Akosua", "Kofi", "Kweku", "Peter"]"
```



## Swift 기본 타입 - Int, Float, Double, String, Boolean 에 대해서 학습하고 정리한다.

### Int(정수)

Integer. 부호 있는 정수값 (127 ~ -128 까지 저장이 가능하다.)

### Float, Double (부동소숫점)

실수 범위이다. Float는 32bit, Double은 그 두 배인 64bit까지 표현 가능하다.



##### Float

부호(1자리) + 지수(8자리) + 가수(23자리) = 32비트

```
single-precision 32-bit IEEE 754 floating point
```



##### Double

부호(1자리) + 지수(11자리) + 가수(52자리) = 64비트

```
double-precision 64-bit IEEE 754 floating point
```

### String

`let str = "Hello!"`



여러줄을 나눠 쓸 때는

```swift
let str = """
He said,
Hello World!
"""
```



문자열 길이 반환: `str.count`



루프를 통해 전체 String에 접근하기

```swift
let str = "Hello"
for char in str {
	print(char)
}
```



`enumerated()`

```swift
for (index, value) in str.enumerated() {
	print("\(index). \(value)")
}
```



개별 인덱스 접근 가능하다

```swift
let str = "Hello!"
str[str.index(str.startIndex, offsetBy: 1)]
// "e"
```





### Boolean

`true` or `false`

- 타입 안전성(type safety)을 위해 boolean 값이 아닌 (non-Boolean)값으로 치환되는 것을 막아줍니다

- ```swift
  let i = 1 if i { // this example will not compile, and will report an error }
  ```

  



