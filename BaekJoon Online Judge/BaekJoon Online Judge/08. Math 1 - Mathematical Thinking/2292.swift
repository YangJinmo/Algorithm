//
//  2292.swift
//  BaekJoon Online Judge
//
//  Created by Jmy on 2021/08/06.
//

/**
 - 제목: 벌집
 - 문제: 위의 그림과 같이 육각형으로 이루어진 벌집이 있다. 그림에서 보는 바와 같이 중앙의 방 1부터 시작해서 이웃하는 방에 돌아가면서 1씩 증가하는 번호를 주소로 매길 수 있다.
       숫자 N이 주어졌을 때, 벌집의 중앙 1에서 N번 방까지 최소 개수의 방을 지나서 갈 때 몇 개의 방을 지나가는지(시작과 끝을 포함하여)를 계산하는 프로그램을 작성하시오.
       예를 들면, 13까지는 3개, 58까지는 5개를 지난다.
 - 입력: 첫째 줄에 N(1 ≤ N ≤ 1,000,000,000)이 주어진다.
 - 출력: 입력으로 주어진 방까지 최소 개수의 방을 지나서 갈 때 몇 개의 방을 지나는지 출력한다.
 - 원문: https://www.acmicpc.net/problem/2292
 */

//    1       1 1
//    2...7   2 6*0+2 6*(0)+2
//    8...19  3 6*1+2 6*(1)+2
//    20...37 4 6*2+6*1+2 6*(2+1)+2
//    38...61 5 6*3+6*2+6*1+2 6*(3+2+1)+2 6*3*2+2
//    62...91 6 6*4+6*3+6*2+6*1+2 6*(4+3+2+1)+2

//    1       1 3*1*0 + 1 = 0 + 1
//    2...7   2 3*2*1 + 1 = 6 + 1
//    8...19  3 3*3*2 + 1 = 18 + 1
//    20...37 4 3*4*3 + 1 = 36 + 1
//    38...61 5 3*5*4 + 1 = 60 + 1
//    62...91 6 3*6*5 + 1 = 90 + 1

class Problem_2292 {
  func solution_1() {
    let l = Int(readLine()!)!
    var a = 1
    var i = 0
    
    while a < l {
      a += 6 * i
      i += 1
    }
    
    print(l<2 ?1:i)
  }
  func solution_2() {
    var l=Int(readLine()!)!,a=1,i=0;while a<l{a+=6*i;i+=1};print(l<2 ?1:i)
  }
  func solution_3() {
    var l=Int(readLine()!)!,a=1;while l>3*a*a-3*a+1{a+=1};print(a)
  }
  /// https://www.acmicpc.net/short/status/2292/74/1
  /// 1등
  func solution_zzimss() {
    var l=Int(readLine()!)!,a=1;while l>3*a*(a-1)+1{a+=1};print(a)
  }
}