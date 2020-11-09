## 새로 알아간 것들

### 과제 피드백 - 변수 네이밍의 중요성

- 왠만하면 `print()` 보다는 `return`, 2차원 배열로 리턴하도록 노력

- 단수 복수도 신경써서 네이밍 해보자

- 영어를 바로 잘 할수는 없기 때문에 많이 읽어보고 더 나아가게하기

- **문제를 풀 때 값을 무작정 바꿔보는것 보다는 되는 방법을 예측하고 찾아가는 것이 훨신 중요함**

- 패턴을 정할때 어떤 구문을 써야 할지 `if`, `switch`, `guard` 등등

- [API 가이드 - 이름짓기](http://xho95.github.io/swift/language/grammar/revision/history/2020/10/08/API-Design-Guidelines.html#naming-%EC%9D%B4%EB%A6%84%EC%A7%93%EA%B8%B0) 꼭꼭 확인해보기

  

## String(repeat)

```swift
let str = String(repeating: "a", count: 5)
// "aaaaa"
```



## typealias

```swift
typealias ClapBody = Array<String>

func maekClapBody(lines : Int) -> ClapBody { // clapBody는 이전에 선언해줬던 Array로 인식
	// ...
```

### How to create a typealias?

It is declared using the keyword `typealias` as:

```
typealias name = existing type
```

In Swift, you can use `typealias` for most types. They can be either:

- **Built-in types** (for.eg: String, Int)
- **User-defined types** (for.e.g: class, struct, enum)
- **Complex types** (for e.g: closures)



## TDD (테스트 주도 개발, Test Driven Development)

## shadow

## 함수, 메소드를 선택할 때

그 함수를 쓰면 좋은 점이 무엇이고 안좋은 점은 무엇이 있을지

함수를 쓰게되면 코드의 양을 줄일 수 있는 등 좋은 점도 있지만 또 이로인해서 가독성이 안좋아지고 style에 안좋다던지 안좋은 점은 어떤것이 있는지

설득하고 설득 당할 수 있어야 한다



## guard

가드는 무엇보다 조건을 빨리 쳐내는 목적이 있는 구문

## `String(repeating: " ", count:spaces)`



# 수업

엔지니어들이 문제를 해결하려는 프로세스를 나타낸다면

입력 -> **처리** -> 출력

더 구체적으로는

입력 -> **분리 / 검증** -> **저장 / 생성** -> **형식 / 변환** -> 출력



역할들을 나누기 위해서는 `struct`를 잘 활용해야 한다

2차원배열로 구현해보기



## Stack, breakpoint, debugging

`breakpoint`로 `thread`에서 확인할 수 있다

`step over`로 다음 step을 진행할 수 있다

변수에 어떤 값이 담겨있는지 확인이 가능하다



## scope

파일 하나는 하나의 큰 scope와 같다

파일 다른것을 만들어서 불러올 수 있다

```swift
// main.swift
var hell = PrintHell()
hell.makeDiamond()

// PrintHell.swift
struct PrintHell {
    func makeDiamond() -> String {
        return "Hello"
    }
}
```



## readLine()

표준입력, 터미널에서 입력을 받기 위해 



## Array

### ContiguousArray

딱 붙어져있는 Array(A contiguously stored array)

탐색하는것이 더 빠르다

배열 요소에 접근하기위해 포인터 변수 활용

### Array

링크드리스트 개념으로 구현이 되어있다



## 재귀 호출 vs 반복문

| 재귀호출                                 | 반복문                                           |
| ---------------------------------------- | ------------------------------------------------ |
| 자기 자신을 반복                         | 특정 코드를 반복                                 |
| (끝나는 조건)을 비교                     | (반복하는 조건)을 비교                           |
| 호출할 때마다 부가적인 메모리가 필요하다 | 부가적인 메모리는 필요 없다(일반적으로 효율적임) |



## 기타

**파일 공유 시 파일 하나면 파일 하나 주소 아니면 커밋된 페이지를 공유하면 원페이지로 볼 수가 있다**