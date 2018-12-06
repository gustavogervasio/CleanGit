import UIKit

protocol TableViewCellProtocol {
    static var identifier: String { get set }
}

class TableViewCell: UITableViewCell {

    // # MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = R.color.c_70_70_70
        contentView.backgroundColor = backgroundColor
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
