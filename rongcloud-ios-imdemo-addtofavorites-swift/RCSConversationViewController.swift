//
//  RCSConversationViewController.swift
//  rongcloud-ios-imdemo-import-swift
//
//  Created by Jue on 2020/11/3.
//  Copyright © 2020 RC. All rights reserved.
//

import UIKit

class RCSConversationViewController: RCConversationViewController {

    var longToucheModel: RCMessageModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 为 UIToolbar 添加收藏按钮
        addToolBarBtn()
    }
    
    // 获取长按Cell中的消息时的菜单
    override func getLongTouchMessageCellMenuList(_ model: RCMessageModel!) -> [UIMenuItem]! {
        // 暂存长按消息的 model
        longToucheModel = model
        let menuList: NSArray = super.getLongTouchMessageCellMenuList(model)! as NSArray
        let list: NSMutableArray = menuList.mutableCopy() as! NSMutableArray
        let addToFavorites: UIMenuItem = UIMenuItem.init(title: "收藏", action: #selector(onAddToFavorites(_:)))
        list.insert(addToFavorites, at: list.count - 1)
        return list as? [UIMenuItem]
    }
    
    // 点击收藏后的回调方法
    @objc func onAddToFavorites(_: Any) {
        allowsMessageCellSelection = false
    }
     
    func addToolBarBtn() {
        let favoriteBtn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 50, height: 40))
        favoriteBtn.setImage(UIImage.init(named: "favorite"), for: UIControl.State.normal)
        favoriteBtn.addTarget(self, action: #selector(onAddToFavorites(_:)), for: UIControl.Event.touchUpInside)
        
        let favoriteItem = UIBarButtonItem.init(customView: favoriteBtn)
        let items: NSArray = messageSelectionToolbar.items! as NSArray
        let tempItems: NSMutableArray = items.mutableCopy() as! NSMutableArray
        tempItems.add(favoriteItem)
        
        let spaceItem = UIBarButtonItem.init(systemItem: UIBarButtonItem.SystemItem.flexibleSpace)
        tempItems.add(spaceItem)
        messageSelectionToolbar.setItems(tempItems.mutableCopy() as? [UIBarButtonItem], animated: false)
    }
    
}
