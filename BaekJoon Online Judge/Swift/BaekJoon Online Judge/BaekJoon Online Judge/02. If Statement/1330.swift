//
//  1330.swift
//  BaekJoon Online Judge
//
//  Created by Jmy on 2021/06/18.
//

// 두 수 비교하기 - https://www.acmicpc.net/problem/1330

class Problem_1330 {
  func solution_1() {
    let lineArr: [Int] = readLine()!.split(separator: " ").map{ Int($0)! }
    let a: Int = lineArr[0]
    let b: Int = lineArr[1]
    if a > b {
      print(">")
    } else if a < b {
      print("<")
    } else {
      print("==")
    }
  }
}
