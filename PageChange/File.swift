//
//  File.swift
//  PageChange
//
//  Created by O2.LinYi on 16/3/1.
//  Copyright © 2016年 jd.com. All rights reserved.
//

import UIKit

extension NSObject {
    func screenWidth() -> CGFloat {
        return UIScreen.mainScreen().bounds.size.width
    }
    
    func screenHeight() -> CGFloat {
        return UIScreen.mainScreen().bounds.size.height
    }
    
    func o2_randomColor() -> UIColor {
        return UIColor(red: CGFloat(random()%256)/255.0, green: CGFloat(random()%256)/255.0, blue: CGFloat(random()%256)/255.0, alpha: 1)
    }
    
}
