//
//  TableViewCell.swift
//  PhoneBook
//
//  Created by calmkeen on 2022/07/14.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell {
    
    var identifier = "CustomCell"

    private let label: UILabel = {
        let label = UILabel()
        label.text = "상어상어"
        label.textColor = UIColor.gray
        return label
    }()

    func makeCell(){
        self.addSubview(label)
    }
    
    //코드 베이스 빌딩은 테마 초기화 해줘야 한다고 하네요
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {

        super.init(style: style, reuseIdentifier: reuseIdentifier)

        makeCell()
        make()
    }
    //필수적으로 fatal Error를 따르게 해야한다.
    required init?(coder aDecoder: NSCoder) {

        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        makeCell()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func make(){
        label.snp.makeConstraints{ make in
            make.center.equalTo(self.safeAreaLayoutGuide)
        }
    }

}
