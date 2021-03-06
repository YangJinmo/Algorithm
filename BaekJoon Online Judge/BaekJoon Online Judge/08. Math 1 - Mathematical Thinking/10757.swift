//
//  10757.swift
//  BaekJoon Online Judge
//
//  Created by Jmy on 2021/08/13.
//

/**
 - 제목: 큰 수 A+B
 - 문제: 두 정수 A와 B를 입력받은 다음, A+B를 출력하는 프로그램을 작성하시오.
 - 입력: 첫째 줄에 A와 B가 주어진다. (0 `<` A,B `<` 10^10000)
 - 출력: 첫째 줄에 A+B를 출력한다.
 - 원문: https://www.acmicpc.net/problem/10757
 */

/**
 - 예제 1
 - 입력: 9223372036854775807 9223372036854775808
 - 출력: 18446744073709551615
 */

class Problem_10757 {
    /// 런타임 에러: a.count로 돌리기 때문에 개수가 다르면 안되는 코드
    func solution_1() {
        let arr = readLine()!.split(separator: " ").map(String.init)
        let a = arr[0]
        let b = arr[1]
        
        var intArr: [Int] = []
        var carry = 0
        
        for i in 1...a.count {
            let A = Int(String(a[a.index(a.endIndex, offsetBy: -i)])) ?? 0
            let B = Int(String(b[b.index(b.endIndex, offsetBy: -i)])) ?? 0
            let sum = A + B + carry
            
            carry = sum / 10
            intArr.insert(sum % 10, at: 0)
        }
        
        if carry > 0 {
            intArr.insert(carry, at: 0)
        }
        
        print(intArr.map(String.init).joined())
    }
    func solution_2_1() {
        let arr = readLine()!.split(separator: " ").map(String.init)
        var a = arr[0]
        var b = arr[1]
        let betterCount = a.count > b.count ? a.count : b.count
        
        var intArr: [Int] = []
        var carry = 0
        
        for _ in 1...betterCount {
            let A = Int(String(a.popLast() ?? " ")) ?? 0
            let B = Int(String(b.popLast() ?? " ")) ?? 0
            let sum = A + B + carry
            
            carry = sum / 10
            intArr.insert(sum % 10, at: 0)
        }
        
        if carry > 0 {
            intArr.insert(carry, at: 0)
        }
        
        print(intArr.map(String.init).joined())
    }
    func solution_2_2() {
        let arr = readLine()!.split(separator: " ").map(String.init)
        var a = arr[0]
        var b = arr[1]
        let betterCount = a.count > b.count ? a : b
        
        var intArr: [Int] = []
        var carry = 0
        
        for _ in betterCount {
            let A = Int(String(a.popLast() ?? " ")) ?? 0
            let B = Int(String(b.popLast() ?? " ")) ?? 0
            let sum = A + B + carry
            
            carry = sum / 10
            intArr.insert(sum % 10, at: 0)
        }
        
        if carry > 0 {
            intArr.insert(carry, at: 0)
        }
        
        print(intArr.map(String.init).joined())
    }
    func solution_2_3() {
        var l=readLine()!.split{$0==" "},a="\(l[0])",b="\(l[1])",c=0,m=0,r:[Int]=[],g=a.count>b.count ?a:b;for _ in g{m=(Int(String(a.popLast() ?? " ")) ?? 0)+(Int(String(b.popLast() ?? " ")) ?? 0)+c;c=m/10;r.insert(m%10,at:0)};if c>0{r.insert(c,at:0)};print(r.map{String($0)}.joined())
    }
    /// 시간 초과: count 반복 때문으로 예상
    func solution_2_4() {
        let arr = readLine()!.split(separator: " ").map(String.init)
        var a = arr[0]
        var b = arr[1]
        
        var intArr: [Int] = []
        var carry = 0
        
        while a.count + b.count > 0 {
            let A = Int(String(a.popLast() ?? " ")) ?? 0
            let B = Int(String(b.popLast() ?? " ")) ?? 0
            let sum = A + B + carry
            
            carry = sum / 10
            intArr.insert(sum % 10, at: 0)
        }
        
        if carry > 0 {
            intArr.insert(carry, at: 0)
        }
        
        print(intArr.map(String.init).joined())
    }
    /// 시간 초과
    func solution_2_5() {
        func f(_ s: inout String) -> Int {
            Int(String(s.popLast() ?? " ")) ?? 0
        }
        
        let arr = readLine()!.split(separator: " ").map(String.init)
        var a = arr[0]
        var b = arr[1]
        
        var intArr: [Int] = []
        var carry = 0
        
        while a.count + b.count > 0 {
            let sum = f(&a) + f(&b) + carry
            
            carry = sum / 10
            intArr.insert(sum % 10, at: 0)
        }
        
        if carry > 0 {
            intArr.insert(carry, at: 0)
        }
        
        print(intArr.map(String.init).joined())
    }
    /// 시간 초과
    func solution_2_6() {
        var l=readLine()!.split{$0==" "},a="\(l[0])",b="\(l[1])",c=0,m=0,r:[Int]=[]
        
        while a.count+b.count>0 {
            m=(Int("\(a.popLast() ?? " ")") ?? 0)+(Int("\(b.popLast() ?? " ")") ?? 0)+c
            c=m/10
            r.insert(m%10,at:0)
        }
        
        if c>0 {
            r.insert(c,at:0)
        }
        
        print(r.map{"\($0)"}.joined())
    }
    func solution_3() {
        
        func splitNum(_ str: String) -> [Int] {
            let intArr = str.map{ Int(String($0))! }
            return intArr
        }
        
        func isLonger(_ a: [Int],_ b: [Int]) -> Bool {
            return a.count >= b.count ? true : false
        }
        
        func addNum(_ l: [Int],_ s: [Int]) -> String {
            var long = l, short = s
            var carry = 0, sum = 0
            var result = ""
            
            func updateResult() {
                if sum > 9 {
                    carry = 1
                    sum = long.isEmpty ? sum : sum-10
                }
                result = String(sum) + result
            }
            
            while !short.isEmpty {
                sum = long.last! + short.last! + carry
                carry = 0
                long.removeLast()
                short.removeLast()
                updateResult()
            }
            while !long.isEmpty {
                sum = long.last! + carry
                carry = 0
                long.removeLast()
                updateResult()
            }
            return result
            
        }
        let arr = readLine()!.split(separator: " ").map(String.init)
        let a = splitNum(arr[0]), b = splitNum(arr[1])
        let l = isLonger(a, b) ? a : b
        let s = isLonger(a, b) ? b : a
        print(addNum(l, s))
    }
    func solution_4() {
        let num = readLine()!.split(separator: " ").map { String($0) }
        var A = Array(num[0]).map { Int(String($0))! }
        var B = Array(num[1]).map { Int(String($0))! }
        if A.count > B.count {
            while A.count != B.count {
                B.insert(0, at: 0)
            }
        } else if A.count < B.count {
            while A.count != B.count {
                A.insert(0, at: 0)
            }
        }
        B.insert(0, at: 0)
        A.insert(0, at: 0)
        var i = A.count - 1
        while i != 0 {
            if A[i] + B[i] >= 10 {
                A[i - 1] += (A[i] + B[i]) / 10
            }
            A[i] = (A[i] + B[i]) % 10
            i -= 1
        }
        if A[0] == 0 {
            A.remove(at: 0)
        }
        print(A.map { String($0) }.joined())
    }
    func solution_5() {
        let arr = readLine()!.split(separator: " ").map { String($0) }
        var A = Array(arr[0]).map { Int(String($0))! }
        var B = Array(arr[1]).map { Int(String($0))! }

        var ALen = A.count, BLen = B.count
        if ALen > BLen {
            swap(&A,&B)
            BLen = ALen
        }

        while BLen > A.count {
            A.insert(0, at: 0)
        }

        var Ans = [Int](repeating: 0, count: BLen+1)
        var idx = BLen-1
        while idx >= 0 {
            Ans[idx] += (A[idx] + B[idx] + Ans[idx+1]) / 10
            Ans[idx+1] = (A[idx] + B[idx] + Ans[idx+1]) % 10
            idx -= 1
        }

        while Ans.count > 0 && Ans.first! == 0 {
            Ans.removeFirst()
        }

        print(Ans.map { String($0) }.joined())
    }
    func solution_6_1() {
        var nums: [String] = readLine()!.split(separator: " ").map({ String($0) })
        var result = [String]()
        var next = 0

        while nums.filter({ $0 == "" }).count < 2 {
            var first = 0, second = 0
            if let num = nums[0].popLast() {
                first = Int(String(num))!
            }
            if let num = nums[1].popLast() {
                second = Int(String(num))!
            }
            
            let sum = first + second + next
            if sum > 9 {
                result.insert(String(String(sum).last!), at: 0)
                next = 1
            } else {
                result.insert(String(sum), at: 0)
                next = 0
            }
        }

        if next == 1 {
            result.insert("1", at: 0)
        }

        print(result.joined())
    }
    /// https://www.acmicpc.net/short/status/10757/74/1
    /// 1등
    func solution_zzimss() {
        var l=readLine()!.split{$0==" "},a="\(l[0])",b="\(l[1])",c=0,m=0,r:[Int]=[];(a.count>b.count ?a:b).map{$0;m=(Int("\(a.popLast() ?? " ")") ?? 0)+(Int("\(b.popLast() ?? " ")") ?? 0)+c;c=m/10;r.insert(m%10,at:0)};if c>0{r.insert(c,at:0)};print(r.map{"\($0)"}.joined())
    }
}
extension String {
    
    // let str = "aBcDeF"
    // print(str[3]) // D
    subscript(_ index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
    
    // let name = "Marie Curie"
    // let firstSpace = name.firstIndex(of: " ") ?? name.endIndex
    // let firstName = name[..<firstSpace]
    // print(firstName) // Marie
    subscript(_ range: Range<Int>) -> String {
        let fromIndex = self.index(self.startIndex, offsetBy: range.startIndex)
        let toIndex = self.index(self.startIndex, offsetBy: range.endIndex)
        return String(self[fromIndex..<toIndex])
    }
}
extension Array {
    
    // ~= 연산자
    // 대상이 특정 범위에 속하는지 범위를 체크하는 연산자입니다.
    subscript(safe index: Int) -> Element? {
        // iOS 9 or later
        return indices ~= index ? self[index] : nil
        // iOS 8 or earlier
        // return startIndex <= index && index < endIndex ? self[index] : nil
        // return 0 <= index && index < self.count ? self[index] : nil
    }
}

