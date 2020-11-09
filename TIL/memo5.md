## 새로 알아간 것들

```swift
// 소수점 반올림 없이 자르기
let numberFormatter = NumberFormatter()
numberFormatter.roundingMode = .floor         // 형식을 버림으로 지정
numberFormatter.minimumSignificantDigits = 2  // 자르길 원하는 자릿수
numberFormatter.maximumSignificantDigits = 2
let originalNum = 1.6759402                   // 원하는 숫자
let newNum = numberFormatter.string(from: originalNum) // result 1.67
```

[reference](https://medium.com/@twih1203/swift5-numberformatter%EB%A1%9C-%EC%86%8C%EC%88%98%EC%A0%90-%EC%95%84%EB%9E%98-%EC%9E%90%EB%A6%BF%EC%88%98-%EB%B0%98%EC%98%AC%EB%A6%BC-%EC%97%86%EC%9D%B4-%EC%9E%90%EB%A5%B4%EA%B8%B0-ee33219e3cdd)



## fibonacci

```swift
	func fibonacci(num: Int) -> Int {
        if num == 1 { return 1}
        return fibonacci(num: num - 1) + num
    }
```



## Components vs split 

```swift
var str = "OOOXX"
print(str.components(separatedBy: "X"))
print(str.split(separatedBy: "X"))

// ["OOO", "", ""]
// ["OOO"]
```





## Swift Closures 에 유용한 Method 

## reduce

```swift
func reduce<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Element) throws -> Result) rethrows -> Result
```



## map

```swift
func map<T>(_ transform: (Element) throws -> T) rethrows -> [T]
```



## filter

```swift
func filter(_ isIncluded: (Self.Element) throws -> Bool) rethrows -> [Self.Element]
```

