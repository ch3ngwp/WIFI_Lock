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
    func JumptoCalendar(index:Int)
    func TypedInTime(index:Int,time:(String,String))
}

class AppCellView:UITableViewCell{
    
    weak var delegate:handleHomepageDelegate?
    
    var cell_data:(UIImage,String,Int,Int,[(String,String)])?{
        didSet{
            self.app_icon.image = cell_data?.0
            self.app_name.text = cell_data?.1
            if cell_data?.2 == 0{
                self.check_wifi.setBackgroundImage(UIImage(named: "icons8-unok-96"), for: .normal)
            }
            if cell_data?.3 == 0{
                self.check_cel.setBackgroundImage(UIImage(named: "icons8-unok-96"), for: .normal)
            }
            var timeStr = "Time: "
            for time in (cell_data?.4)!{
                timeStr += "\(time.0) - \(time.1)"
            }
            self.time_button.setTitle("\(timeStr)", for: .normal)
        }
    }
    var app_icon:UIImageView={
        let img = UIImageView()
        return img
    }()
    
    var app_name:UILabel={
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = label.font.withSize(12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var time_button:UIButton={
        let label = UIButton()
        label.setTitleColor(UIColor.white.withAlphaComponent(0.5), for: .normal)
        label.titleLabel?.font = label.titleLabel?.font.withSize(16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.addTarget(self, action: #selector(handleSelectTime), for: .touchUpInside)
        return label
    }()
    
    @objc func handleSelectTime(){
        if let window = UIApplication.shared.keyWindow{
            let view = SelectTimeView()
            view.start_time = cell_data?.4[0].0
            view.end_time = cell_data?.4[0].1
            view.frame = window.frame
            view.tag = self.tag
            view.delegate = self.delegate
            window.addSubview(view)
        }
    }
    
    lazy var calendar_button:UIButton={
        let btn = UIButton()
        btn.setImage(UIImage(named: "icons8-calendar"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFill
        btn.addTarget(self, action: #selector(handletoCalendar), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    @objc func handletoCalendar(){
        if let delegate = self.delegate as handleHomepageDelegate?{
            delegate.JumptoCalendar(index: self.tag)
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
        addSubview(time_button)
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
        
        time_button.topAnchor.constraint(equalTo: app_name.bottomAnchor).isActive = true
        time_button.leftAnchor.constraint(equalTo: app_icon.rightAnchor, constant: 8).isActive = true
        time_button.heightAnchor.constraint(equalToConstant: 24).isActive = true
        time_button.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, multiplier: 1/2).isActive = true
        
        calendar_button.leftAnchor.constraint(equalTo: time_button.rightAnchor, constant: 16).isActive = true
        calendar_button.topAnchor.constraint(equalTo: time_button.topAnchor, constant: 0).isActive = true
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
    
    var app_data:[(UIImage,String,Int,Int,[(String,String)])] = [
        (#imageLiteral(resourceName: "icons8-facebook-48"),"Facebook",1,1,[("06:00","09:00")]),
        (#imageLiteral(resourceName: "icons8-google-maps-48"),"GoogleMaps",1,1,[("06:00","09:00")]),
        (#imageLiteral(resourceName: "icons8-amazon-48"),"Amazon",1,1,[("06:00","09:00")]),
        (#imageLiteral(resourceName: "icons8-whatsapp-48"),"Whatsapp",1,0,[("06:00","09:00")]),
        (#imageLiteral(resourceName: "icons8-weixin-96"),"Wechat",1,1,[("06:00","09:00")]),
        (#imageLiteral(resourceName: "icons8-twitter-96"),"Twitter",1,1,[("06:00","09:00")]),
        (#imageLiteral(resourceName: "icons8-yelp-96"),"Yelp",1,1,[("06:00","09:00")]),
    ]
    

    var navigation:NavigationView={
        let nav = NavigationView()
        nav.title.text = "APPS"
        return nav
    }()
    
    var left_navi_item:UIButton={
        let btn = UIButton(frame: CGRect(x: 0, y: 8, width: 24, height: 24))
//        btn.setBackgroundImage(UIImage(named: "wifilock"), for: .normal)
        return btn
    }()
    lazy var right_navi_item:UIButton={
        let btn = UIButton(frame: CGRect(x: 40, y: 0, width: 32, height: 32))
        btn.layer.cornerRadius = 16
        btn.setImage(UIImage(named: "icons8-user-32"), for: .normal)
        btn.backgroundColor = UIColor.white
        return btn
    }()
    
    var un_settingView:UnsettingView={
        let view = UnsettingView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var OrderView:OrderOptionView={
        let view = OrderOptionView()
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var AddNewView:AddNewAppView={
        let view = AddNewAppView()
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    lazy var tableview:UITableView={
        let tbl = UITableView(frame: .zero, style: .grouped)
        tbl.delegate = self
        tbl.dataSource = self
        tbl.separatorColor = UIColor.white.withAlphaComponent(0.5)
        tbl.showsVerticalScrollIndicator = false
        tbl.backgroundColor = UIColor.clear
        tbl.tableFooterView = UIView()
        tbl.separatorInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        tbl.register(AppCellView.self, forCellReuseIdentifier: "cell")
        tbl.translatesAutoresizingMaskIntoConstraints = false
        return tbl
    }()
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64))
//        view.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        view.backgroundColor = MyColor.calendar_bg
        
        let add_button = UIButton(frame: CGRect(x: 16, y: 16, width: 32, height: 32))
        add_button.layer.cornerRadius = 4
        add_button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        add_button.setTitle("+", for: .normal)
        add_button.contentVerticalAlignment = .center
//        add_button.backgroundColor = UIColor.red
        add_button.addTarget(self, action: #selector(showAddNewView), for: .touchUpInside)
        view.addSubview(add_button)
        
        let order_button = UIButton(frame: CGRect(x: 64, y: 16, width: 32, height: 32))
        order_button.layer.cornerRadius = 4
        order_button.setImage(UIImage(named: "icons8-list"), for: .normal)
//        order_button.backgroundColor = UIColor.red
        order_button.addTarget(self, action: #selector(showOrderOption), for: .touchUpInside)
        view.addSubview(order_button)
        
        let wifi_label = UILabel(frame: CGRect(x: UIScreen.main.bounds.width-88, y:40 , width: 40, height: 16))
        wifi_label.text = "Wifi"
        wifi_label.textAlignment = .center
        wifi_label.textColor = UIColor.white
        wifi_label.font = wifi_label.font.withSize(10)
        view.addSubview(wifi_label)
        
        let wifi_image = UIImageView(frame: CGRect(x: UIScreen.main.bounds.width-80, y:16 , width: 24, height: 24))
        wifi_image.image = UIImage(named:"icons8-ok-96")
        wifi_image.contentMode = .scaleAspectFit
        view.addSubview(wifi_image)
        
        let cel_label = UILabel(frame: CGRect(x: UIScreen.main.bounds.width-48, y:40 , width: 40, height: 16))
        cel_label.text = "Cellular"
        cel_label.textAlignment = .center
        cel_label.textColor = UIColor.white
        cel_label.font = wifi_label.font.withSize(10)
        view.addSubview(cel_label)
        
        let cel_image = UIImageView(frame: CGRect(x: UIScreen.main.bounds.width-40, y: 16, width: 24, height: 24))
        cel_image.image = UIImage(named:"icons8-ok-96")
        cel_image.contentMode = .scaleAspectFit
        view.addSubview(cel_image)
        
        return view
    }
    
    @objc func showAddNewView(){
        self.AddNewView.selected_app_data = self.app_data
        self.AddNewView.isHidden = false
        self.AddNewView.tableview.reloadData()
    }
    
    @objc func showOrderOption(){
        self.OrderView.isHidden = false
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.app_data.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AppCellView
        cell.cell_data = self.app_data[indexPath.row]
        cell.backgroundColor = MyColor.calendar_bg.withAlphaComponent(0.75)
        cell.selectionStyle = .none
        cell.delegate = self
        cell.tag = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0{
            scrollView.contentOffset.y = 0
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        setupNavigation()
        
        view.addSubview(tableview)
        view.addSubview(un_settingView)

        tableview.topAnchor.constraint(equalTo: navigation.bottomAnchor).isActive = true
        tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableview.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        un_settingView.topAnchor.constraint(equalTo: navigation.bottomAnchor).isActive = true
        un_settingView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        un_settingView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        un_settingView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        view.addSubview(AddNewView)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: AddNewView)
        view.addConstraintsWithFormat(format: "V:|[v0]|", views: AddNewView)
        
        view.addSubview(OrderView)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: OrderView)
        view.addConstraintsWithFormat(format: "V:|[v0]|", views: OrderView)
        
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "setting"), object: nil, queue: OperationQueue.main) {
            pNotification in
            self.CheckSetting()
            // Your code here
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.CheckSetting()
    }
    
    func CheckSetting(){
        let statu = UserDefaults.standard.bool(forKey: "isSetting")
        print("status \(statu)")
        if statu{
            self.un_settingView.removeFromSuperview()
        }
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
    
    func TypedInTime(index:Int,time:(String,String)){
        self.app_data[index].4 = []
        self.app_data[index].4.append(time)
        self.tableview.reloadData()
    }
    
    func JumptoCalendar(index:Int){
        let vc = CalendarViewController()
        vc.calendar_view.time = self.app_data[index].4
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
