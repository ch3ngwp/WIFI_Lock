//
//  CalendarView.swift
//  WiFi_Locker
//
//  Created by 笨蛋 on 8/1/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

class CalendarView: BasicView,UITableViewDelegate,UITableViewDataSource {

    weak var delegate:CalendarViewdelegate?
    var time:[(String,String)] = []{
        didSet{
            isExpand = [Bool](repeating: true, count: time.count)
        }
    }
    
    var isExpand:[Bool]?
    lazy var tableview:UITableView={
        let tbl = UITableView()
        tbl.delegate = self
        tbl.dataSource = self
        tbl.showsVerticalScrollIndicator = false
        tbl.backgroundColor = UIColor.clear
        tbl.tableFooterView = UIView()
        tbl.separatorInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        tbl.register(CalendarTableViewCell.self, forCellReuseIdentifier: "cell")
        tbl.translatesAutoresizingMaskIntoConstraints = false
        return tbl
    }()
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64))
        view.backgroundColor = MyColor.calendar_bg
        
        
        let time_label = UILabel(frame: CGRect(x: 24, y: 0, width: UIScreen.main.bounds.width-48, height: 64))
        time_label.textColor = UIColor.white
        time_label.font = UIFont.boldSystemFont(ofSize: 20)
        time_label.text = "\(self.time[section].0) - \(self.time[section].1)"
        view.addSubview(time_label)
        
        let switchBar = UISwitch(frame: CGRect(x: UIScreen.main.bounds.width-48, y: 16, width: 0, height: 0))
        switchBar.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
        switchBar.isOn = isExpand![section]
        view.addSubview(switchBar)
        
        let handle_button = UIButton(frame: CGRect(x: 24, y: 0, width: UIScreen.main.bounds.width-48, height: 64))
        handle_button.tag = section
        handle_button.addTarget(self, action: #selector(handleExpand), for: .touchUpInside)
        view.addSubview(handle_button)
        
        return view
    }
    
    @objc func handleExpand(_ sender:UIButton){
        let index = sender.tag
        let statu = isExpand![index]
        isExpand![index] = !statu
        self.tableview.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 64
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.time.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isExpand![section]{
            return 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CalendarTableViewCell
        cell.delegate = self.delegate
        cell.tag = indexPath.section
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    
    override func setupView() {
        
        addSubview(tableview)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: tableview)
        addConstraintsWithFormat(format: "V:|[v0]|", views: tableview)
        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
