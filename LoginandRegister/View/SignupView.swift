//
//  SignupView.swift
//  WiFi_Locker
//
//  Created by 笨蛋 on 7/19/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

class SignupView: BasicView {
    weak var delegate:LoginViewdelegate?

    var input_view:UIView={
        let view = UIView()
        view.layer.cornerRadius = 4
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var username_tf:UITextField={
        let left_title = UILabel(frame: CGRect(x: 0, y: 0, width: 88, height: 32))
        left_title.textAlignment = .left
        left_title.font = left_title.font.withSize(16)
        left_title.textColor = UIColor.black
        left_title.text = "Username:"
        
        let tf = UITextField()
        tf.leftView = left_title
        tf.leftViewMode = .always
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    var email_tf:UITextField={
        let left_title = UILabel(frame: CGRect(x: 0, y: 0, width: 48, height: 32))
        left_title.textAlignment = .left
        left_title.font = left_title.font.withSize(16)
        left_title.textColor = UIColor.black
        left_title.text = "Email:"
        
        let tf = UITextField()
        tf.leftView = left_title
        tf.leftViewMode = .always
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    var pwd_tf:UITextField={
        let left_title = UILabel(frame: CGRect(x: 0, y: 0, width: 88, height: 32))
        left_title.textAlignment = .left
        left_title.font = left_title.font.withSize(16)
        left_title.textColor = UIColor.black
        left_title.text = "Password:"
        
        let tf = UITextField()
        tf.leftView = left_title
        tf.leftViewMode = .always
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    var retype_pwd_tf:UITextField={
        let left_title = UILabel(frame: CGRect(x: 0, y: 0, width: 144, height: 32))
        left_title.textAlignment = .left
        left_title.font = left_title.font.withSize(16)
        left_title.textColor = UIColor.black
        left_title.text = "Re-type Password:"
        
        let tf = UITextField()
        tf.leftView = left_title
        tf.leftViewMode = .always
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    
    var gender_tf:UITextField={
        let left_title = UILabel(frame: CGRect(x: 0, y: 0, width: 72, height: 32))
        left_title.textAlignment = .left
        left_title.font = left_title.font.withSize(16)
        left_title.textColor = UIColor.black
        left_title.text = "Gender:"
        
        let tf = UITextField()
        tf.leftView = left_title
        tf.leftViewMode = .always
        tf.placeholder = "Female/Male"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    
    var day_of_birth_tf:UITextField={
        let left_title = UILabel(frame: CGRect(x: 0, y: 0, width: 96, height: 32))
        left_title.textAlignment = .left
        left_title.font = left_title.font.withSize(16)
        left_title.textColor = UIColor.black
        left_title.text = "Day of Birth:"
        
        let tf = UITextField()
        tf.leftView = left_title
        tf.leftViewMode = .always
        tf.placeholder = "MM/DD/YYYY"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var create_button:UIButton={
        let button = UIButton(type: UIButtonType.system)
        button.layer.cornerRadius = 4
        button.backgroundColor = UIColor.red
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitle("Create Account", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(self.handleCreateAccount), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func handleCreateAccount(){
        if let delegate = self.delegate as LoginViewdelegate?{
            delegate.handleCreateAccount()
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
        addSubview(input_view)
        input_view.addSubview(username_tf)
        input_view.addSubview(email_tf)
        input_view.addSubview(pwd_tf)
        input_view.addSubview(retype_pwd_tf)
        input_view.addSubview(gender_tf)
        input_view.addSubview(day_of_birth_tf)

        addSubview(create_button)
        addSubview(signin_button)
        setupConstraint()
    }

    func setupConstraint(){
        input_view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        input_view.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        input_view.heightAnchor.constraint(equalToConstant: 216).isActive = true
        input_view.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
        username_tf.topAnchor.constraint(equalTo: input_view.topAnchor).isActive = true
        username_tf.centerXAnchor.constraint(equalTo: input_view.centerXAnchor).isActive = true
        username_tf.widthAnchor.constraint(equalTo: input_view.widthAnchor,constant:-32).isActive = true
        username_tf.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        email_tf.topAnchor.constraint(equalTo: username_tf.bottomAnchor,constant:4).isActive = true
        email_tf.centerXAnchor.constraint(equalTo: input_view.centerXAnchor).isActive = true
        email_tf.widthAnchor.constraint(equalTo: input_view.widthAnchor,constant:-32).isActive = true
        email_tf.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        pwd_tf.topAnchor.constraint(equalTo: email_tf.bottomAnchor,constant:4).isActive = true
        pwd_tf.centerXAnchor.constraint(equalTo: input_view.centerXAnchor).isActive = true
        pwd_tf.widthAnchor.constraint(equalTo: input_view.widthAnchor,constant:-32).isActive = true
        pwd_tf.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        retype_pwd_tf.topAnchor.constraint(equalTo: pwd_tf.bottomAnchor,constant:4).isActive = true
        retype_pwd_tf.centerXAnchor.constraint(equalTo: input_view.centerXAnchor).isActive = true
        retype_pwd_tf.widthAnchor.constraint(equalTo: input_view.widthAnchor,constant:-32).isActive = true
        retype_pwd_tf.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        
        gender_tf.topAnchor.constraint(equalTo: retype_pwd_tf.bottomAnchor,constant:4).isActive = true
        gender_tf.centerXAnchor.constraint(equalTo: input_view.centerXAnchor).isActive = true
        gender_tf.widthAnchor.constraint(equalTo: input_view.widthAnchor,constant:-32).isActive = true
        gender_tf.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        day_of_birth_tf.topAnchor.constraint(equalTo: gender_tf.bottomAnchor,constant:4).isActive = true
        day_of_birth_tf.centerXAnchor.constraint(equalTo: input_view.centerXAnchor).isActive = true
        day_of_birth_tf.widthAnchor.constraint(equalTo: input_view.widthAnchor,constant:-32).isActive = true
        day_of_birth_tf.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        
        create_button.topAnchor.constraint(equalTo: input_view.bottomAnchor, constant: 16).isActive = true
        create_button.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        create_button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        create_button.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
        signin_button.topAnchor.constraint(equalTo: create_button.bottomAnchor, constant: 8).isActive = true
        signin_button.leftAnchor.constraint(equalTo: create_button.leftAnchor).isActive = true
        signin_button.heightAnchor.constraint(equalToConstant: 24).isActive = true
        signin_button.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2).isActive = true
    }
    
}







