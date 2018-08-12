//
//  LoginView.swift
//  WiFi_Locker
//
//  Created by 笨蛋 on 7/19/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

class LoginView: BasicView {

    weak var delegate:LoginViewdelegate?
    
    var input_view:UIView={
        let view = UIView()
        view.layer.cornerRadius = 4
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var username_tf:UITextField={
        let tf = UITextField()
        tf.placeholder = "Username/Email"
        let left_view = UIView(frame: CGRect(x: 0, y: 0, width: 56, height: 56))
        let icon = UIImageView(frame: CGRect(x: 16, y: 16, width: 24, height: 24))
        icon.image = UIImage(named:"icons8-secured-letter-96")
        left_view.addSubview(icon)
        tf.leftViewMode = .always
        tf.leftView = left_view
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    var divider_view:UIView={
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var password_tf:UITextField={
        let tf = UITextField()
        tf.placeholder = "Password"
        let left_view = UIView(frame: CGRect(x: 0, y: 0, width: 56, height: 56))
        let icon = UIImageView(frame: CGRect(x: 16, y: 16, width: 24, height: 24))
        icon.image = UIImage(named:"icons8-lock-96")
        left_view.addSubview(icon)
        tf.leftViewMode = .always
        tf.leftView = left_view
        tf.isSecureTextEntry = true
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()

    
    lazy var facebook_button:UIButton={
        let button = UIButton()
        button.layer.cornerRadius = 4
        button.setBackgroundImage(UIImage(named: "facebook"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var google_button:UIButton={
        let button = UIButton()
        button.layer.cornerRadius = 4
        button.setBackgroundImage(UIImage(named: "google"), for: .normal)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var reset_button:UIButton={
        let button = UIButton(type: UIButtonType.system)
        button.backgroundColor = UIColor.clear
        button.setTitle("Forgot password?", for: .normal)
        button.contentHorizontalAlignment = .left
        button.setTitleColor(UIColor.white.withAlphaComponent(0.75), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.handleResetPassword), for: .touchUpInside)
        return button
    }()
    
    @objc func handleResetPassword(){
        if let delegate = self.delegate as LoginViewdelegate?{
            delegate.handleResetPassword()
        }
    }
    
    lazy var signin_button:UIButton={
        let button = UIButton(type: UIButtonType.system)
        button.layer.cornerRadius = 4
        button.backgroundColor = UIColor.red
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(self.handleSignin), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    @objc func handleSignin(){
        if let delegate = self.delegate as LoginViewdelegate?{
            delegate.handleSignin()
        }
    }
    
    
    lazy var signup_button:UIButton={
        let button = UIButton(type: UIButtonType.system)
        button.backgroundColor = UIColor.clear
        button.setTitle("Sign up", for: .normal)
        button.contentHorizontalAlignment = .right
        button.setTitleColor(UIColor.white.withAlphaComponent(0.75), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.handleSignup), for: .touchUpInside)
        return button
    }()

    @objc func handleSignup(){
        if let delegate = self.delegate as LoginViewdelegate?{
            delegate.handleSignup()
        }
    }

    override func setupView() {
        addSubview(input_view)
        input_view.addSubview(username_tf)
        input_view.addSubview(password_tf)
        input_view.addSubview(divider_view)
        
        addSubview(signin_button)
        addSubview(facebook_button)
        addSubview(google_button)
        addSubview(signup_button)
        addSubview(reset_button)
        setupConstraint()
    }
    
    
    func setupConstraint(){
        
        
        input_view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        input_view.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        input_view.heightAnchor.constraint(equalToConstant: 112).isActive = true
        input_view.widthAnchor.constraint(equalTo: self.widthAnchor, constant: 0).isActive = true
        
        
        username_tf.topAnchor.constraint(equalTo: input_view.topAnchor).isActive = true
        username_tf.centerXAnchor.constraint(equalTo: input_view.centerXAnchor).isActive = true
        username_tf.widthAnchor.constraint(equalTo: input_view.widthAnchor).isActive = true
        username_tf.heightAnchor.constraint(equalTo: input_view.heightAnchor, multiplier: 1/2).isActive = true
        
        divider_view.centerYAnchor.constraint(equalTo: input_view.centerYAnchor).isActive = true
        divider_view.centerXAnchor.constraint(equalTo: input_view.centerXAnchor).isActive = true
        divider_view.widthAnchor.constraint(equalTo: input_view.widthAnchor).isActive = true
        divider_view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        password_tf.topAnchor.constraint(equalTo: username_tf.bottomAnchor).isActive = true
        password_tf.centerXAnchor.constraint(equalTo: input_view.centerXAnchor).isActive = true
        password_tf.widthAnchor.constraint(equalTo: input_view.widthAnchor).isActive = true
        password_tf.heightAnchor.constraint(equalTo: input_view.heightAnchor, multiplier: 1/2).isActive = true
        
        signin_button.topAnchor.constraint(equalTo: input_view.bottomAnchor, constant: 16).isActive = true
        signin_button.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        signin_button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        signin_button.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
        facebook_button.topAnchor.constraint(equalTo: signin_button.bottomAnchor, constant: 24).isActive = true
        facebook_button.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        facebook_button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        facebook_button.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
        google_button.topAnchor.constraint(equalTo: facebook_button.bottomAnchor, constant: 8).isActive = true
        google_button.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        google_button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        google_button.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
        reset_button.topAnchor.constraint(equalTo: google_button.bottomAnchor, constant: 8).isActive = true
        reset_button.leftAnchor.constraint(equalTo: google_button.leftAnchor).isActive = true
        reset_button.heightAnchor.constraint(equalToConstant: 24).isActive = true
        reset_button.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2).isActive = true


        signup_button.topAnchor.constraint(equalTo: google_button.bottomAnchor, constant: 8).isActive = true
        signup_button.rightAnchor.constraint(equalTo: google_button.rightAnchor).isActive = true
        signup_button.heightAnchor.constraint(equalToConstant: 24).isActive = true
        signup_button.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2).isActive = true
    }


}








