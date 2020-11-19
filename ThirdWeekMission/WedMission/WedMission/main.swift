import Foundation


var bracket = Bracket(paranthesis: .round)
print(bracket.generate(with: 3))
print(bracket.analyze(with: "()()()"))

