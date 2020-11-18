//import Foundation
//
//private class Node<T> {
//    fileprivate var next: Node<T>?
//    fileprivate var data: T
//    init(data: T) {
//        next = nil
//        self.data = data
//    }
//}
//
//public struct LinkedList<T> {
//    private var head: Node<T>? = nil
//    private var _count: Int = 0
//    
//    public mutating func push(_ element: T) {
//        let node = Node<T>(data: element)
//        node.next = head
//        head = node
//        _count += 1
//    }
//    
//    public mutating func pop() -> T? {
//        guard !isEmpty else { return nil }
//        
//        let item = head?.data
//        head = head?.next
//        _count = _count - 1
//        return item
//    }
//    
//    public func peek() -> T? {
//        return head?.data
//    }
//    
//    public var isEmpty: Bool {
//        return count == 0
//    }
//    
//    public var count: Int {
//        return _count
//    }
//    
//}
