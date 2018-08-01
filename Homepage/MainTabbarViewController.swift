//
//  MainTabbarViewController.swift
//  WiFi_Locker
//
//  Created by 笨蛋 on 7/31/18.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

class MainTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.creatViewController()
    }
    
    
    func creatViewController(){
        
        let home = HomeViewController()
        
        let setting = SettingViewController()
        
        let tabArray = [home,setting]
        self.viewControllers = tabArray
        self.tabBar.barTintColor=UIColor.gray;
        self.tabBar.tintColor = UIColor.white
        self.tabBar.barTintColor = MyColor.background_color
        self.tabBar.items?[0].title = NSLocalizedString("Main", comment: "")
        self.tabBar.items?[0].image = UIImage(named: "icons8-home")
        self.tabBar.items?[1].title = NSLocalizedString("Setting", comment: "")
        self.tabBar.items?[1].image = UIImage(named: "icons8-settings-button")

        
        self.tabBar.isTranslucent = false
        self.tabBar.unselectedItemTintColor = UIColor.gray.withAlphaComponent(0.5)
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
