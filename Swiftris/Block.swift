//
//  Block.swift
//  Swiftris
//
//  Created by yong gu on 10/1/15.
//  Copyright © 2015 Thu. All rights reserved.
//

import Foundation

import SpriteKit

// #1
let NumberOfColors: UInt32 = 6

// #2
enum BlockColor: Int, CustomStringConvertible {
    
    // #3
    case Blue = 0, Orange, Purple, Red, Teal, Yellow
    
    // #4
    var spriteName: String {
        switch self {
        case .Blue:
            return "blue"
        case .Orange:
            return "orange"
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
    
    // #5
    var description: String {
        return self.spriteName
    }
    
    // #6
    static func random() -> BlockColor {
        return BlockColor(rawValue:Int(arc4random_uniform(NumberOfColors)))!
    }
}
    class Block: Hashable, CustomStringConvertible {
        // #2
        // Constants
        let color: BlockColor
        
        // #3
        // Properties
        var column: Int
        var row: Int
        var sprite: SKSpriteNode?
        
        // #4
        var spriteName: String {
            return color.spriteName
        }
        
        // #5
        var hashValue: Int {
            return self.column ^ self.row
        }
        
        var description: String {
            return "\(color): [\(column), \(row)]"
        }
        
        init(column:Int, row:Int, color:BlockColor) {
            self.column = column
            self.row = row
            self.color = color
        }
}

// #7
func ==(lhs: Block, rhs: Block) -> Bool {
    return lhs.column == rhs.column && lhs.row == rhs.row && lhs.color.rawValue == rhs.color.rawValue
}