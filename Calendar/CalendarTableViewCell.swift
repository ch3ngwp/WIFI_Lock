//
//  CalendarTableViewCell.swift
//  WiFi_Locker
//
//  Created by 笨蛋 on 8/1/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

class CalendarTableViewCell: UITableViewCell {

    weak var delegate:CalendarViewdelegate?
    var button_arr:[UIButton] = []
    
    let repeat_label:UILabel={
        let label = UILabel()
        label.text = "Repeat"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var calendar_button:UIButton={
        let btn = UIButton()
        btn.setImage(UIImage(named: "icons8-calendar"), for: .normal)
        btn.addTarget(self, action: #selector(handleCalendar), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    @objc func handleCalendar(){
        if let window = UIApplication.shared.keyWindow{
            let view = SelectTimeByCalendarView()
            view.frame = window.frame
            view.date = Date()
            
            window.addSubview(view)
        }
    }
    
    let repeat_view:UIView={
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let repeat_divider:UIView={
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let alarm_label:UILabel={
        let label = UILabel()
        label.text = "Alarm Ringtone"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let alarm_sublabel:UILabel={
        let label = UILabel()
        label.text = "Spring"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let alarm_divider:UIView={
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let vibrate_label:UILabel={
        let label = UILabel()
        label.text = "Vibrate"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let vibrate_divider:UIView={
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let label_label:UILabel={
        let label = UILabel()
        label.text = "Label"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let label_sublabel:UILabel={
        let label = UILabel()
        label.text = "Label"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let label_divider:UIView={
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    lazy var delete_button:UIButton={
        let btn = UIButton()
        btn.setImage(UIImage(named: "icons8-close-window"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    lazy var unexpand_button:UIButton={
        let btn = UIButton()
        btn.setImage(UIImage(named: "icons8-back-filled-64"), for: .normal)
        btn.transform = CGAffineTransform.init(rotationAngle: CGFloat.pi/2)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(handleUnexpand), for: .touchUpInside)
        return btn
    }()
    
    @objc func handleUnexpand(){
        if let delegate = self.delegate as CalendarViewdelegate?{
            delegate.handleUnexpand(index: self.tag)
        }
    }
    
    let bottom_line:UIView={
        let view = UIView()
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 3, height: 3)
        view.layer.shadowRadius = 3
        view.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = MyColor.calendar_bg
        clipsToBounds = false
        
        
        addSubview(repeat_label)
        addSubview(calendar_button)
        setupRepeatCell()
        addSubview(repeat_view)
        addSubview(repeat_divider)
        addSubview(alarm_label)
        addSubview(alarm_sublabel)
        addSubview(alarm_divider)
        addSubview(vibrate_label)
        addSubview(vibrate_divider)
        addSubview(label_label)
        addSubview(label_sublabel)
        addSubview(label_divider)
        addSubview(delete_button)
        addSubview(unexpand_button)
        addSubview(bottom_line)
        setupConstraint()
        
    }
    
    func setupConstraint(){
        repeat_label.topAnchor.constraint(equalTo: self.topAnchor,constant:8).isActive = true
        repeat_label.leftAnchor.constraint(equalTo: self.leftAnchor,constant:64).isActive = true
        repeat_label.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -64).isActive = true
        repeat_label.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        calendar_button.centerYAnchor.constraint(equalTo: repeat_label.centerYAnchor).isActive = true
        calendar_button.rightAnchor.constraint(equalTo: repeat_label.rightAnchor,constant:-16).isActive = true
        calendar_button.widthAnchor.constraint(equalToConstant: 32).isActive = true
        calendar_button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        repeat_view.topAnchor.constraint(equalTo: repeat_label.bottomAnchor, constant: 8).isActive = true
        repeat_view.leftAnchor.constraint(equalTo: repeat_label.leftAnchor).isActive = true
        repeat_view.widthAnchor.constraint(equalTo: repeat_label.widthAnchor).isActive = true
        repeat_view.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        repeat_divider.topAnchor.constraint(equalTo: repeat_view.bottomAnchor,constant:8).isActive = true
        repeat_divider.leftAnchor.constraint(equalTo: repeat_view.leftAnchor).isActive = true
        repeat_divider.widthAnchor.constraint(equalTo: repeat_view.widthAnchor).isActive = true
        repeat_divider.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        alarm_label.topAnchor.constraint(equalTo: repeat_view.bottomAnchor,constant:16).isActive = true
        alarm_label.leftAnchor.constraint(equalTo: repeat_view.leftAnchor).isActive = true
        alarm_label.widthAnchor.constraint(equalTo: repeat_view.widthAnchor).isActive = true
        alarm_label.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        alarm_sublabel.topAnchor.constraint(equalTo: alarm_label.bottomAnchor).isActive = true
        alarm_sublabel.leftAnchor.constraint(equalTo: alarm_label.leftAnchor).isActive = true
        alarm_sublabel.widthAnchor.constraint(equalTo: alarm_label.widthAnchor).isActive = true
        alarm_sublabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        alarm_divider.topAnchor.constraint(equalTo: alarm_sublabel.bottomAnchor,constant:8).isActive = true
        alarm_divider.leftAnchor.constraint(equalTo: alarm_sublabel.leftAnchor).isActive = true
        alarm_divider.widthAnchor.constraint(equalTo: alarm_sublabel.widthAnchor).isActive = true
        alarm_divider.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        vibrate_label.topAnchor.constraint(equalTo: alarm_sublabel.bottomAnchor,constant:16).isActive = true
        vibrate_label.leftAnchor.constraint(equalTo: alarm_sublabel.leftAnchor).isActive = true
        vibrate_label.widthAnchor.constraint(equalTo: alarm_sublabel.widthAnchor).isActive = true
        vibrate_label.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        vibrate_divider.topAnchor.constraint(equalTo: vibrate_label.bottomAnchor,constant:8).isActive = true
        vibrate_divider.leftAnchor.constraint(equalTo: vibrate_label.leftAnchor).isActive = true
        vibrate_divider.widthAnchor.constraint(equalTo: vibrate_label.widthAnchor).isActive = true
        vibrate_divider.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        label_label.topAnchor.constraint(equalTo: vibrate_label.bottomAnchor,constant:16).isActive = true
        label_label.leftAnchor.constraint(equalTo: vibrate_label.leftAnchor).isActive = true
        label_label.widthAnchor.constraint(equalTo: vibrate_label.widthAnchor).isActive = true
        label_label.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        label_sublabel.topAnchor.constraint(equalTo: label_label.bottomAnchor).isActive = true
        label_sublabel.leftAnchor.constraint(equalTo: label_label.leftAnchor).isActive = true
        label_sublabel.widthAnchor.constraint(equalTo: label_label.widthAnchor).isActive = true
        label_sublabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        label_divider.topAnchor.constraint(equalTo: label_sublabel.bottomAnchor,constant:8).isActive = true
        label_divider.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        label_divider.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        label_divider.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        delete_button.topAnchor.constraint(equalTo: label_divider.bottomAnchor,constant:16).isActive = true
        delete_button.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        delete_button.widthAnchor.constraint(equalToConstant: 32).isActive = true
        delete_button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        unexpand_button.centerYAnchor.constraint(equalTo: delete_button.centerYAnchor).isActive = true
        unexpand_button.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        unexpand_button.widthAnchor.constraint(equalToConstant: 24).isActive = true
        unexpand_button.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        bottom_line.topAnchor.constraint(equalTo: delete_button.bottomAnchor,constant:16).isActive = true
        bottom_line.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        bottom_line.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        bottom_line.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    
    func setupRepeatCell(){
        var title_arr = [0:"S",1:"M",2:"T",3:"W",4:"T",5:"F",6:"S"]
        for i in 0..<7{
            let button = UIButton(frame: CGRect(x: 40*i, y: 0, width: 32, height: 32))
            button.layer.cornerRadius = 16
            button.backgroundColor = UIColor(red: 4/255, green: 143/255, blue: 118/255, alpha: 1)
            button.setTitleColor(UIColor.white.withAlphaComponent(0.8), for: .normal)
            button.setTitle(title_arr[i], for: .normal)
            button.tag = 1
            button.addTarget(self, action: #selector(handleRepeatButton), for: .touchUpInside)
            button_arr.append(button)
            repeat_view.addSubview(button)
        }
    }
    
    @objc func handleRepeatButton(_ sender:UIButton){
        if sender.tag == 1{
            sender.tag = 0
            sender.backgroundColor = UIColor.lightGray
        }else{
            sender.tag = 1
            sender.backgroundColor = UIColor(red: 4/255, green: 143/255, blue: 118/255, alpha: 1)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
