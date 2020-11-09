## 새로 알아간 것들

```swift
// 연속되는 수 배열로 바로 만들기
var continuousNumberArr = Array<Int>(1...5)
print(continuousNumberArr)

// [1, 2, 3, 4, 5]
```





자바스크립트 기준으로 아래와 같이 작성하면 되는데
**var patten=/(\w)\1+/g;**
예를 들어 'aaabbc'라는 단어가 있다면 'aaa', 'bb'를 찾아준다.
위표현식을 잘 응용하면 여러 곳에 유용하게 사용 가능하다.(사실 정규식을 잘 아는 사람이라면 쉽겠지만..)



https://blogdeveloperspot.blogspot.com/2019/09/regular-expression-find-repeating.html



https://qastack.kr/programming/1649435/regular-expression-to-limit-number-of-characters-to-10



https://soooprmx.com/archives/6710





**import** Foundation



**do** {

  **let** str = "331111238"

  **let** pattern = "333" // 8앞의 숫자 3개 --> 567 밖에 없다.

  **let** regex = **try** NSRegularExpression(pattern:pattern, options:[])

  **let** range = NSRange(location: 0, length: str.utf16.count)

  **if** **let** n = regex.firstMatch(in:str, options:[], range: range) {

​    print(n.range(at: 0)) // prints "567"

  }

} **catch** {

  print("Ho")

}



10



Unless I'm missing something, it's easier than either of the other answers:

```swift
let arrayofstring = Array("Hello")
// String.character야 이양아ㅏ아앙
```







http://seorenn.blogspot.com/2018/05/swift-string-index.html





dictionary

var emptyDict: [String: String] = [:]







