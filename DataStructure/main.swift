//
//  main.swift
//  DataStructure
//
//  Created by eden on 2023/09/29.
//

import Foundation

var arrayToSort = [1,2,3,4,10,6,7,8,9,10, 5, 20, 15]
let heap = Heap()

arrayToSort.forEach({
    heap.add($0)
})

var sortedArray: [Int] = []
while !heap.isEmpty {
    if let value = heap.remove() {
        sortedArray.append(value)
    }
}

print(sortedArray)
