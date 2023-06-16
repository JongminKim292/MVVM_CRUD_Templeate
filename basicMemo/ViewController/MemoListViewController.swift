//
//  basicMemo
//
//  Created by Jongmin Kim on 6/10/23.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx

class MemoListViewController: UIViewController, ViewModelBindableType {
    
    var viewModel: MemoListViewModel!
    var memoListTableView: UITableView!
    
    /*
     binding view to view model
     */
    func bindViewModel() {
        viewModel.title
            .drive(self.navigationItem.rx.title)
            .disposed(by: rx.disposeBag)
        
        viewModel.memoList
            .bind(to: memoListTableView.rx.items(cellIdentifier: "memoCell")) { row, memo, cell in
                cell.accessoryType = .disclosureIndicator
                cell.textLabel?.text = memo.content
            }.disposed(by: rx.disposeBag)
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        navigationItemGenerate()
        initialFraming()
    }
}

extension MemoListViewController {
    
    func navigationItemGenerate() {
//        let rightBarButton = UIBarButtonItem(image: .add, style: .plain, target: self, action: #selector())
    }
    
    /*
     initial view framing
     
     - memoListTableView : table view that list memo. This view is placed entire safe layout inset
        - memoCell : each cell
     */
    func initialFraming() {
        self.memoListTableView = UITableView()
        
        self.view.addSubview(self.memoListTableView)
        self.memoListTableView.translatesAutoresizingMaskIntoConstraints = false
        self.memoListTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.memoListTableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        self.memoListTableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        self.memoListTableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        self.memoListTableView.register(UITableViewCell.self, forCellReuseIdentifier: "memoCell")
    }
}
