//
//  Launch.swift
//  CleanViper
//
//  Created by nayhan on 19.04.2022.
//

import UIKit
import TinyConstraints

class Launch: UIViewController {
    lazy var logo : UILabel = {
       let label = UILabel()
        label.text = "Clean Viper"
        label.font = UIFont.systemFont(ofSize: 44)
        label.textColor = UIColor.white
        label.textAlignment = .center
        return label
    }()
    weak var timer: Timer?
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setLayout()
        
    }
    func setLayout(){
        
        view.backgroundColor  = .black
        
        view.addSubview(logo)
        logo.centerInSuperview()
        logo.width(view.frame.width)
        logo.height(200)
        
       
    }
    override func viewWillAppear(_ animated: Bool) {
        if navigationController != nil{
            navigationController?.setNavigationBarHidden(true, animated: true)
            startTimer()
        }
    }
    func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.66, repeats: false) {  _ in
            self.setRouterRegsiter()
        }
    }
    func stopTimer() {
        timer?.invalidate()
    }
    deinit {
        stopTimer()
    }
    func setRouterRegsiter(){
        
        let registerRouter = UserRouter.setRouter()
        let initialVC = registerRouter.entry
        
        self.navigationController?.pushViewController(initialVC!, animated: true)
        
    }
    

}
