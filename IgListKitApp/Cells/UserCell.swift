//
//  UserCell.swift
//  IgListKitApp
//
//  Created by Brandon Bravos on 6/6/23.
//
import UIKit
import PureLayout
/**
 A simple collection view cell that displays a label.
 */
final class UserCell: UICollectionViewCell {
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemRed
        addLabelToView()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        userNameLabel.text = nil
    }

    /**
     Configure the cells label to display text
     - Parameter user: the user we want our cells label to display
     */
    public func configure(with user: User?) {
        userNameLabel.text = "User: \(user?.name ?? "")" 
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /**
     Use PureLayout to add the label to the cell
     */
    private func addLabelToView() {

        addSubview(userNameLabel)

        userNameLabel.autoCenterInSuperview() // center the label to the view
        userNameLabel.autoPinEdgesToSuperviewEdges() // expand the label to fit the view
    }
}
