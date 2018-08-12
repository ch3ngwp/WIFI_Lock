//
//  UnsettingView.swift
//  WiFi_Locker
//
//  Created by 笨蛋 on 7/12/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

class UnsettingView: BasicView {

    var image_view:UIImageView={
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.image = UIImage(named: "icons8-access-denied-filled")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    var title:UILabel={
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Access permission is unavaliable"
        label.font = label.font.withSize(16)
        label.textColor = MyColor.SecondColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var information_label:UILabel={
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Go to System Setting->Apps->Special access->Usage access->Turn on wifilock"
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.font = label.font.withSize(12)
        label.textColor = MyColor.HintText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var set_button:UIButton={
        let btn = UIButton(type: UIButtonType.system)
        btn.layer.cornerRadius = 4
        btn.backgroundColor = UIColor.red
        btn.setTitle("Set", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(Setting), for: .touchUpInside)
        return btn
    }()
    
    @objc func Setting(){
        UserDefaults.standard.set(true, forKey: "isSetting")
        UIApplication.shared.open(URL(string:UIApplicationOpenSettingsURLString)!)
    }
    
    override func setupView() {
        addSubview(image_view)
        addSubview(title)
        addSubview(information_label)
        addSubview(set_button)
        setupConstraint()
    }
    
    func setupConstraint(){
        backgroundColor = UIColor.white
        
        image_view.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive  = true
        image_view.topAnchor.constraint(equalTo: self.topAnchor, constant: 120).isActive = true
        image_view.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/3).isActive = true
        image_view.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
        title.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive  = true
        title.topAnchor.constraint(equalTo: image_view.bottomAnchor, constant: 8).isActive = true
        title.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -16).isActive = true
        title.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        information_label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive  = true
        information_label.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 8).isActive = true
        information_label.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -32).isActive = true
        information_label.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        set_button.topAnchor.constraint(equalTo: information_label.bottomAnchor,constant:32).isActive = true
        set_button.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        set_button.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2).isActive = true
        set_button.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
