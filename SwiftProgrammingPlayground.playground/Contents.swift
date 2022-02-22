import Cocoa
import Darwin

var greeting = "Hello, playground"
let hello = "nan"  //constant - can not change later
print(greeting)

// Basic Data Types
let intValue : Int = 5
let doubleVa : Double = 5.0
let str : String = "Yo this is String"
let boolValue : Bool = true

// Multiple: variable at same time + optional
var x, y, z : Int?

var optionalInt : Int?

// Fun Stuff
let 😄 = "d"
print(😄)

print(greeting + hello)
let name = "wang"
print("Hello \(name)")

/*
 dddddd
 */
print("Int min = \(Int.min)")
print("Int max = \(Int.max)")
print("UIInt max = \(UInt64.max)")
// Double has longer length than int

let binaryVal = 0b011
let octalValue = 0o237
let hexaValue = 0xE
print(binaryVal)

let tupleValue = (404, "Not Found")
print(tupleValue.0)
print(tupleValue.1)


let (id, status) = (404, "Not Found")
print(id)
print(status)


//Optionals

var strName : String?
print(strName)
strName = "Yo"
print(strName)
print(strName!)

if strName != nil{
    print(strName!)
}

// if let statement
if let name = strName {
    print(name)
}

func sampleFunctionForGuard(strName: String? ){
    // print string
    guard let name = strName else { return }
    
    print(name)
    
}

