import UIKit

class RepositorieCell: TableViewCell {

    private let nameLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.font = R.font.n12
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()

    private let descriptionLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.font = R.font.n12
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()

    private let logoImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()


    // # MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(logoImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(descriptionLabel)
        setupConstraints()
    }

    // # MARK: Private Methods
    private func setupConstraints() {

        logoImageView.anchor (
            top: contentView.topAnchor,
            left: contentView.leftAnchor,
            bottom: contentView.bottomAnchor,
            right: nameLabel.leftAnchor,
            paddingTop: 10,
            paddingLeft: 10,
            paddingBottom: 10,
            paddingRight: 10,
            width: 30,
            height: 0,
            enableInsets: false
        )

        nameLabel.anchor (
            top: contentView.topAnchor,
            left: logoImageView.rightAnchor,
            bottom: descriptionLabel.topAnchor,
            right: contentView.rightAnchor,
            paddingTop: 10,
            paddingLeft: 10,
            paddingBottom: 10,
            paddingRight: 10,
            width: 0,
            height: 0,
            enableInsets: false
        )

        descriptionLabel.anchor (
            top: nameLabel.bottomAnchor,
            left: logoImageView.rightAnchor,
            bottom: contentView.bottomAnchor,
            right: contentView.rightAnchor,
            paddingTop: 10,
            paddingLeft: 10,
            paddingBottom: 10,
            paddingRight: 10,
            width: 0,
            height: 0,
            enableInsets: false
        )
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Public Methods
    func bindView(name: String, description: String) {
        logoImageView.image = R.image.github
        nameLabel.text = name
        descriptionLabel.text = description
    }
}

extension RepositorieCell: TableViewCellProtocol {

    static var identifier: String = "repositorieCell"
}
