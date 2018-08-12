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
        tv.text = "Terms of Use\nWifilock is an app lock that provide security and privacy so"
        tv.font = tv.font?.withSize(16)
        tv.textAlignment = .center
        tv.backgroundColor = UIColor.clear
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    var left_tv:UITextView={
        let tv = UITextView()
        tv.text = "Wifilock has the consent of the user to make changes outside the app to access another apps & internet.\n\nThe user is aware that wifilock make changes outside the app to access another apps & internet.\n\nBy accepting these terms the user has the knowledge and understands the function performed by this application."
        tv.font = tv.font?.withSize(14)
        tv.textAlignment = .left
        tv.backgroundColor = UIColor.clear
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    lazy var decline_button:UIButton={
        let btn = UIButton(type: UIButtonType.system)
        btn.backgroundColor = UIColor.clear
        btn.setTitle("DECLINE", for: .normal)
        btn.setTitleColor(UIColor.red, for: .normal)
        btn.addTarget(self, action: #selector(handleDecline), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    @objc func handleDecline(){
        exit(0)
    }
    
    var accept_button:UIButton={
        let btn = UIButton(type: UIButtonType.system)
        btn.backgroundColor = UIColor.clear
        btn.setTitle("ACCEPT", for: .normal)
        btn.setTitleColor(UIColor.green.withAlphaComponent(0.75), for: .normal)
        btn.addTarget(self, action: #selector(handleAccept), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    @objc func handleAccept(){
        UserDefaults.standard.set(true, forKey: "isAccept")
        let vc = LoginViewController()
        self.present(vc, animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(main_view)
        
        main_view.addSubview(title_view)
        main_view.addSubview(center_tv)
        main_view.addSubview(left_tv)
        main_view.addSubview(decline_button)
        main_view.addSubview(accept_button)

        setupConstraint()
        
        // Do any additional setup after loading the view.
    }

    func setupConstraint(){
        main_view.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        main_view.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        main_view.heightAnchor.constraint(equalToConstant: 360).isActive = true
        main_view.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -32).isActive = true
        
        title_view.centerXAnchor.constraint(equalTo: main_view.centerXAnchor).isActive = true
        title_view.topAnchor.constraint(equalTo: main_view.topAnchor).isActive = true
        title_view.widthAnchor.constraint(equalToConstant: 120).isActive = true
        title_view.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        
        center_tv.centerXAnchor.constraint(equalTo: main_view.centerXAnchor).isActive = true
        center_tv.topAnchor.constraint(equalTo: title_view.bottomAnchor).isActive = true
        center_tv.widthAnchor.constraint(equalTo: main_view.widthAnchor, constant: -64).isActive = true
        center_tv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        
        left_tv.centerXAnchor.constraint(equalTo: main_view.centerXAnchor).isActive = true
        left_tv.topAnchor.constraint(equalTo: center_tv.bottomAnchor).isActive = true
        left_tv.widthAnchor.constraint(equalTo: main_view.widthAnchor, constant: -32).isActive = true
        left_tv.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        decline_button.leftAnchor.constraint(equalTo: main_view.centerXAnchor).isActive = true
        decline_button.topAnchor.constraint(equalTo: left_tv.bottomAnchor).isActive = true
        decline_button.widthAnchor.constraint(equalToConstant: 64).isActive = true
        decline_button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        accept_button.rightAnchor.constraint(equalTo: left_tv.rightAnchor).isActive = true
        accept_button.topAnchor.constraint(equalTo: left_tv.bottomAnchor).isActive = true
        accept_button.widthAnchor.constraint(equalToConstant: 64).isActive = true
        accept_button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
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
