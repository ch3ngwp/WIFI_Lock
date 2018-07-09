//
//  TermViewController.swift
//  WiFi_Locker
//
//  Created by 笨蛋 on 7/9/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

class TermViewController: UIViewController {

    var main_view:UIView={
        let view = UIView()
        view.layer.cornerRadius = 4
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var title_view:UIImageView={
        let img = UIImageView()
        img.image = UIImage(named: "title2")
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    var center_tv:UITextView={
        let tv = UITextView()
        tv.backgroundColor = UIColor.clear
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(main_view)
        
        main_view.addSubview(title_view)
        setupConstraint()
        
        // Do any additional setup after loading the view.
    }

    func setupConstraint(){
        main_view.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        main_view.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        main_view.heightAnchor.constraint(equalToConstant: 400).isActive = true
        main_view.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -32).isActive = true
        
        title_view.centerXAnchor.constraint(equalTo: main_view.centerXAnchor).isActive = true
        title_view.topAnchor.constraint(equalTo: main_view.topAnchor).isActive = true
        title_view.widthAnchor.constraint(equalToConstant: 120).isActive = true
        title_view.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
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
