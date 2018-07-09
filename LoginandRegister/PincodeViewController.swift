//
//  PincodeViewController.swift
//  WiFi_Locker
//
//  Created by 笨蛋 on 7/7/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit
import Foundation

class PincodeViewController: UIViewController {
    
    var enter_title:UILabel={
        let label = UILabel()
        label.textColor = UIColor.white
        label.text = "Enter Pincode"
        label.font  = label.font.withSize(20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(enter_title)
        
        setupTextfield()
        setupConstrain()
        // Do any additional setup after loading the view.
    }
    
    func setupConstrain(){
        enter_title.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        enter_title.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        enter_title.heightAnchor.constraint(equalToConstant: 24).isActive = true
        enter_title.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -64).isActive = true
    }
    
    func setupTextfield(){
        let unit_width = UIScreen.main.bounds.width/9
        for i in 0..<4{
            let tf = UITextField(frame: CGRect(x: CGFloat(2*i+1)*unit_width, y: 180, width: 56, height: 56))
            tf.backgroundColor = UIColor.white.withAlphaComponent(0.75)
            view.addSubview(tf)
        }
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
