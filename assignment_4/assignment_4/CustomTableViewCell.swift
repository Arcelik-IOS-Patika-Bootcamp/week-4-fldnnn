//
//  CustomTableViewCell.swift
//  assignment_4


import UIKit
 


class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet private(set) weak var iconLabel: UILabel!
    @IBOutlet private(set) weak var nameLabel: UILabel!
    @IBOutlet private(set) weak var priceLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var iconImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(true, animated: true)

        // Configure the view for the selected state
        

    }

//    override func prepareForReuse() {
//        iconImageView.image = nil
//        nameLabel.text = nil
//        priceLabel.text = nil
//        iconLabel.text = nil
//    }
}
