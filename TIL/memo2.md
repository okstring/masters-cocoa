1. 함수로 표현되는, 알고리즘으로 표현되는 절차(선언, 호출)

2. 데이터를 표현하기 위해서 작은 타입들을 묶어서 큰 타입으로 묶어서 하는 것을 반복하게 된다(선언, 할당)



## left hand side  right hand side

`let result = intValue % intValue2`

## 연산자  계산 순서

| 구분        | 연산자     | 우선순위 |
| ----------- | ---------- | -------- |
| 단항 연산자 | +. -, !. ~ | 1        |
| 산술 연산자 | *, /, %    | 2        |
| 산술 연산자 | +, -       | 3        |



## 삼항연산자 - Conditional operator

`doBlindDateFlag = (point>=80) ? true : false`



## 사전 - dictionary

```swift
var gradeDic = ["a" : 90, "b" : 80, "c" : 70, "d" : 60]
print(gradeDic["a"] ?? 0) // 값이 없을시 0을 출력
```



## 집합set

순서없이 저장, Array와 비슷하되 `: Set` 붙여줘야 한다

```swift
var aSet: Set = [11, 12, 13]
aSet.contains(12)
```



## struct 

생성 시 메모리를 할당받고 변수를 복사하게 된다

안에서 계산하는 함수(메소드)하고 출력하는 함수는 따로 만드는 것이 좋다



## Method

struct, class에서 가지고 있는 함수를 메서드라 한다

```swift
let someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}
// Prints "The last letter of the alphabet"
// fallthou
```



## while, do-while

```swift
// while문과 차이점은 do 먼저 실행하고 조건을 검사한다
do {
    square2 += board2[square2]
    if ++diceRoll2 == 7 { diceRoll2 = 1 }
    square2 += diceRoll2    
} while square2 < finalSquare

```





## 새로 찾은 것들

### `mutating func`

struct의 Method가 구조체 내부에서 데이터를 수정할 때에는 mutating 키워드를 선언해줘야 한다

mutating을 안붙여주면 컴파일 에러가 남



### Swift Math : abs, sqrt, pow, floor, ceil

```swift
abs(-9) // 9
sqrt(9) // 3 
// 참고로 sqrt는 func squrt(_: Double) -> Double
pow(3, 2) // 9
floor(9.1) // 9
ceil(9.1) // 10
```



### swift extract regex matches

```swift
func matches(for regex: String, in text: String) -> [String] {

    do {
        let regex = try NSRegularExpression(pattern: regex)
        let results = regex.matches(in: text,
                                    range: NSRange(text.startIndex..., in: text))
        return results.map {
            String(text[Range($0.range, in: text)!])
        }
    } catch let error {
        print("invalid regex: \(error.localizedDescription)")
        return []
    }
}
```

Example:

```swift
let string = "🇩🇪€4€9"
let matched = matches(for: "[0-9]", in: string)
print(matched)
// ["4", "9"]
```