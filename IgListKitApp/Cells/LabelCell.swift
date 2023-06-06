//
//  Cell.swift
//  IgListKitApp
//
//  Created by Brandon Bravos on 6/5/23.
//

import UIKit
import PureLayout
/**
 A simple collection view cell that displays a label.
 */
final class LabelCell: UICollectionViewCell {
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemBlue
        addLabelToView()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
    }

    /**
     Configure the cells label to display text
     - Parameter text: the text we want our cells label to display
     */
    public func configure(with text: String?) {
        label.text = "Company: \(text ?? "")"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /**
     Use PureLayout to add the label to the cell
     */
    private func addLabelToView() {

        addSubview(label)

        label.autoCenterInSuperview() // center the label to the view
        label.autoPinEdgesToSuperviewEdges() // expand the label to fit the view
    }
}
