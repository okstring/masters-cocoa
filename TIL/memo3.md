# Framework

## Foundation

Access essential data types, collections, and operating-system services to define the base layer of functionality for your app.

Command Line Tool 등 collection, data type이 필요한 곳에 쓰임



## UIKit

Construct and manage a graphical, event-driven user interface for your iOS or tvOS app.

viewController 등 인터페이스 관련 클래스, 메소드들이 있는 프레임워크

# 새로 찾은 것들

## 배열을 생성하는 여러가지 방법들

```swift
// 빈 배열 선언하기
var empty: [Int] = []
var empty2 = [Int]()
var empty3: Array<Int> = []

// 임의의 데이터가 들어가 있는 배열 만들기
var a : Array<Int>  = [1,2,3,4]
var b : [Int] = [1,2,3,4]
var c = [1,2,3,4]//타입유추
var d = Array<Int>(1...4)//[1,2,3,4]

// 응용 - 2차원 배열
var arr = [[Int]](repeating: Array(repeating: 0, count: 1), count: 15)
```

[reference](https://zeddios.tistory.com/114)



## reduce

```swift
func reduce<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Element) throws -> Result) rethrows -> Result
```

### Closure

reduce, sorted를 이해하려면 Closure Expression Syntax를 이해해야 한다


![](https://images.velog.io/images/okstring/post/873bc501-c67e-432a-83a7-6dd5738b4de4/20201104_174056.png)



밑에서 리턴하는 결과는 모두 똑같다

```swift
var names: Array<String> = ["Chris", "Alex", "Ewa", "Barry", "Danialla"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reverseNames = names.sorted(by:backward)

var reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

var reversedNames = names.sorted(by: { s1, s2 in return s1 > s2}) // Inferring Type From context

var reversedNames = names.sorted(by: {s1, s2 in s1 > s2}) // Implicit Returns from Single-Expression Closures

var reversedNames = names.sorted(by: { $0 > $1 }) // Shorthand Argument Names
```

[reference](https://docs.swift.org/swift-book/LanguageGuide/Closures.html#:~:text=Swift%20automatically%20provides%20shorthand%20argument,%2C%20%242%20%2C%20and%20so%20on.)



**Closure 한번 더 꼼꼼하게 찾아보기!!!**




## stride

python에서는 `range()`처럼 start num > end num이 가능했었는데 

swift에서는 stride로 구현해야 한다 



## stride(from:to:by:)

```swift
func stride<T>(from start: T, to end: T, by stride: T.Stride) -> StrideTo<T> where T : Strideable
```



## stride(from:through:by:)

```swift
func stride<T>(from start: T, through end: T, by stride: T.Stride) -> StrideThrough<T> where T : Strideable
```

`through`는 마지막 숫자를 포함시키고 `to`는 포함시키지 않는다

```swift
for num in stride(from: 5, through: 1, by: -1) {
	print(num)
}
// 5
// 4
// 3
// 2
// 1

for num in stride(from: 5, to: 1, by: -1) {
	print(num)
}
// 5
// 4
// 3
// 2
```