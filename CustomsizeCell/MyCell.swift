//
//  MyCell.swift
//  CustomsizeCell
//
//  Created by happts on 2019/8/31.
//  Copyright © 2019 happts. All rights reserved.
//

import UIKit
import SnapKit

struct CellInfo {
    let title:String
    var comments:[String]
}

class MyCell: UITableViewCell {
    
    static let reuseID = String(describing: MyCell.self)
    
    let stackview:UIStackView = {
        let view = UIStackView()
        view.axis = NSLayoutConstraint.Axis.vertical
        view.alignment = UIStackView.Alignment.center
        view.distribution = UIStackView.Distribution.fillProportionally
        let dummyView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 0))
        view.addArrangedSubview(dummyView)
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style:style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(stackview)
        stackview.snp.makeConstraints { (maker) in
            maker.bottom.top.leading.trailing.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initComment(text:String) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .blue
        let label = UILabel()
        label.text = text
        view.addSubview(label)
        
        label.snp.makeConstraints { (maker) in
            maker.center.equalToSuperview()
        }
        view.snp.makeConstraints { (maker) in
            maker.size.equalTo(CGSize(width: UIScreen.main.bounds.width, height: 40))
        }
        return view
    }
}
