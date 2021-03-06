//
//  2798.swift
//  BaekJoon Online Judge
//
//  Created by Jmy on 2021/10/13.
//

/**
 - 제목: 블랙잭
 - 문제: 카지노에서 제일 인기 있는 게임 블랙잭의 규칙은 상당히 쉽다. 카드의 합이 21을 넘지 않는 한도 내에서, 카드의 합을 최대한 크게 만드는 게임이다. 블랙잭은 카지노마다 다양한 규정이 있다.
       한국 최고의 블랙잭 고수 김정인은 새로운 블랙잭 규칙을 만들어 상근, 창영이와 게임하려고 한다.
       김정인 버전의 블랙잭에서 각 카드에는 양의 정수가 쓰여 있다. 그 다음, 딜러는 N장의 카드를 모두 숫자가 보이도록 바닥에 놓는다. 그런 후에 딜러는 숫자 M을 크게 외친다.
       이제 플레이어는 제한된 시간 안에 N장의 카드 중에서 3장의 카드를 골라야 한다. 블랙잭 변형 게임이기 때문에, 플레이어가 고른 카드의 합은 M을 넘지 않으면서 M과 최대한 가깝게 만들어야 한다.
       N장의 카드에 써져 있는 숫자가 주어졌을 때, M을 넘지 않으면서 M에 최대한 가까운 카드 3장의 합을 구해 출력하시오.
 - 입력: 첫째 줄에 카드의 개수 N(3 ≤ N ≤ 100)과 M(10 ≤ M ≤ 300,000)이 주어진다. 둘째 줄에는 카드에 쓰여 있는 수가 주어지며, 이 값은 100,000을 넘지 않는 양의 정수이다.
       합이 M을 넘지 않는 카드 3장을 찾을 수 있는 경우만 입력으로 주어진다.
 - 출력: 첫째 줄에 M을 넘지 않으면서 M에 최대한 가까운 카드 3장의 합을 출력한다.
 - 원문: https://www.acmicpc.net/problem/2798
 */

class Problem_2798 {
    func solution_1() {
        func blackJack(_ N: Int, _ M: Int, _ cards: [Int]) -> Int {
            var max = 0
            
            for i in 0 ..< N {
                for j in i+1 ..< N {
                    for k in j+1 ..< N {
                        let sum = cards[i] + cards[j] + cards[k]
                        
                        if M == sum {
                            max = sum
                            return max
                        } else if M < sum {
                            continue
                        } else if M > sum {
                            if max < sum {
                                max = sum
                            }
                        }
                    }
                }
            }
            
            return max
        }
        
        let l = readLine()!.split(separator: " ").compactMap { Int($0) }
        let cards = readLine()!.split(separator: " ").compactMap { Int($0) }
        let N = l[0]
        let M = l[1]
        
        //cards.sort()
        //cards = cards.reversed()
        
        print(blackJack(N, M, cards))
    }
    
    func solution_2() {
        let l=readLine()!.split{$0==" "}.map{Int($0)!}
        let cards=readLine()!.split{$0==" "}.map{Int($0)!}
        var a=[Int]()
        
        for i in 0..<l[0] {
            for j in i+1..<l[0] {
                for k in j+1..<l[0] {
                    let sum = cards[i] + cards[j] + cards[k]
                    
                    if sum <= l[1] {
                        a.append(sum)
                    }
                }
            }
        }
        print(a.max()!)
    }
    
    /// https://www.acmicpc.net/short/status/2798/74/1
    /// 1등
    /// 219
    func solution_short_1() {
        var l=readLine()!.split{$0==" "}.map{Int($0)!},N=l[0],c=readLine()!.split{$0==" "}.map{Int($0)!},a=[Int]()
        for i in 0..<N{for j in i+1..<N{for k in j+1..<N{let s=c[i]+c[j]+c[k];if s<=l[1]{a.append(s)}}}}
        print(a.max()!)
    }
    /// 217
    func solution_short_2() {
        var l=readLine()!.split{$0==" "},N=Int(l[0])!,c=readLine()!.split{$0==" "}.map{Int($0)!},a=[Int]()
        for i in 0..<N{for j in i+1..<N{for k in j+1..<N{let s=c[i]+c[j]+c[k];if s<=Int(l[1])!{a.append(s)}}}}
        print(a.max()!)
    }
}
