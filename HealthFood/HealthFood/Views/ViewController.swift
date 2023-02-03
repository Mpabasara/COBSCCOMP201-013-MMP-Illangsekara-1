//
//  ViewController.swift
//  HealthFood
//
//  Created by Mobios on 1/30/23.
//  Copyright © 2023 Pabasara. All rights reserved.
//

import UIKit

class ViewController: UITabBarController,UITabBarControllerDelegate {

    var isLoginChecked = false;
    
    var controller = Controller();
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.delegate = self
        
        self.controller.getCurLoginUser{ [self](user,i) -> Void in
            print(user)
            if(i==1){
                self.createView(isLogin:true)
            }else{
                self.createView(isLogin:false)
            }
        }
    }
    
    func createView(isLogin:Bool){
        let homeview = UINavigationController(rootViewController: MainViewController())
        homeview.tabBarItem.image = UIImage(systemName: "house")
        homeview.title = "Home"
   
        if(isLogin){
            let loginview = UINavigationController(rootViewController: ProfileViewController())
            loginview.tabBarItem.image = UIImage(systemName: "person")
            loginview.title = "Profile"
            
            let favView = UINavigationController(rootViewController: FavouriteViewController())
            favView.tabBarItem.image = UIImage(systemName: "star")
            favView.title = "Favourite"
            
            tabBar.tintColor = .label
            
            setViewControllers([homeview,loginview,favView], animated: true)
        }else{
            let loginview = UINavigationController(rootViewController: LoginViewController())
            loginview.tabBarItem.image = UIImage(systemName: "person")
            loginview.title = "Login"
            
            tabBar.tintColor = .label
            
            setViewControllers([homeview,loginview], animated: true)
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("loaded")
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let viewControllers = tabBarController.viewControllers else {
            return
        }
        
        let tapIndex = viewControllers.firstIndex(of: viewController)!
        handleTabSelection(selectedIndex:tapIndex);
    }
    
   
    private func handleTabSelection(selectedIndex:Int){
        if(!isLoginChecked){
            isLoginChecked = true
            self.controller.getCurLoginUser{(user,i) -> Void in
                print(user)
                if(i==1){
                    self.createView(isLogin:true)
                }else{
                    self.createView(isLogin:false)
                }
            }
        }
        print(selectedIndex);
    }
}
