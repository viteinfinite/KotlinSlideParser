import UIKit
import KotlinSlideParser

class ViewController: UIViewController {
    @IBOutlet private weak var collectionView: UICollectionView!
    private var dataSource: SlideDataSource? {
        didSet {
            collectionView.dataSource = dataSource
            collectionView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        experimentSupport()
        loadPages()
    }

    private func loadPages() {
        let deck = Deck()
        let parser = KSPSlideParser()
        guard let pages = parser.parsePages(string: deck.contents) else { return }
        dataSource = SlideDataSource(pages: pages)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.itemSize = collectionView.frame.size
        }
    }
    
    private func experimentSupport() {
        KSPSupport().logSomething()
    }
}

class SlideDataSource: NSObject, UICollectionViewDataSource {
    private let pages: [KSPSlideEntityPage]

    init(pages: [KSPSlideEntityPage]) {
        self.pages = pages
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? SlideCell else {
            fatalError("Cell is not a SlideCell instance")
        }
        cell.configure(with: pages[indexPath.row])
        return cell
    }
}

