//
//  AllTodoTableViewCell.swift
//  SimpleTodo
//
//  Created by 조서현 on 2019. 4. 28..
//  Copyright © 2019년 조서현. All rights reserved.
//

import UIKit

final class AllTodoTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    //MAKR:- Constant
    
    struct UI {
        static let basicMargin: CGFloat = 20
        static let itemFontSize: UIFont = UIFont.systemFont(ofSize: 20)
        static let textFiledHeight: CGFloat = 30
    }
    
    
    //MARK:- UI Properties
    
    let itemTitle: UILabel = {
        let label = UILabel()
        label.font = UI.itemFontSize
        label.textColor = .white
        return label
    }()
    
    let itemDetailCount: UILabel = {
        let label = UILabel()
        label.font = UI.itemFontSize
        label.textColor = .white
        return label
    }()
    
    let renameText: UITextField = {
        let text = UITextField()
        text.font = UI.itemFontSize
        text.textColor = .white
        text.backgroundColor = .black
        return text
    }()
    
    
    
    //MARK:- Properties
    var rename: Bool = false
    var renameTitle: String?
    
    
    //MAKR:- Initialize
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        if rename != true {
            setupUI()
        } else {
            renameSetupUI()
            
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //MARK:- Setup UI
    
    func setupUI() {
        addSubview(itemTitle)
        addSubview(itemDetailCount)
        
        itemTitle.snp.makeConstraints { make in
            make.leading.equalTo(UI.basicMargin)
            make.top.equalTo(UI.basicMargin)
        }
        
        itemDetailCount.snp.makeConstraints { make in
            make.trailing.equalTo(-UI.basicMargin)
            make.top.equalTo(UI.basicMargin)
        }
        
    }
    
    
    func renameSetupUI() {
        print("renameSetup")
        removeFromSuperview()
        addSubview(renameText)
        
        renameText.snp.makeConstraints { make in
            make.leading.equalTo(UI.basicMargin)
            make.top.equalTo(UI.basicMargin)
            make.trailing.equalTo(-UI.basicMargin)
            make.height.equalTo(UI.textFiledHeight)
        }
        rename = false
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        renameText.resignFirstResponder()
        renameTitle = renameText.text
        return true
    }
    
    func getRenameTitle() -> String? {
        return renameTitle
    }
    
    
    
    
    //MARK:- Configure UI
    func configureUI(with todo: AllTodoModel, rename: Bool) {
        print(rename)
        self.rename = rename
        guard let detailCount = todo.detailCount else { return }
        itemTitle.text = todo.title
        itemDetailCount.text = String(detailCount)
    }

}
