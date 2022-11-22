//
//  main.swift
//  MyCreditManager
//
//  Created by 황윤경 on 2022/11/21.
//

import Foundation

let manager = Manager()
var exit = false

while !exit {
    print(manager.listMessage)
    guard let input = readLine() else {
        print(manager.errorMessage)
        continue
    }
    
    switch input {
    case "1":
        manager.addStudent()
    case "2":
        manager.deleteStudent()
    case "3":
        manager.addScore()
    case "4":
        manager.deleteScore()
    case "5":
        manager.printAverage()
    case "X":
        print(manager.exitMessage)
        exit = true
    default:
        print(manager.errorMessage)
    }
}
