//
//  AllTodoTableViewCell.swift
//  SimpleTodo
//
//  Created by 조서현 on 2019. 4. 28..
//  Copyright © 2019년 조서현. All rights reserved.
//

import UIKit

final class AllTodoTableViewCell: UITableViewCell {
    
    //MAKR:- Constant
    
    struct UI {
        static let basicMargin: CGFloat = 20
        static let itemFontSize: UIFont = UIFont.systemFont(ofSize: 20)
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
    
    
    
    
    
    //MARK:- Properties
    
    
    
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
        }
        
        itemDetailCount.snp.makeConstraints { make in
            make.trailing.equalTo(-UI.basicMargin)
            make.top.equalTo(UI.basicMargin)
        }
        
    }
    
    //MARK:- Configure UI
    func configureUI(with todo: AllTodoModel) {
        guard let detailCount = todo.detailCount else { return }
        itemTitle.text = todo.title
        itemDetailCount.text = String(detailCount)
    }

}
