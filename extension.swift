//
//  extension.swift
//  WiFi_Locker
//
//  Created by 笨蛋 on 7/7/18.
//  Copyright © 2018 test. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    func addConstraintsWithFormat(format:String,views:UIView...){
        var viewDic = [String:UIView]()
        for (index,view) in views.enumerated(){
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewDic[key] = view
        }
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options:NSLayoutFormatOptions() , metrics: nil, views: viewDic))
    }
}
