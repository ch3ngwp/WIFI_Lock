//
//  SettingViewController.swift
//  WiFi_Locker
//
//  Created by 笨蛋 on 7/7/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit


class styleCell:BasicView{
    var image_style:UIImageView={
        let img = UIImageView(frame: CGRect(x: 16, y: 8, width: 32, height: 32))
        img.image = UIImage(named: "view")
        img.layer.cornerRadius = 16
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()
    
    var cell_text:UILabel={
        let label = UILabel(frame: CGRect(x: 64, y: 8, width: UIScreen.main.bounds.width-80, height: 32))
        label.textColor = UIColor.black
        return label
    }()
    
    override func setupView() {
        addSubview(image_style)
        addSubview(cell_text)
    }
}


class SettingViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var stylecells:[UIView] = []
    var style_texts = ["Background Image","Touch effect color","Theme color"]
    var profile_texts = ["Change profile","Change pincode","Change password","Delete account"]
    var account_texts = ["Phone setting","Contact us","About us","Privacy","Help & Review","Log out"]
    var navigation:NavigationView={
        let nav = NavigationView()
        nav.title.text = "Account Setting"
        return nav
    }()
    
    lazy var tableview:UITableView={
        let tbl = UITableView(frame: .zero, style: .grouped)
        tbl.delegate = self
        tbl.dataSource = self
        tbl.showsVerticalScrollIndicator = false
        tbl.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        tbl.separatorInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        tbl.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tbl.translatesAutoresizingMaskIntoConstraints = false
        return tbl
    }()
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 1))
        view.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        if section == 0{
            view.frame.size.height = 0
        }
        return view
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 3
        }else if(section == 1){
            return 4
        }
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.selectionStyle = .none
        cell.textLabel?.textColor = UIColor.white
        cell.backgroundColor = MyColor.calendar_bg
        if indexPath.section == 0{
            for v in cell.subviews{
                v.removeFromSuperview()
            }
            cell.addSubview(stylecells[indexPath.row])
            return cell
        }else if(indexPath.section == 1){
            cell.textLabel?.text = profile_texts[indexPath.row]
            return cell
        }
        cell.textLabel?.text = account_texts[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 48
        }else if(indexPath.section == 1){
            return 40
        }
        return 48
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 2 && indexPath.row == 5{
            self.dismiss(animated: false, completion: nil)
        }
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
        setupStyleCells()
        view.addSubview(tableview)
        
        setupConstraint()
        
        // Do any additional setup after loading the view.
    }
    
    func setupStyleCells(){
        for i in 0..<3{
            let view = styleCell()
            view.cell_text.textColor = UIColor.white
            view.cell_text.text = style_texts[i]
            stylecells.append(view)
        }
        tableview.reloadData()
    }
    
    func setupNavigation(){
        view.addSubview(navigation)
        
//        navigation.left_view.addSubview(left_navi_item)
//        navigation.right_view.addSubview(right_navi_item)
        
    }

    func setupConstraint(){
        tableview.topAnchor.constraint(equalTo: navigation.bottomAnchor).isActive = true
        tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableview.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
