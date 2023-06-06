//
//  ViewController.swift
//  IgListKitApp
//
//  Created by Brandon Bravos on 6/5/23.
//

import UIKit
import PureLayout
import IGListKit

/**
    An example of how to use IGListKit in conjunction with PureLayout. This view controller creates a collection view and uses list kit to display diffable data.

    For documentation on PureLayout visit: https://github.com/PureLayout/PureLayout#api-cheat-sheet
    For documentation on IGListKit visit: https://instagram.github.io/IGListKit/getting-started.html

    In this example we use IGListKit to create a diffable list view that displays two types of cell, one for a user and one for a string. The flexibility provided by IGListKit allows us to easily manage multiple different types of objects into one common feed.
 */
class ViewController: UIViewController {
    // The collection view that will conform to our IGListKit framework
   private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        return collectionView
    }()

    
    private lazy var adapter: ListAdapter = {
        let updater = ListAdapterUpdater()
        let adapter = ListAdapter(updater: updater, viewController: self)
        adapter.collectionView = collectionView
        adapter.dataSource = self

        return adapter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }

    // set up IGListKit
    private func setUp() {
        addCollectionViewToView()
        // used to call our adapter, since it is lazy it will not be created until called
        adapter.performUpdates(animated: true)
    }

    // create the collection view that our IGListKit framework will use
    private func addCollectionViewToView() {
        view.addSubview(collectionView)

        collectionView.autoCenterInSuperview() // center the label to the view
        collectionView.autoPinEdgesToSuperviewEdges() // expand the label to fit the view
    }
}

// MARK: - Delegates
extension ViewController: ListAdapterDataSource {
    // here we want to initialize our 'objects' or the data that we want to display.
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        // we are returning an array of strings and usersm however, this can be any array we want.
        // This can be a mixed array! So imagine an array of [Any]: [ CreaterPhotoPost, AdvertisementModule, CreatorVideo]
        // This allows for much more variety
        // You can return an array of any type of data, as long as it conforms to IGListDiffable
        let data = ["Ltk", User(primaryKey: 2, name: "Steven"), "Facebook", User(primaryKey: 1, name: "John")] as! [any ListDiffable]
        return data
    }

    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        // here we set the adapter for the type in our array
        if object is User {
          return UserSectionController()
        } else {
          return LabelSectionController()
        }
    }

    // what to return if there is no cell to show
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}
