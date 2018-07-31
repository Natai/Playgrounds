//: Playground - noun: a place where people can play

import Foundation

class FloatingViewProtocolComponent {
    var isDraggable = true
    
    public init() {}
}

protocol FloatingViewProtocol {
    var component: FloatingViewProtocolComponent { get }
    
    var isDraggable: Bool { get set }
    var isAutoPartiallyHide: Bool { get set }
    var isAutoAdsorb: Bool { get }
}

extension FloatingViewProtocol {
    var isDraggable: Bool {
        get { return component.isDraggable }
        set { component.isDraggable = newValue }
    }
    
    var isAutoAdsorb: Bool {
        return true
    }
}

class FloatingViewDefault: FloatingViewProtocol {
    var component = FloatingViewProtocolComponent()
    var isAutoPartiallyHide = true
}

class FloatingViewCustom: FloatingViewProtocol {
    var component = FloatingViewProtocolComponent()
    let isDraggable = false
    // { get set } 提供了默认值的，可以声明为 let 属性, 也可以声明为 read-only 属性
//    var isDraggable = false
//    var isDraggable: Bool {
//        return false
//    }
    var isAutoPartiallyHide = false
    // { get set } 未提供默认值的，不可声明为 let 属性，也不可声明为 read-only 属性
//    let isAutoPartiallyHide = false
//    var isAutoPartiallyHide: Bool {
//        return false
//    }
    var isAutoAdsorb = false
    // { get } 属性可以声明为 let 属性、read-only 属性、read-write 属性
//    let isAutoAdsorb = false
//    var isAutoAdsorb: Bool {
//        return false
//    }
//    var isAutoAdsorb: Bool {
//        get {
//            return false
//        }
//        set { }
//    }
}

var defaultFloating = FloatingViewDefault()
defaultFloating.isDraggable
defaultFloating.isAutoPartiallyHide
defaultFloating.isDraggable = false
defaultFloating.isAutoPartiallyHide = false
defaultFloating.isDraggable
defaultFloating.isAutoPartiallyHide
// 不可给对象的 { get } 属性重新赋值
//defaultFloating.isAutoAdsorb = false

let customFloating = FloatingViewCustom()
customFloating.isDraggable
customFloating.isAutoAdsorb
customFloating.isAutoPartiallyHide
