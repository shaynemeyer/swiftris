//
//  Array2D.swift
//  Swiftris
//
//  Created by Shayne Meyer on 10/4/14.
//  Copyright (c) 2014 Maynesoft LLC. All rights reserved.
//

import Foundation

// 1 generic arrays in swift are actually a type of struct not class but we need class here since objects are passed by reference
class Array2D<T> {
    let columns: Int
    let rows: Int
    // declare an array optional objects
    var array: Array<T?>
    
    init(columns: Int, rows: Int) {
        self.columns = columns
        self.rows = rows
        
        // instantiate the array for the necessary rows & columns for the game board.
        array = Array<T?>(count:rows * columns, repeatedValue: nil)
    }
    
    // 
    subscript(column: Int, row: Int) -> T? {
        get {
            return array[(row * columns) + column]
        }
        set(newValue) {
            array[(row * columns) + column] = newValue
        }
    }
}