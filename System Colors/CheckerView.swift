//
//  CheckerView.swift
//  View with checkered background pattern
//
//  Created by Jakob Bieling on 25/Sep/19.
//  Copyright © 2019 Jakob Bieling. All rights reserved.
//

import UIKit

class CheckerView: UIView {

    override func draw(_ rect: CGRect)
    {
        let context = UIGraphicsGetCurrentContext();
        context?.setFillColor(UIColor.red.cgColor)

        let shortSideLength = Int(min(self.frame.width, self.frame.height))
        let size = shortSideLength / numberOfChecks
        let columnCount = Int(ceil(self.frame.width / CGFloat(size)))
        let rowCount = Int(ceil(self.frame.height / CGFloat(size)))

        for col in 0 ..< columnCount
        {
            for row in 0 ..< rowCount
            {
                if (row + col) % 2 == 0
                {
                    context?.fill(CGRect(x: col * size, y: row * size, width: size, height: size))
                }
            }
        }
    }

    var numberOfChecks = 8

}
