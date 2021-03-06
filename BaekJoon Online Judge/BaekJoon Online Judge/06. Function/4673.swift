//
//  4673.swift
//  BaekJoon Online Judge
//
//  Created by Jmy on 2021/07/17.
//

/**
 - 제목: 셀프 넘버
 - 문제: 셀프 넘버는 1949년 인도 수학자 D.R. Kaprekar가 이름 붙였다. 양의 정수 n에 대해서 d(n)을 n과 n의 각 자리수를 더하는 함수라고 정의하자. 예를 들어, d(75) = 75+7+5 = 87이다.
       양의 정수 n이 주어졌을 때, 이 수를 시작해서 n, d(n), d(d(n)), d(d(d(n))), ...과 같은 무한 수열을 만들 수 있다.
       예를 들어, 33으로 시작한다면 다음 수는 33 + 3 + 3 = 39이고, 그 다음 수는 39 + 3 + 9 = 51, 다음 수는 51 + 5 + 1 = 57이다. 이런식으로 다음과 같은 수열을 만들 수 있다.
       33, 39, 51, 57, 69, 84, 96, 111, 114, 120, 123, 129, 141, ...
       n을 d(n)의 생성자라고 한다. 위의 수열에서 33은 39의 생성자이고, 39는 51의 생성자, 51은 57의 생성자이다. 생성자가 한 개보다 많은 경우도 있다. 예를 들어, 101은 생성자가 2개(91과 100) 있다.
       생성자가 없는 숫자를 셀프 넘버라고 한다. 100보다 작은 셀프 넘버는 총 13개가 있다. 1, 3, 5, 7, 9, 20, 31, 42, 53, 64, 75, 86, 97
       10000보다 작거나 같은 셀프 넘버를 한 줄에 하나씩 출력하는 프로그램을 작성하시오.
 - 입력: 입력은 없다.
 - 출력: 10,000보다 작거나 같은 셀프 넘버를 한 줄에 하나씩 증가하는 순서로 출력한다.
 - 원문: https://www.acmicpc.net/problem/4673
 */

// 1 + 1 + 0
// n + n%10 + n/10 if != 0 {  }
// n + n의 1의 자리 + n을 10으로 나눈 다음 1의 자리 + n을 10으로 나눈 값을 10으로 나눈 다음 1의 자리 // 0이 아닐 때까지
// 97 + 7 + 9 + 0 == 113
// 97 + 7 + if 9 != 0 { sum += 9 } + 0 == 113
// n + n%10 + if n/10 != 0 { sum += n/10%10 } + ((n/10)/10) if != 0 {  }
// 123 + 3 + 2 + 1 + 0
// n + n%10 + n/10%10 + n/10%10/10
// 1234 + 4 + 3 + 2 + 1 + 0
// n + n%10 + n/10%10 + n/10%10/10

class Problem_4673 {
  func solution_1() {
    var s: Set<Int> = []
    for n in 1...10000 {
      s.insert(d(n))
      
      if !s.contains(n) {
        print(n)
      }
    }
  }
  func d(_ n: Int) -> Int {
    var sum = n, now = n
    while now != 0 {
      sum += now % 10
      now /= 10
    }
    return sum
  }
  func solution_2() {
    var s: Set<Int> = []
    for n in 1...10000 {
      var sum = n, now = n
      while now != 0 {
        sum += now % 10
        now /= 10
      }
      s.insert(sum)
      
      if !s.contains(n) {
        print(n)
      }
    }
  }
  func solution_3() {
    var s: Set<Int> = []
    for n in 1...10000 {
      s.insert(String(n).map{Int(String($0))!}.reduce(0,+)+n)
      
      if !s.contains(n) {
        print(n)
      }
    }
  }
  func solution_4() {
    var s:Set<Int>=[];for n in 1...10000{s.insert(String(n).map{Int(String($0))!}.reduce(0,+)+n);if !s.contains(n){print(n)}}
  }
  func solution_5() {
    var s:Set<Int>=[];for n in 1...10000{s.insert(String(n).map{Int("\($0)")!}.reduce(0,+)+n);if !s.contains(n){print(n)}}
  }
  /// https://www.acmicpc.net/short/status/4673/74/1
  /// 1등
  func solution_zzimss() {
    var s:Set<Int>=[];for n in 1...10000{var m=n,w=n;while w>0{m+=w%10;w/=10};s.insert(m);if !s.contains(n){print(n)}}
  }
}
