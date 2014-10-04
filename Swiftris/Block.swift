//
//  Block.swift
//  Swiftris
//
//  Created by Shayne Meyer on 10/4/14.
//  Copyright (c) 2014 Maynesoft LLC. All rights reserved.
//

import Foundation
import SpriteKit

// define how many colors available
let NumberOfColors: UInt32 = 6

// declare an enum
enum BlockColor: Int, Printable {
    // provide a full list of color options
    case Blue = 0, Orange, Purple, Red, Teal, Yellow
    // define as a computed property
    var spriteName: String {
        switch self {
        case .Blue:
            return "blue"
        case .Orange:
            return "organge"
        case .Purple:
            return "purple"
        case .Red:
            return "red"
        case .Teal:
            return "teal"
        case .Yellow:
            return "yellow"
        
        }

    }
    // returns the name of the color
    var description: String {
        return self.description
    }
    
    // return a random BlockColor
    static func random() -> BlockColor {
        return BlockColor.fromRaw(Int(arc4random_uniform(NumberOfColors)))!
    }
}

class Block: Hashable, Printable {
    // constants
    let color: BlockColor
    
    // properties
    var column: Int
    var row: Int
    var sprite: SKSpriteNode?
    
    // provide shortcut for recovering the file name of the sprite used.
    var spriteName: String {
        return color.spriteName
    }
    
    // Required to support Hashable protocol
    var hashValue: Int {
        return self.column ^ self.row
    }
    
    // Required for Printable protocol
    var description: String {
        return "\(color): [\(column), \(row)]"
    }
    
    init(column: Int, row: Int, color:BlockColor) {
        self.column = column
        self.row = row
        self.color = color
    }
}

// create a custom operator "==" for comparing one Block to another.
// Required to support Hashable protocol
func ==(lhs: Block, rhs: Block) -> Bool {
    return lhs.column == rhs.column && lhs.row == rhs.row && lhs.color.toRaw() == rhs.color.toRaw()
}