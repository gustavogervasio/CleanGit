import UIKit

class TableViewController: UITableViewController {
    
    // # MARK Init
    init(title: String) {
        super.init(style: .grouped)
        self.title = title
        view.backgroundColor = R.color.c_45_45_45
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
