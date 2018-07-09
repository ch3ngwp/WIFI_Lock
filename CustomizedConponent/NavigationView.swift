//
//  NavigationView.swift
//  WiFi_Locker
//
//  Created by 笨蛋 on 7/5/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

class NavigationView:BasicView{
    
    var title:UILabel={
        let label = UILabel(frame: CGRect(x: 0, y: 24, width: UIScreen.main.bounds.width, height: 40))
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.font = label.font.withSize(20)
        return label
    }()
    
    var left_view:UIView={
        let view = UIView(frame: CGRect(x: 16, y: 24, width: 64, height: 40))
        return view
    }()
    
    var right_view:UIView={
        let view = UIView(frame: CGRect(x: UIScreen.main.bounds.width-80, y: 24, width: 64, height: 40))
        return view
    }()
    override func setupView() {
        frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64)
        backgroundColor = UIColor.black
        
        addSubview(title)
        addSubview(left_view)
        addSubview(right_view)
        
    }
}
