//
//  CalendarViewController.swift
//  WiFi_Locker
//
//  Created by 笨蛋 on 7/9/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

protocol CalendarViewdelegate:NSObjectProtocol {
    func handleUnexpand(index:Int)
}


class CalendarViewController: UIViewController,CalendarViewdelegate {

    var navigation:NavigationView={
        let nav = NavigationView()
        nav.title.text = "Calendar"
        return nav
    }()
    
    lazy var left_navi_item:UIButton={
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 64, height: 40))
        btn.setTitle("Back", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.contentHorizontalAlignment = .left
        btn.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        return btn
    }()
    
    @objc func handleBack(){
        self.dismiss(animated: false, completion: nil)
    }
    
    lazy var right_navi_item:UIButton={
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 64, height: 40))
        btn.setTitle("+", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.contentHorizontalAlignment = .right
        btn.addTarget(self, action: #selector(handleSave), for: .touchUpInside)
        return btn
    }()
    
    @objc func handleSave(){
        calendar_view.time.append(("00:00","00:00"))
        calendar_view.tableview.reloadData()
    }
    
    lazy var calendar_view:CalendarView={
        let view = CalendarView()
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupNavigation()
        
        view.addSubview(calendar_view)
        
        calendar_view.topAnchor.constraint(equalTo: navigation.bottomAnchor).isActive = true
        calendar_view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        calendar_view.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true

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
    
    func handleUnexpand(index:Int){
        self.calendar_view.isExpand![index] = false
        self.calendar_view.tableview.reloadData()
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
