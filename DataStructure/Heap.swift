//
//  Heap.swift
//  DataStructure
//
//  Created by eden on 2023/09/29.
//

import Foundation

// MAX Heap
class Heap {
    var nodes: [Int] = [-1]
    var isEmpty: Bool {
        nodes == [-1]
    }

    init() {}
    
    init(_ data: Int) {
        nodes.append(data)
    }
    
    func add(_ data: Int) {
        nodes.append(data)
        upHeap()
    }
    
    func remove() -> Int? {
        guard !isEmpty
        else {
            return nil
        }

        guard nodes.count != 2 else {
            return nodes.remove(at: 1)
        }
        
        nodes.swapAt(1, nodes.count - 1)
        let maxValue = nodes.removeLast()
        downHeap()
        
        return maxValue
    }
    
    private func upHeap() {
        var nodeIdx = nodes.count - 1
        var nodeToReConfigure: Int {
            nodes[nodeIdx]
        }
        var parentNodeIdx = nodeIdx / 2
        var parentNode: Int {
            nodes[parentNodeIdx]
        }

        while nodeIdx != 1 && nodeToReConfigure > parentNode {
            nodes.swapAt(nodeIdx, parentNodeIdx)
            nodeIdx = parentNodeIdx
            parentNodeIdx = nodeIdx / 2
        }
    }
    
    private func downHeap() {
        guard !isEmpty else { return }
        
        var nodeIdx = 1
        var nodeToReConfigure: Int {
            nodes[nodeIdx]
        }
        
        var leftChild: Int? {
            guard nodeIdx * 2 < nodes.count else { return nil }
            return nodes[nodeIdx * 2]
        }
        var rightChild: Int? {
            guard nodeIdx * 2 + 1 < nodes.count else { return nil }
            return nodes[nodeIdx * 2 + 1]
        }
        
        repeat {
            guard let leftChild, max(leftChild, rightChild ?? leftChild - 1) > nodeToReConfigure else { break }
                
            if max(leftChild, rightChild ?? leftChild - 1) == rightChild {
                    nodes.swapAt(nodeIdx, nodeIdx * 2 + 1)
                    nodeIdx = nodeIdx * 2 + 1
            } else {
                guard nodeToReConfigure < leftChild else { break }
                nodes.swapAt(nodeIdx, nodeIdx * 2)
                nodeIdx = nodeIdx * 2
            }
        } while nodeIdx * 2 < nodes.count
    }
}
