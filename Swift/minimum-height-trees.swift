/**
 * https://leetcode.com/problems/minimum-height-trees/
 * 
 * 
 */ 
// Date: Tue Jun  9 10:01:29 PDT 2020
class Solution {
    /// TLE
    /// - Complexity:
    ///     - Time: O(n*n*e), n is the number of nodes and e is number of edges. So, possibly O(n^4).
    ///     - Space: O(e)
    ///
    func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {
        var graph: [[Int]] = Array(repeating: [], count: n)
        for edge in edges {
            graph[edge[0]].append(edge[1])
            graph[edge[1]].append(edge[0])
        }
        
        var roots: [Int] = []
        var minHeight = n
        for root in 0 ..< n {
            var queue = [root]
            var height = 0
            var visited: Set<Int> = [root]
            while queue.isEmpty == false {
                var n = queue.count
                height += 1
                while n > 0 {
                    n -= 1
                    let node = queue.removeFirst()
                    for dst in graph[node] {
                        if visited.contains(dst) == false {
                            queue.append(dst)
                            visited.insert(dst)
                        }
                    }
                }
            }
            
            // print("Root: \(root) - \(height)")
            if height < minHeight {
                roots = [root]
                minHeight = height
            } else if height == minHeight {
                roots.append(root)
                minHeight = height
            }
        }
        return roots
    }
}