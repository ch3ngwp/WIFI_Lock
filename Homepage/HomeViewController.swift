//
//  HomeViewController.swift
//  WiFi_Locker
//
//  Created by 笨蛋 on 7/5/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit
import Foundation

protocol handleHomepageDelegate:NSObjectProtocol {
    func JumptoCalendar()
}

class AppCellView:UITableViewCell{
    
    weak var delegate:handleHomepageDelegate?
    
    var app_icon:UIImageView={
        let img = UIImageView()
        return img
    }()
    
    var app_name:UILabel={
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = label.font.withSize(12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var time_label:UILabel={
        let label = UILabel()
        label.textColor = UIColor.black.withAlphaComponent(0.5)
        label.font = label.font.withSize(16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var calendar_button:UIButton={
        let btn = UIButton()
        btn.setImage(UIImage(named: "icons8-calendar-64"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFill
        btn.addTarget(self, action: #selector(handletoCalendar), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    @objc func handletoCalendar(){
        if let delegate = self.delegate as handleHomepageDelegate?{
            delegate.JumptoCalendar()
        }
    }
    
    lazy var check_wifi:UIButton={
        let btn = UIButton()
        btn.setBackgroundImage(UIImage(named: "icons8-ok-96"), for: .normal)
        btn.imageView?.contentMode = .scaleToFill
        btn.clipsToBounds = true
        btn.addTarget(self, action: #selector(handleSelected), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.tag = 1
        return btn
    }()
    
    @objc func handleSelected(_ sender:UIButton){
        let index = sender.tag
        switch index{
        case 0:
            sender.tag = 1
            sender.setBackgroundImage(UIImage(named: "icons8-ok-96"), for: .normal)
        case 1:
            sender.tag = 0
            sender.setBackgroundImage(UIImage(named: "icons8-unok-96"), for: .normal)
        default:
            print("default")
        }
    }
    
    lazy var check_cel:UIButton={
        let btn = UIButton()
        btn.setBackgroundImage(UIImage(named: "icons8-ok-96"), for: .normal)
        btn.imageView?.contentMode = .scaleToFill
        btn.clipsToBounds = true
        btn.addTarget(self, action: #selector(handleSelected), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(app_icon)
        addSubview(app_name)
        addSubview(time_label)
        addSubview(calendar_button)
        addSubview(check_wifi)
        addSubview(check_cel)
        
        addConstraintsWithFormat(format: "V:|-4-[v0]-4-|", views: app_icon)
        app_icon.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 4).isActive = true
        app_icon.widthAnchor.constraint(equalTo: app_icon.heightAnchor).isActive = true
        
        app_name.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        app_name.leftAnchor.constraint(equalTo: app_icon.rightAnchor, constant: 8).isActive = true
        app_name.heightAnchor.constraint(equalToConstant: 24).isActive = true
        app_name.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, multiplier: 1/2).isActive = true
        
        time_label.topAnchor.constraint(equalTo: app_name.bottomAnchor).isActive = true
        time_label.leftAnchor.constraint(equalTo: app_icon.rightAnchor, constant: 8).isActive = true
        time_label.heightAnchor.constraint(equalToConstant: 24).isActive = true
        time_label.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, multiplier: 1/2).isActive = true
        
        calendar_button.leftAnchor.constraint(equalTo: time_label.rightAnchor, constant: 16).isActive = true
        calendar_button.topAnchor.constraint(equalTo: time_label.topAnchor, constant: 0).isActive = true
        calendar_button.heightAnchor.constraint(equalToConstant: 24).isActive = true
        calendar_button.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        check_cel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        check_cel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        check_cel.widthAnchor.constraint(equalToConstant: 24).isActive = true
        check_cel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        check_wifi.rightAnchor.constraint(equalTo: check_cel.leftAnchor, constant: -16).isActive = true
        check_wifi.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        check_wifi.widthAnchor.constraint(equalToConstant: 24).isActive = true
        check_wifi.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,handleHomepageDelegate {
    
    

    var navigation:NavigationView={
        let nav = NavigationView()
        nav.title.text = "APPS"
        return nav
    }()
    
    var left_navi_item:UIButton={
        let btn = UIButton(frame: CGRect(x: 0, y: 8, width: 24, height: 24))
        btn.setBackgroundImage(UIImage(named: "wifilock"), for: .normal)
        return btn
    }()
    lazy var right_navi_item:UIButton={
        let btn = UIButton(frame: CGRect(x: 40, y: 8, width: 24, height: 24))
        btn.setBackgroundImage(UIImage(named: "icons8-settings-button"), for: .normal)
        btn.addTarget(self, action: #selector(setting), for: .touchUpInside)
        return btn
    }()
    
    @objc func setting(){
        let vc = SettingViewController()
        self.present(vc, animated: false, completion: nil)
    }
    
    lazy var tableview:UITableView={
        let tbl = UITableView()
        tbl.delegate = self
        tbl.dataSource = self
        tbl.showsVerticalScrollIndicator = false
        tbl.backgroundColor = UIColor.clear
        tbl.tableFooterView = UIView()
        tbl.separatorInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        tbl.register(AppCellView.self, forCellReuseIdentifier: "cell")
        tbl.translatesAutoresizingMaskIntoConstraints = false
        return tbl
    }()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AppCellView
        cell.app_icon.image = UIImage(named: "icons8-facebook-48")
        cell.app_name.text = "Facebook"
        cell.time_label.text = "Time: 6:00 - 9:00"
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = .none
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        setupNavigation()
        
        view.addSubview(tableview)
        tableview.topAnchor.constraint(equalTo: navigation.bottomAnchor).isActive = true
        tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableview.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        // Do any additional setup after loading the view.
    }

    func setupNavigation(){
        view.addSubview(navigation)
        
        navigation.left_view.addSubview(left_navi_item)
        navigation.right_view.addSubview(right_navi_item)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func JumptoCalendar(){
        let vc = CalendarViewController()
        self.present(vc, animated: false, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
