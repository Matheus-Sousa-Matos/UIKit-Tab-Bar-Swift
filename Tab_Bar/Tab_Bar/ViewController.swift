//
//  ViewController.swift
//  Tab_Bar
//
//  Created by Matheus de Sousa Matos on 19/08/21.
//

import UIKit

class ViewController: UIViewController {

    private let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 52))
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = .red
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        view.addSubview(button)
        button.addTarget(self, action: #selector(didTapbutton), for: .touchUpInside)
    }

    //Button in center layout
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.center = view.center
    }
    
    
    @objc func didTapbutton(){
        //Create present tab bar controller
        let tabBarVC = UITabBarController()
        
        
        //Create new files using Cocoa Touch -> HomeViewController -> SearchViewController -> LibraryController
        //Using storyboard
//        guard let vc_home = storyboard?.instantiateViewController(identifier: "home_vc") as? HomeViewController else{
//            return
//        }
//        guard let vc_search = storyboard?.instantiateViewController(identifier: "search_vc") as? SearchViewController else{
//            return
//        }
//        guard let vc_library = storyboard?.instantiateViewController(identifier: "library_vc") as? LibraryViewController else{
//            return
//        }
        
        //Storyboard in navigationController
        //let vc1 = UINavigationController(rootViewController: storyboard?.instantiateViewController(identifier: "home_vc") as! HomeViewController)
        
        //Using code
        let vc_home = UINavigationController(rootViewController: FirstViewController())
        let vc_search = UINavigationController(rootViewController: SecondViewController())
        let vc_library = UINavigationController(rootViewController: ThirdViewController())
        
        //Titles here for show all the time.
        vc_home.title = "Home"
        vc_search.title = "Search"
        vc_library.title = "Library"
        
        //Add all vc in tab bar.
        tabBarVC.setViewControllers([vc_home,vc_search,vc_library], animated: false)
        
        //let for items in tabBarVc.
        guard let items = tabBarVC.tabBar.items else{
            return
        }
        
        //Arry imagens of system.
        let imagens = ["house", "magnifyingglass", "star"]
        
        //Loop round all items
        for item in 0..<items.count {
            items[item].image = UIImage(systemName: imagens[item])
        }
        
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true, completion: nil)
    }

}

//Class using for code method

class FirstViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.systemOrange.cgColor, UIColor.systemRed.cgColor]
        view.layer.addSublayer(gradientLayer)
        //Title here for show the title in Top Windown
        self.title = "Home"
    }
}

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        self.title = "Search"
    }
}

class ThirdViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        self.title = "Library"
    }
}

