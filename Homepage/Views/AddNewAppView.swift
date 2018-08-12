//
//  AddNewAppView.swift
//  WiFi_Locker
//
//  Created by 笨蛋 on 8/2/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit
import BFPaperCheckbox

class newCellView:UITableViewCell{
    
    var is_selected:Bool = false{
        didSet{
            if is_selected{
                self.checkbox.check(animated: false)
            }else{
                self.checkbox.uncheck(animated: false)
            }
        }
    }
    
    var text_label:UILabel={
        let lb = UILabel()
        lb.textColor = UIColor.black
        lb.font = UIFont.systemFont(ofSize: 14)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    var checkbox:BFPaperCheckbox={
        let check = BFPaperCheckbox(frame: CGRect(x: 160, y: 4, width: 32, height: 32))
        check.transform = CGAffineTransform.init(scaleX: 0.75, y: 0.75)
        check.touchUpAnimationDuration = 0.5
        check.touchDownAnimationDuration = 0.5
        check.tintColor = UIColor.lightGray
        return check
    }()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(text_label)
        addSubview(checkbox)
        
        text_label.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        text_label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        text_label.widthAnchor.constraint(equalTo: self.widthAnchor,constant:-32).isActive = true
        text_label.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class AddNewAppView: BasicView,UITableViewDelegate,UITableViewDataSource {
    
    var search_tf = UITextField(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
    lazy var remove_button:UIButton={
        let btn = UIButton()
        btn.frame = UIScreen.main.bounds
        btn.addTarget(self, action: #selector(remove), for: .touchUpInside)
        return btn
    }()
    
    var selected_app_data:[(UIImage,String,Int,Int,[(String,String)])] = []
    var app_data:[(UIImage,String,Int,Int,[(String,String)])] = [
        (#imageLiteral(resourceName: "icons8-facebook-48"),"Facebook",1,1,[("06:00","09:00")]),
        (#imageLiteral(resourceName: "icons8-google-maps-48"),"GoogleMaps",1,1,[("06:00","09:00")]),
        (#imageLiteral(resourceName: "icons8-google-maps-48"),"YouTube",1,1,[("06:00","09:00")]),
        (#imageLiteral(resourceName: "icons8-google-maps-48"),"Messenger",1,1,[("06:00","09:00")]),
        (#imageLiteral(resourceName: "icons8-google-maps-48"),"Venmo",1,1,[("06:00","09:00")]),
        (#imageLiteral(resourceName: "icons8-amazon-48"),"Amazon",1,1,[("06:00","09:00")]),
        (#imageLiteral(resourceName: "icons8-whatsapp-48"),"Whatsapp",1,0,[("06:00","09:00")]),
        (#imageLiteral(resourceName: "icons8-weixin-96"),"Wechat",1,1,[("06:00","09:00")]),
        (#imageLiteral(resourceName: "icons8-twitter-96"),"Twitter",1,1,[("06:00","09:00")]),
        (#imageLiteral(resourceName: "icons8-yelp-96"),"Yelp",1,1,[("06:00","09:00")]),
        ]
    
    lazy var tableview:UITableView={
        let tbl = UITableView()
        tbl.layer.cornerRadius = 4
        tbl.delegate = self
        tbl.dataSource = self
        tbl.showsVerticalScrollIndicator = false
        tbl.backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1)
        tbl.tableFooterView = UIView()
        tbl.separatorInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        tbl.register(newCellView.self, forCellReuseIdentifier: "cell")
        tbl.translatesAutoresizingMaskIntoConstraints = false
        
        tbl.layer.borderColor = UIColor.black.withAlphaComponent(0.1).cgColor
        tbl.layer.borderWidth = 1
        return tbl
    }()
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        let leftview = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        let search_icon = UIImageView(frame: CGRect(x: 4, y: 4, width: 32, height: 32))
        search_icon.image = UIImage(named: "icons8-search-filled")
        search_icon.contentMode = .scaleAspectFit
        leftview.addSubview(search_icon)
        search_tf.leftViewMode = .always
        search_tf.leftView = leftview
        search_tf.backgroundColor = UIColor.white
        view.addSubview(search_tf)
        
        let divider = UIView(frame: CGRect(x: 0, y: 39, width: 200, height: 1))
        divider.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        view.addSubview(divider)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return app_data.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 32
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! newCellView
        cell.is_selected = isSelectedApp(index: indexPath.row)
        cell.text_label.text = app_data[indexPath.row].1
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor.white
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0{
            scrollView.contentOffset.y = 0
        }
    }
    
    func isSelectedApp(index:Int)->Bool{
        for item in self.selected_app_data{
            if self.app_data[index].1 == item.1{
                return true
            }
        }
        return false
    }
    
    @objc func remove(){
        self.search_tf.resignFirstResponder()
        self.isHidden = true
    }
    
    override func setupView() {
        addSubview(remove_button)
        addSubview(tableview)
        tableview.topAnchor.constraint(equalTo: self.topAnchor, constant: 104).isActive = true
        tableview.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 36).isActive = true
        tableview.widthAnchor.constraint(equalToConstant: 200).isActive = true
        tableview.heightAnchor.constraint(greaterThanOrEqualToConstant: 224).isActive = true
        
    }
        
}
