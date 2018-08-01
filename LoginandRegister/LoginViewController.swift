//
//  LoginViewController.swift
//  WiFi_Locker
//
//  Created by 笨蛋 on 7/5/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

protocol LoginViewdelegate:NSObjectProtocol {
    func handleSignin()
    func handleSignup()
    func handleResetPassword()
    func handleBacktoSignin()
    func handleCreateAccount()
}

class LoginViewController: UIViewController,LoginViewdelegate {

    var logo_image:UIImageView={
        let img = UIImageView()
        img.image = UIImage(named: "wifilock")
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()

    
    lazy var signin_view:LoginView={
        let view = LoginView()
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var signup_iew:SignupView={
        let view = SignupView()
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(logo_image)
        view.addSubview(signup_iew)
        view.addSubview(signin_view)

        setupConstraint()

        
        // Do any additional setup after loading the view.
    }
    
    var LoginViewLeftAncihor:NSLayoutConstraint?
    var SignupViewLeftAncihor:NSLayoutConstraint?
    func setupConstraint(){
        LoginViewLeftAncihor =  signin_view.leftAnchor.constraint(equalTo: view.leftAnchor,constant:16)
        LoginViewLeftAncihor?.isActive = true
        signin_view.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 32).isActive = true
        signin_view.heightAnchor.constraint(equalToConstant: 320).isActive = true
        signin_view.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -32).isActive = true

        SignupViewLeftAncihor =  signup_iew.leftAnchor.constraint(equalTo: view.leftAnchor,constant:16 + UIScreen.main.bounds.width)
        SignupViewLeftAncihor?.isActive = true
        signup_iew.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 32).isActive = true
        signup_iew.heightAnchor.constraint(equalToConstant: 320).isActive = true
        signup_iew.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -32).isActive = true
        
//
        
        logo_image.topAnchor.constraint(equalTo: view.topAnchor, constant: 72).isActive = true
        logo_image.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logo_image.heightAnchor.constraint(equalToConstant: 80).isActive = true
        logo_image.widthAnchor.constraint(equalToConstant: 80).isActive = true
    }

    override func viewDidAppear(_ animated: Bool) {
        IsAcceptTerm()
    }
    
    func IsAcceptTerm(){
        let isAccept = UserDefaults.standard.bool(forKey: "isAccept")
        if !isAccept{
            let vc = TermViewController()
            self.present(vc, animated: false, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleSignin(){
//        let vc = HomeViewController()
        let vc = MainTabbarViewController()
        self.present(vc, animated: false, completion: nil)
    }
    
    func handleSignup(){
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
            self.LoginViewLeftAncihor?.constant = 16 - UIScreen.main.bounds.width
            self.SignupViewLeftAncihor?.constant = 16
        }, completion: nil)
    }
    
    func handleResetPassword(){
    
    }
    
    func handleBacktoSignin(){
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
            self.LoginViewLeftAncihor?.constant = 16
            self.SignupViewLeftAncihor?.constant = 16 + UIScreen.main.bounds.width
        }, completion: nil)
    }
    
    func handleCreateAccount(){
        
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
