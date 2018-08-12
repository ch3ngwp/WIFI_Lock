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

    var background_view:UIImageView={
        let img = UIImageView()
//        img.image = UIImage(named: "background")
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
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
    
    lazy var forgivePwdView:ForgivePasswordView={
        let view = ForgivePasswordView()
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad(){
        super.viewDidLoad()
        
        view.addSubview(background_view)
        view.addSubview(logo_image)
        view.addSubview(forgivePwdView)
        view.addSubview(signup_iew)
        view.addSubview(signin_view)

        
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: background_view)
        view.addConstraintsWithFormat(format: "V:|[v0]|", views: background_view)

        setupConstraint()

        
        // Do any additional setup after loading the view.
    }
    
    var LoginViewLeftAncihor:NSLayoutConstraint?
    var SignupViewLeftAncihor:NSLayoutConstraint?
    var ForgivePwdLeftAncihor:NSLayoutConstraint?
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
        
        ForgivePwdLeftAncihor =  forgivePwdView.leftAnchor.constraint(equalTo: view.leftAnchor,constant:16 + UIScreen.main.bounds.width)
        ForgivePwdLeftAncihor?.isActive = true
        forgivePwdView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 32).isActive = true
        forgivePwdView.heightAnchor.constraint(equalToConstant: 320).isActive = true
        forgivePwdView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -32).isActive = true
        
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
        let view = signin_view
        if !validateEmail(enteredEmail: view.username_tf.text!){
            alertView(info: "Invalid Email")
        }
        
        let password = UserDefaults.standard.string(forKey: view.username_tf.text!)
        
        guard password != nil else{
            alertView(info: "Not a user!")
            return
        }
        
        if password == view.password_tf.text{
            let vc = MainTabbarViewController()
            self.present(vc, animated: false, completion: nil)
        }else{
            alertView(info: "Password doesn't match!")
        }
    }
    
    func validateEmail(enteredEmail:String) -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)
        
    }
    
    func handleSignup(){
        
        handleCheckBeforSignin()
        
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
            self.LoginViewLeftAncihor?.constant = 16 - UIScreen.main.bounds.width
            self.SignupViewLeftAncihor?.constant = 16
        }, completion: nil)
    }
    
    func handleCheckBeforSignin(){
        
    }
    
    func handleResetPassword(){
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
            self.LoginViewLeftAncihor?.constant = 16 - UIScreen.main.bounds.width
            self.ForgivePwdLeftAncihor?.constant = 16
        }, completion: nil)
    }
    
    func handleBacktoSignin(){
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
            self.LoginViewLeftAncihor?.constant = 16
            self.ForgivePwdLeftAncihor?.constant = 16 + UIScreen.main.bounds.width
            self.SignupViewLeftAncihor?.constant = 16 + UIScreen.main.bounds.width
        }, completion: nil)
    }
    
    func handleCreateAccount(){
        let view = self.signup_iew
        
        UserDefaults.standard.set(view.pwd_tf.text,forKey:view.email_tf.text!)
        
        guard view.username_tf.text != "" else{
            alertView(info: "Username could not be empty!")
            return
        }

        guard view.email_tf.text != "" else{
            alertView(info: "Email could not be empty!")
            return
        }

        guard view.pwd_tf.text != "" else{
            alertView(info: "Password could not be empty!")
            return
        }


        guard view.pwd_tf.text == view.retype_pwd_tf.text else{
            alertView(info: "Password is not matching!")
            return
        }

        guard view.gender_tf.text != "" else{
            alertView(info: "Gender could not be empty!")
            return
        }

        guard view.day_of_birth_tf.text != "" else{
            alertView(info: "Day of birth could not be empty!")
            return
        }
        
        
        let vc = PincodeViewController()
        self.present(vc, animated: false, completion: nil)
    }
    
    

    func alertView(info:String){
        let alert = UIAlertController(title: "", message: info, preferredStyle: .alert)
        let okAction = UIAlertAction(title: NSLocalizedString("ok", comment: ""), style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
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
