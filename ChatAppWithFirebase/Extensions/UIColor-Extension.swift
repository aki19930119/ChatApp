//
//  UIColor-Extension.swift
//  ChatAppWithFirebase
//
//  Created by 柿沼儀揚 on 2020/04/10.
//  Copyright © 2020 柿沼儀揚. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return self.init(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
    }
}
