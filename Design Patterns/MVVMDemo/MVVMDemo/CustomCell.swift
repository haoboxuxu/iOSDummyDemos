//
//  CustomCell.swift
//  MVVMDemo
//
//  Created by 徐浩博 on 2022/2/25.
//

import UIKit

class CustomCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nationLabel: UILabel!
    
    static let cellID = "CustomCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "CustomCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configWith(_ vm: CellViewModel) {
        nameLabel.text = vm.name
        nationLabel.text = vm.nation
    }
}
