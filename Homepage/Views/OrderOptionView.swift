//
//  OrderOptionView.swift
//  WiFi_Locker
//
//  Created by 笨蛋 on 8/2/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

class OrderOptionView: BasicView,UITableViewDelegate,UITableViewDataSource {
    
    var title_arr = ["Recently Accessed","Order from A to Z","Order from Z to A","Recommend high to low","Recommend low to high"]

    lazy var tableview:UITableView={
        let tbl = UITableView()
        tbl.layer.cornerRadius = 4
        tbl.delegate = self
        tbl.dataSource = self
        tbl.isScrollEnabled = false
        tbl.showsVerticalScrollIndicator = false
        tbl.backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1)
        tbl.tableFooterView = UIView()
        tbl.separatorInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        tbl.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tbl.translatesAutoresizingMaskIntoConstraints = false
        return tbl
    }()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 32
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.textColor = UIColor.black
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        cell.textLabel?.text = title_arr[indexPath.row]
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor.white
        return cell
    }
    
    lazy var remove_button:UIButton={
        let btn = UIButton()
        btn.frame = UIScreen.main.bounds
        btn.addTarget(self, action: #selector(remove), for: .touchUpInside)
        return btn
    }()
    
    @objc func remove(){
        self.isHidden = true
    }
    
    override func setupView() {
        
        addSubview(remove_button)
        addSubview(tableview)
        addConstraintsWithFormat(format: "H:|-80-[v0(200)]", views: tableview)
        addConstraintsWithFormat(format: "V:|-104-[v0(160)]", views: tableview)

    }

}
