//
//  ForgivePasswordView.swift
//  WiFi_Locker
//
//  Created by 笨蛋 on 8/11/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

class ForgivePasswordView: BasicView {
    weak var delegate:LoginViewdelegate?

    var email_tf:UITextField={
        let tf = UITextField()
        tf.backgroundColor = UIColor.white
        tf.layer.cornerRadius = 4
        tf.placeholder = "Email address"
        tf.translatesAutoresizingMaskIntoConstraints = false
        let leftview = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 48))
        tf.leftViewMode = .always
        tf.leftView = leftview
        return tf
    }()
    
    lazy var send_button:UIButton={
        let btn = UIButton(type: UIButtonType.system)
        btn.layer.cornerRadius = 4
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = UIColor.red
        btn.setTitle("Send reset link", for: .normal)
        btn.addTarget(self, action: #selector(resetPwd), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    @objc func resetPwd(){
        if let delegate = self.delegate as LoginViewdelegate?{
            delegate.handleResetPassword()
        }
    }
    
    lazy var signin_button:UIButton={
        let button = UIButton(type: UIButtonType.system)
        button.backgroundColor = UIColor.clear
        button.setTitle("Sign In", for: .normal)
        button.contentHorizontalAlignment = .left
        button.setTitleColor(UIColor.white.withAlphaComponent(0.75), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.handleBacktoSignin), for: .touchUpInside)
        return button
    }()
    
    @objc func handleBacktoSignin(){
        if let delegate = self.delegate as LoginViewdelegate?{
            delegate.handleBacktoSignin()
        }
    }
    
    override func setupView() {
        
        addSubview(email_tf)
        addSubview(send_button)
        addSubview(signin_button)
        
        email_tf.topAnchor.constraint(equalTo: self.topAnchor,constant:64).isActive = true
        email_tf.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        email_tf.widthAnchor.constraint(equalTo: self.widthAnchor,constant:-32).isActive = true
        email_tf.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        send_button.topAnchor.constraint(equalTo: email_tf.bottomAnchor,constant:16).isActive = true
        send_button.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        send_button.widthAnchor.constraint(equalTo: self.widthAnchor,constant:-32).isActive = true
        send_button.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        signin_button.topAnchor.constraint(equalTo: send_button.bottomAnchor, constant: 8).isActive = true
        signin_button.leftAnchor.constraint(equalTo: send_button.leftAnchor).isActive = true
        signin_button.heightAnchor.constraint(equalToConstant: 24).isActive = true
        signin_button.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2).isActive = true
    }


}
