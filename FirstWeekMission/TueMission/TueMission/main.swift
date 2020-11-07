//
//  main.swift
//  TueMission
//
//  Created by Maylily on 2020/11/06.
//

import Foundation

struct MyPoint {
    var myX: Float
    var myY: Float
    
    func printPoint() -> (Float, Float){
        return (myX, myY)
    }
    
    mutating func setX(x: Float) {
        myX = x
    }
    
    mutating func setY(y: Float) {
        myY = y
    }
    
    func getDistanceTo(toPoint: MyPoint) -> Float {
        let dx = (self.myX - toPoint.myX)
        let dy = (self.myY - toPoint.myY)
        return sqrt(dx * dx + dy * dy)
    }
    
    func printPoints(width: Float, height: Float) -> Rectangle {
        let leftTopPoint = self
        let rightBottomPoint = MyPoint(myX: self.myX + width, myY: self.myY - height)
        let rect = Rectangle(leftTop: leftTopPoint, rightBottom: rightBottomPoint)
        return rect
    }
}

struct Rectangle {
    var leftTop: MyPoint
    var rightBottom: MyPoint
    
    func printRact() -> String {
        return "leftTop: (\(leftTop.myX), \(leftTop.myY)),\nleftBottom: (\(leftTop.myX), \(rightBottom.myY)),\nrightTop:(\(rightBottom.myX), \(leftTop.myY)), \nrightBottom:(\(rightBottom.myX), \(rightBottom.myY))"
    }
    
    func printArea() -> Float {
        let width = rightBottom.myX - leftTop.myX
        let height = leftTop.myY - rightBottom.myY
        return width * height
    }
    
    func printCenter() -> (Float, Float) {
        let centerX = (rightBottom.myX + leftTop.myX) / 2
        let centerY = (rightBottom.myY + leftTop.myY) / 2
        return (centerX, centerY)
    }
    
    mutating func moveTo(delta: MyPoint) {
        self.leftTop.setX(x: self.leftTop.myX + delta.myX)
        self.leftTop.setY(y: self.leftTop.myY + delta.myY)
        self.rightBottom.setX(x: self.rightBottom.myX + delta.myX)
        self.rightBottom.setY(y: self.rightBottom.myY + delta.myY)
    }
}

var rect = Rectangle(leftTop: MyPoint(myX: 4.5, myY: 10.5), rightBottom: MyPoint(myX: 15, myY: 3.5))

print(rect.printRact())
print(rect.printArea())
print(rect.printCenter())

var pointA = MyPoint(myX: 2.5, myY: 15.8)
print(pointA.printPoint())

pointA.setX(x: 15.2)
pointA.setY(y: 7.4)

print("pointA=(\(pointA.myX), \(pointA.myY))")

var pointB = MyPoint(myX: 15, myY: 12.2)

print(pointA.getDistanceTo(toPoint: pointB))


var diffRect = Rectangle(leftTop: MyPoint(myX: 0, myY: 0), rightBottom: MyPoint(myX: 0, myY: 0))
print(diffRect.printRact())
print(diffRect.printArea())
print(diffRect.printCenter())


print("-----")

var pointC = MyPoint(myX: 5, myY: 5)
var rectB = pointC.printPoints(width: 5, height: 10)
print(rectB.printRact())

print("-----")

rectB.moveTo(delta: MyPoint(myX: -3, myY: 1.5))
print(rectB.printRact())


func whatIsGrade(point: Int) -> Character {
    if point >= 90 {
        return "A"
    } else if point >= 80 {
        return "B"
    } else if point >= 70 {
        return "C"
    } else if point >= 60 {
        return "D"
    } else {
        return "F"
    }
}

func gugu(dan: Int) {
    for n in 1...9 {
        print("\(dan) * \(n) = \(dan * n)")
    }
}

func makeAll() {
    for dan in 1...9 {
        gugu(dan: dan)
    }
}

makeAll()

func makeGugu(maxDan: Int) {
    for dan in 1...maxDan {
        gugu(dan: dan)
    }
}

makeGugu(maxDan: 5)
