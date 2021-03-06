//
//  1008.swift
//  BaekJoon Online Judge
//
//  Created by Jmy on 2021/06/11.
//

/**
 - 제목: A/B
 - 문제: 두 정수 A와 B를 입력받은 다음, A/B를 출력하는 프로그램을 작성하시오.
 - 입력: 첫째 줄에 A와 B가 주어진다. (0 `<` A, B `<` 10)
 - 출력: 첫째 줄에 A/B를 출력한다. 실제 정답과 출력값의 절대오차 또는 상대오차가 10-9 이하이면 정답이다.
       10-9 이하의 오차를 허용한다는 말은 꼭 소수 9번째 자리까지만 출력하라는 뜻이 아니다.
 - 원문: https://www.acmicpc.net/problem/1008
 */

class Problem_1008 {
  func solution_1() {
    let lineArr: [Double] = readLine()!.split(separator: " ").map{ Double($0)! }
    print(lineArr[0] / lineArr[1])
  }
  func solution_2() {
    print(1 / readLine()!.split(separator: " ").map{ Double($0)! }.reduce(1){ $1 / $0 })
  }
  func solution_3() {
    print(1/readLine()!.split{$0==" "}.map{Double($0)!}.reduce(1){$1/$0})
  }
  func solution_4() {
    let l=readLine()!.split{$0==" "};print(Double(l[0])!/Double(l[1])!)
  }
  func solution_5() {
    let quotient: Double = readLine()!
      .split{$0==" "}
      .map{Double($0)!}
      .reduce(1, { (result: Double, element: Double) -> Double in
        // 1 / 1 = 1
        // 3 / 1 = 3
        return element / result
        // 4 / 1 = 4
        // 5 / 4 = 1.25
      })
    print(1/quotient)
    // 0.3333333333333333
    // 0.8
  }
  func solution_6() {
    let quotient: Double = readLine()!
      .split{$0==" "}
      .map{Double($0)!}
      .reduce(into: 1, { (result: inout Double, element: Double) in
        // 1 / 1 = 1
        // 3 / 1 = 3
        result = element / result
        // 4 / 1 = 4
        // 5 / 4 = 1.25
      })
    print(1/quotient)
    // 0.3333333333333333
    // 0.8
  }
  /// https://www.acmicpc.net/short/status/1008/74/1
  /// 1등
  func solution_zzimss() {
    let l=readLine()!.split{$0==" "}.map{Double($0)!};print(l[0]/l[1])
  }
}
