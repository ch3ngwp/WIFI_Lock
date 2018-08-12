//
//  SelectTimeView.swift
//  WiFi_Locker
//
//  Created by 笨蛋 on 8/1/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit


class TypeInView:BasicView{
    
    let title_label:UILabel={
        let label = UILabel()
        label.font = label.font.withSize(14)
        label.textColor = UIColor.white
        label.text = "Set time"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let hour_tf:UITextField={
        let tf = UITextField()
        tf.textColor = UIColor.white
        tf.text = "0"
        tf.keyboardType = .numberPad
        tf.returnKeyType = .done
        tf.clearsOnBeginEditing = true
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let hour_underline:UIView={
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let divide_label:UILabel={
        let label = UILabel()
        label.text = ":"
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let hour_label:UILabel={
        let label = UILabel()
        label.textColor = UIColor.white.withAlphaComponent(0.5)
        label.font = label.font.withSize(12)
        label.text = "hour"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let min_tf:UITextField={
        let tf = UITextField()
        tf.textColor = UIColor.white
        tf.text = "0"
        tf.keyboardType = .numberPad
        tf.returnKeyType = .done
        tf.clearsOnBeginEditing = true
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let min_underline:UIView={
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let min_label:UILabel={
        let label = UILabel()
        label.textColor = UIColor.white.withAlphaComponent(0.5)
        label.font = label.font.withSize(12)
        label.text = "minute"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func setupView() {
        
        addSubview(title_label)
        addSubview(hour_tf)
        addSubview(hour_underline)
        addSubview(divide_label)
        addSubview(hour_label)
        addSubview(min_tf)
        addSubview(min_underline)
        addSubview(min_label)
        setupConstraint()
    }
    
    func setupConstraint(){
        title_label.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        title_label.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        title_label.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        title_label.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        hour_tf.topAnchor.constraint(equalTo: title_label.bottomAnchor, constant: 8).isActive = true
        hour_tf.leftAnchor.constraint(equalTo: title_label.leftAnchor).isActive = true
        hour_tf.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2, constant: -16).isActive = true
        hour_tf.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        hour_underline.topAnchor.constraint(equalTo: hour_tf.bottomAnchor).isActive = true
        hour_underline.leftAnchor.constraint(equalTo: hour_tf.leftAnchor).isActive = true
        hour_underline.widthAnchor.constraint(equalTo: hour_tf.widthAnchor).isActive = true
        hour_underline.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        divide_label.topAnchor.constraint(equalTo: hour_tf.topAnchor).isActive = true
        divide_label.leftAnchor.constraint(equalTo: hour_tf.rightAnchor).isActive = true
        divide_label.widthAnchor.constraint(equalToConstant: 16).isActive = true
        divide_label.heightAnchor.constraint(equalTo: hour_tf.heightAnchor).isActive = true
        
        hour_label.topAnchor.constraint(equalTo: hour_tf.bottomAnchor, constant: 8).isActive = true
        hour_label.leftAnchor.constraint(equalTo: hour_tf.leftAnchor).isActive = true
        hour_label.widthAnchor.constraint(equalTo: hour_tf.widthAnchor).isActive = true
        hour_label.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        min_tf.topAnchor.constraint(equalTo: title_label.bottomAnchor, constant: 8).isActive = true
        min_tf.leftAnchor.constraint(equalTo: hour_label.rightAnchor,constant:16).isActive = true
        min_tf.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2, constant: -16).isActive = true
        min_tf.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        min_underline.topAnchor.constraint(equalTo: min_tf.bottomAnchor).isActive = true
        min_underline.leftAnchor.constraint(equalTo: min_tf.leftAnchor).isActive = true
        min_underline.widthAnchor.constraint(equalTo: min_tf.widthAnchor).isActive = true
        min_underline.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        min_label.topAnchor.constraint(equalTo: min_tf.bottomAnchor, constant: 8).isActive = true
        min_label.leftAnchor.constraint(equalTo: min_tf.leftAnchor).isActive = true
        min_label.widthAnchor.constraint(equalTo: min_tf.widthAnchor).isActive = true
        min_label.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
    
}

class SelectTimeView: BasicView {

    weak var delegate:handleHomepageDelegate?
    var start_time:String?{
        didSet{
            let str = start_time?.components(separatedBy: ":")
            start_time_view.hour_tf.text = str?[0]
            start_time_view.min_tf.text = str?[1]
        }
    }
    
    var end_time:String?{
        didSet{
            let str = end_time?.components(separatedBy: ":")
            end_time_view.hour_tf.text = str?[0]
            end_time_view.min_tf.text = str?[1]
        }
    }
    let hole_view:UIView={
        let view = UIView()
        view.layer.cornerRadius = 8
        view.backgroundColor = UIColor(red: 52/255, green: 48/255, blue: 48/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let title_label:UILabel={
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = UIColor.white
        label.text = "Set time"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subtitle_label:UILabel={
        let label = UILabel()
        label.font = label.font.withSize(14)
        label.textColor = UIColor.white
        label.text = "Type in time"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let start_time_view:TypeInView={
        let view = TypeInView()
        view.title_label.text = "Start time"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    let end_time_view:TypeInView={
        let view = TypeInView()
        view.title_label.text = "End time"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var cancel_button:UIButton={
        let btn = UIButton(type: UIButtonType.system)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.setTitle("Cancel", for: .normal)
        btn.setTitleColor(UIColor(red: 0/255, green: 151/255, blue: 156/255, alpha: 1), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(handleCancel), for: .touchUpInside)
        return btn
    }()
    
    @objc func handleCancel(){
        self.removeFromSuperview()
    }
    
    lazy var ok_button:UIButton={
        let btn = UIButton(type: UIButtonType.system)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        btn.setTitle("Ok", for: .normal)
        btn.setTitleColor(UIColor(red: 0/255, green: 151/255, blue: 156/255, alpha: 1), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(handleok), for: .touchUpInside)
        return btn
    }()
    
    @objc func handleok(){
        let start_timeStr = "\(start_time_view.hour_tf.text!):\(start_time_view.min_tf.text!)"
        let end_timeStr = "\(end_time_view.hour_tf.text!):\(end_time_view.min_tf.text!)"
        let selectedtime = start_timeStr + " - " + end_timeStr
        if let delegate = self.delegate as handleHomepageDelegate?{
            delegate.TypedInTime(index: self.tag, time: (start_timeStr,end_timeStr))
        }
        self.removeFromSuperview()
    }
    
    override func setupView() {
        backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        addSubview(hole_view)
        hole_view.addSubview(title_label)
        hole_view.addSubview(subtitle_label)
        hole_view.addSubview(start_time_view)
        hole_view.addSubview(end_time_view)
        hole_view.addSubview(cancel_button)
        hole_view.addSubview(ok_button)
        setupConstraint()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.start_time_view.hour_tf.resignFirstResponder()
        self.start_time_view.min_tf.resignFirstResponder()
        self.end_time_view.hour_tf.resignFirstResponder()
        self.end_time_view.min_tf.resignFirstResponder()
    }
    
    func setupConstraint(){
        hole_view.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        hole_view.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        hole_view.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -64).isActive = true
        hole_view.heightAnchor.constraint(equalToConstant: 224).isActive = true
        
        title_label.topAnchor.constraint(equalTo: hole_view.topAnchor,constant:16).isActive = true
        title_label.centerXAnchor.constraint(equalTo: hole_view.centerXAnchor).isActive = true
        title_label.widthAnchor.constraint(equalTo: hole_view.widthAnchor, constant: -32).isActive = true
        title_label.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        subtitle_label.topAnchor.constraint(equalTo: title_label.bottomAnchor,constant:8).isActive = true
        subtitle_label.centerXAnchor.constraint(equalTo: hole_view.centerXAnchor).isActive = true
        subtitle_label.widthAnchor.constraint(equalTo: hole_view.widthAnchor, constant: -32).isActive = true
        subtitle_label.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        start_time_view.topAnchor.constraint(equalTo: subtitle_label.bottomAnchor,constant:8).isActive = true
        start_time_view.leftAnchor.constraint(equalTo: subtitle_label.leftAnchor).isActive = true
        start_time_view.widthAnchor.constraint(equalTo: hole_view.widthAnchor, multiplier: 1/2, constant: -16).isActive = true
        start_time_view.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        end_time_view.topAnchor.constraint(equalTo: subtitle_label.bottomAnchor,constant:8).isActive = true
        end_time_view.leftAnchor.constraint(equalTo: hole_view.centerXAnchor).isActive = true
        end_time_view.widthAnchor.constraint(equalTo: hole_view.widthAnchor, multiplier: 1/2, constant: -16).isActive = true
        end_time_view.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        cancel_button.topAnchor.constraint(equalTo: start_time_view.bottomAnchor,constant:16).isActive = true
        cancel_button.leftAnchor.constraint(equalTo: hole_view.centerXAnchor).isActive = true
        cancel_button.widthAnchor.constraint(equalTo: hole_view.widthAnchor, multiplier: 1/4).isActive = true
        cancel_button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        ok_button.topAnchor.constraint(equalTo: cancel_button.topAnchor).isActive = true
        ok_button.leftAnchor.constraint(equalTo: cancel_button.rightAnchor).isActive = true
        ok_button.widthAnchor.constraint(equalTo: hole_view.widthAnchor, multiplier: 1/4).isActive = true
        ok_button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        
    }

}











