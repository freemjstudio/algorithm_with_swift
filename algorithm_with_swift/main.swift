import Foundation

let input = readLine()!.split { $0 == " "}.map{ Int(String($0))! }
let n = input[0]
let m = input[1]
var answer = 0

var matrix = Array(repeating: Array(repeating: 0, count: m), count: n)
for i in 0..<n {
    let data = readLine()!.split(separator: " ").map{ Int(String($0))! }
    matrix[i] = data
}

var visited = Array(repeating: Array(repeating: false, count: m), count: n)
// 8방향 탐색
let dx = [-1, 1, 0, 0, -1, 1, -1, 1]
let dy = [0, 0, -1, 1, -1, 1, 1, -1]

var flag = true

for i in 0..<n {
    for j in 0..<m {
        if matrix[i][j] > 0 && visited[i][j] == false {
           // bfs(a: i, b: j)
            flag = true // reset flag to default
            dfs(x:i, y:j)
            if flag {
                answer += 1
            }
            
        }
    }
}

func dfs(x:Int, y:Int) {
    visited[x][y] = true
    for i in 0..<8 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        if 0 <= nx && nx < n && 0 <= ny && ny < m {
            if matrix[nx][ny] > matrix[x][y] {
                flag = false
            }
            if matrix[nx][ny] == matrix[x][y] && visited[nx][ny] == false {
                dfs(x: nx, y: ny)
            }
        }
    }
}

print(answer)


//func bfs(a:Int, b:Int) {
//    answer += 1
//    var flag = true
//    var queue: [[Int]] = []
//    queue.append([a, b])
//    visited[a][b] = true
//
//    while !queue.isEmpty {
//        let d = queue.removeFirst()
//        let x = d[0]
//        let y = d[1]
//
//        for i in 0..<8 {
//            var nx = 0
//            var ny = 0
//            nx = x + dx[i]
//            ny = y + dy[i]
//
//            if 0 <= nx && nx < n && 0 <= ny && ny < m { // 범위 내에 있는지 확인
//                if matrix[nx][ny] > matrix[x][y] { // 현재 탐색중인 값이 산봉우리가 아님
//                    flag = false
//                }
//                if matrix[nx][ny] == matrix[x][y] && !visited[nx][ny]  { // 같은 높이의 산봉우리 탐색
//                    visited[nx][ny] = true
//                    queue.append([nx, ny])
//                }
//            }
//        }
//    }
//
//    // while 문 통과
//    if flag == false {
//        answer -= 1
//    }
//}
//print(answer)

