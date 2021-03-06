//
//  BaseHasNoNavigationViewController.swift
//  base_swift
//
//  Created by ZhongLiangLiang on 17/2/7.
//  Copyright © 2017年 zll. All rights reserved.
//

import UIKit

class BaseHasNoNavigationViewController: UIViewController {
    
    typealias back_block = () -> ()
    
    var back_action :back_block?
    
    var navBarView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.setBackgroundImage(UIImage.create(color: UIColor.clear), for: UIBarMetrics.default)
        if self.navigationController?.viewControllers.count != 1 {
            let button = UIButton.init()
            button.frame = CGRect(x: 0, y: 0, width: 11, height: 20)
            button.setImage(UIImage.init(named: "close_order"), for: UIControlState.normal)
            button.addTarget(self, action: #selector(getBack_action), for: UIControlEvents.touchUpInside)
            self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: button)
            self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
        }
        navBarView.frame = CGRect(x:0, y:0, width:Z_FRAME_WIDTH, height:64)
        navBarView.backgroundColor = UIColor.clear
        self.view.addSubview(navBarView)
    }
    
    func getBack_action(sender: UIButton) {
        _ = self.navigationController?.popViewController(animated: true)
        if self.back_action != nil {
            self.back_action!()
        }
    }
    
    // MARK: storyBoard之间的跳转
    func getUIStoryBoard(storyBoardName: String) -> UIStoryboard {
        return UIStoryboard.init(name: storyBoardName, bundle: Bundle.main)
    }
    
    func getUIViewController(storyBoard: UIStoryboard, controllerIdentifier: String) -> UIViewController {
        return storyBoard.instantiateViewController(withIdentifier: controllerIdentifier)
    }
    
    func storyBoardNavigationPush(storyBoardName: String, controllerIdentifier: String, settingBlockPushVC: ((UIViewController?)->())?) -> UIViewController {
        let storyBoard = self.getUIStoryBoard(storyBoardName: storyBoardName)
        let pushViewController = self.getUIViewController(storyBoard: storyBoard, controllerIdentifier: controllerIdentifier)
        settingBlockPushVC?(pushViewController)
        self.navigationController?.pushViewController(pushViewController, animated: true)
        return pushViewController
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.shadowImage = UIImage.init()
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
