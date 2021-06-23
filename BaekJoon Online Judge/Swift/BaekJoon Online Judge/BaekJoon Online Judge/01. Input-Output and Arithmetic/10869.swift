//
//  10869.swift
//  BaekJoon Online Judge
//
//  Created by Jmy on 2021/06/13.
//

// 사칙연산 - https://www.acmicpc.net/problem/10869

class Problem_10869 {
  func solution_1() {
    let line: String = readLine() ?? ""
    let lineArr: [String.SubSequence] = line.split(separator: " ")
    let a: Int = Int(lineArr[0]) ?? 0
    let b: Int = Int(lineArr[1]) ?? 0
    print(a + b)
    print(a - b)
    print(a * b)
    print(a / b)
    print(a % b)
  }
  func solution_2() {
    let lineArr: [Int] = readLine()!.split(separator: " ").map{ Int($0)! }
    let a: Int = lineArr[0]
    let b: Int = lineArr[1]
    print(a + b)
    print(a - b)
    print(a * b)
    print(a / b)
    print(a % b)
  }
}
