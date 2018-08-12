//
//  PincodeViewController.swift
//  WiFi_Locker
//
//  Created by 笨蛋 on 7/7/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit
import Foundation

class PincodeViewController: UIViewController,UITextFieldDelegate {
    
    
    var textfieldList:[UITextField] = []
    var textfiledListView:UIStackView={
        let stackView = UIStackView()
        stackView.layer.cornerRadius = 4
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 24
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var enter_title:UILabel={
        let label = UILabel()
        label.textColor = UIColor.white
        label.text = "Enter Pincode"
        label.font  = label.font.withSize(20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var save_button:UIButton={
        let btn = UIButton(type: UIButtonType.system)
        btn.layer.cornerRadius = 4
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = UIColor.red
        btn.setTitle("Save", for: .normal)
        btn.addTarget(self, action: #selector(Save), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    @objc func Save(){
        self.dismiss(animated: false, completion: nil)
    }
    
    lazy var remove_button:UIButton={
        let btn = UIButton()
        btn.frame = UIScreen.main.bounds
        btn.isHidden = true
        btn.addTarget(self, action: #selector(remove), for: .touchUpInside)
        return btn
    }()

    @objc func remove(){
        print("remove")
        self.remove_button.isHidden = true

        for tf in self.textfieldList{
            tf.resignFirstResponder()
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(enter_title)
        view.addSubview(textfiledListView)
        view.addSubview(save_button)
        view.addSubview(remove_button)

        setupConstrain()
        
        
        for i in 0..<4{
            let tf = UITextField()
            tf.textAlignment = .center
            tf.keyboardType = .numberPad
            tf.returnKeyType = .done
            tf.backgroundColor = UIColor.white
            tf.frame.size = CGSize(width: 56, height: 56)
            tf.delegate = self
            tf.tag = i
            tf.addTarget(self, action: #selector(NextTextfield), for: .editingChanged)
            self.textfieldList.append(tf)
            textfiledListView.addArrangedSubview(tf)
        }
        // Do any additional setup after loading the view.
    }
    
    @objc func NextTextfield(_ sender:UITextField){
        let index = sender.tag
        if index < 3{
            self.textfieldList[index].resignFirstResponder()
            self.textfieldList[index+1].becomeFirstResponder()
        }
    }
    
    func setupConstrain(){
        enter_title.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        enter_title.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        enter_title.heightAnchor.constraint(equalToConstant: 24).isActive = true
        enter_title.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -64).isActive = true
        
        textfiledListView.topAnchor.constraint(equalTo: enter_title.bottomAnchor, constant: 24).isActive = true
        textfiledListView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textfiledListView.widthAnchor.constraint(equalTo: view.widthAnchor,constant:-80).isActive = true
        textfiledListView.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        save_button.topAnchor.constraint(equalTo: textfiledListView.bottomAnchor,constant:40).isActive = true
        save_button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        save_button.widthAnchor.constraint(equalToConstant: 120).isActive = true
        save_button.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.remove_button.isHidden = false
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
