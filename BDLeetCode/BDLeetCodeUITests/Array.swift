//
//  Array.swift
//  BDLeetCodeUITests
//
//  Created by 诸葛游 on 2018/9/4.
//  Copyright © 2018年 品驰医疗. All rights reserved.
//

import UIKit
import XCTest

class Array: XCTestCase {

    // MARK: - 从排序数组中删除重复项
    /// 从排序数组中删除重复项
    /// 给定一个排序数组，你需要在原地删除重复出现的元素，使得每个元素只出现一次，返回移除后数组的新长度。
    /// 不要使用额外的数组空间，你必须在原地修改输入数组并在使用 O(1) 额外空间的条件下完成。
    /// 你不需要考虑数组中超出新长度后面的元素。
    
    func removeDuplicates(nums: inout [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        
        var i = 0
        
        for j in 1..<nums.count {
            if nums[j] != nums[i] {
                i += 1
                nums[i] = nums[j]
            }
        }
        
        return i + 1
    }
    
    func testRemoveDuplicates() -> Void {
        var arr1: [Int] = [1,1,2]
        var arr2: [Int] = [0,0,1,1,1,2,2,3,3,4]
        XCTAssert(removeDuplicates(nums: &arr1) == 2)
        XCTAssert(removeDuplicates(nums: &arr2) == 5)
        XCTAssert(arr1[0..<2] == [1, 2])
        XCTAssert(arr2[0..<5] == [0, 1, 2, 3, 4])
        
    }
    
    
    // MARK: - 买卖股票的最佳时机 II
    /// 给定一个数组，它的第 i 个元素是一支给定股票第 i 天的价格。
    /// 设计一个算法来计算你所能获取的最大利润。你可以尽可能地完成更多的交易（多次买卖一支股票）。
    /// 注意：你不能同时参与多笔交易（你必须在再次购买前出售掉之前的股票）。
    
    func maxProfit(_ prices: [Int]) -> Int {
        var i = 0
        var sum = 0
        while i < prices.count-1 {
            if prices[i] < prices[i+1] {
                sum += (prices[i+1] - prices[i])
                i = i+1
            } else {
                i += 1
            }
        }
        return sum
    }
    
    func testMaxProfit() -> Void {
        XCTAssert(maxProfit([7,1,5,3,6,4]) == 7)
        XCTAssert(maxProfit([1,2,3,4,5]) == 4)
        XCTAssert(maxProfit([7,6,4,3,1]) == 0)
    }
    
}
