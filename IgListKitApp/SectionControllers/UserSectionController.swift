//
//  UserSectionController.swift
//  IgListKitApp
//
//  Created by Brandon Bravos on 6/6/23.
//

import IGListKit

final class UserSectionController: ListSectionController {

    private var text: User?

    override init() {
        super.init()
        inset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }

    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: UserCell.self, for: self, at: index) as! UserCell
        cell.configure(with: text)
        return cell
    }

    override func didUpdate(to object: Any) {
        self.text = object as? User
    }
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width - 10, height: 200)
    }

    override func didSelectItem(at index: Int) {
        print(String(describing: text))
    }
}

