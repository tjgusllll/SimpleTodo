//
//  AllTodoTableViewCell.swift
//  SimpleTodo
//
//  Created by 조서현 on 2019. 4. 28..
//  Copyright © 2019년 조서현. All rights reserved.
//

import UIKit

var renametitle: String?

final class AllTodoTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    //MAKR:- Constant
    
    struct UI {
        static let basicMargin: CGFloat = 20
        static let itemFontSize: UIFont = UIFont.systemFont(ofSize: 20)
    }
    
    
    //MARK:- UI Properties
    
    let itemTitle: UITextField = {
        let text = UITextField()
        text.font = UI.itemFontSize
        text.textColor = .white
        text.backgroundColor = .black
        text.isEnabled = false
        return text
    }()
    
    let itemDetailCount: UILabel = {
        let label = UILabel()
        label.font = UI.itemFontSize
        label.textColor = .white
        return label
    }()
    
    
    
    
    //MARK:- Properties
    var todoId: Int?
    
    //MAKR:- Initialize
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupUI()
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
            make.trailing.equalTo(itemDetailCount.snp.leading)
        }
        itemTitle.delegate = self
        
        itemDetailCount.snp.makeConstraints { make in
            make.trailing.equalTo(-UI.basicMargin)
            make.top.equalTo(UI.basicMargin)
        }
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("return")
        renametitle = itemTitle.text
        itemTitle.resignFirstResponder()
        itemTitle.isEnabled = false
        let rename = AllTodoListViewController()
        rename.renameTodo(renametodo: renametitle, id: todoId)
        return true
    }

 
    
    
    //MARK:- Configure UI
    func configureUI(with todo: AllTodoModel) {
        guard let detailCount = todo.detailCount else { return }
        itemTitle.text = todo.title
        itemDetailCount.text = String(detailCount)
        todoId = todo.id
    }

}
