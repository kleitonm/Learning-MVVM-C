//
//  ReceiptViewController.swift
//  challenge
//
//  Created by Kleiton Mendes on 25/03/24.
//

import UIKit

final class ReceiptViewController: UIViewController {
    
    // MARK: - Private Properties
    private var searchTask: DispatchWorkItem?
    private let viewModel = ReceiptsViewModel()
    private var dataModel: DataModel?
    private var allReceipts: DataModel?
    private lazy var receiptViewScreen: ReceiptView = {
        ReceiptView()
    }()
    
    // MARK: - View Lifecycle
    override func loadView() {
        super.loadView()
        view = receiptViewScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadReceipts()
        setupViewScreen()
        setupNavigation()
        setupSearchBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showLoadingScreen()
    }
    
    private func loadReceipts() {
        viewModel.fetchReceipts { [weak self] dataModel in
            switch dataModel {
            case .success(let dataModel):
                self?.dataModel = dataModel
                self?.allReceipts = dataModel
                self?.receiptViewScreen.receiptTableView.reloadData()
            case .failure(let failure):
                print(failure)
            }            
        }
    }
    
    
    private func setupNavigation() {
        navigationItem.title = "Lista de Comprovantes"
        navigationItem.isAccessibilityElement = true
        navigationItem.accessibilityLabel = "Lista de Comprovantes"
        navigationItem.accessibilityTraits = .header
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.hidesBackButton = true
    }
    
    private func setupSearchBar() {
        let searchController = UISearchController()
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        searchController.searchBar.searchTextField.textColor = .black
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.isAccessibilityElement = true
        searchController.accessibilityLabel = "Campo para pesquisar comprovantes"
        searchController.accessibilityTraits = .searchField
    }
    
    private func setupViewScreen() {
        view.backgroundColor = .white
        receiptViewScreen.receiptTableView.delegate = self
        receiptViewScreen.receiptTableView.dataSource = self
        receiptViewScreen.setupView()
    }
    
    private func showLoadingScreen() {
        receiptViewScreen.loadingRecipts.startLoading()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.receiptViewScreen.loadingRecipts.stopLoading()
            self.receiptViewScreen.receiptTableView.isHidden = false
        }
    }
    
    private func showEmptyView() {
        DispatchQueue.main.async {
            self.receiptViewScreen.emptyListView.isHidden = false
        }
    }
}

// MARK: - TableeViewDelegate / TableViewDataSource
extension ReceiptViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ReceiptTableViewCell.identifier) as? ReceiptTableViewCell,
           let model = dataModel?.data.receipts {
            cell.configureLayout(receipt: model[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let dataModel {
            return dataModel.data.receipts.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = dataModel?.data.receipts
        let detailsVC = ReceiptDetailsViewController(receipt: model?[indexPath.row])
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}

//MARK: - UISearchBarDelegate
extension ReceiptViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        loadReceipts()
        
        guard let model = self.dataModel else { return }
        let normalizedSearchText = searchText.removingAccents().lowercased()
        
        if searchText.isEmpty {
            self.dataModel = allReceipts
        } else {
            let filteredReceipts = model.data.receipts.filter { receipt in
                let normalizedReceiverName = receipt.receiverName.removingAccents().lowercased()
                let normalizedTitle = receipt.title.removingAccents().lowercased()
                let normalizedAmount = receipt.amount.removingPunctuation().removingAccents()
                let normalizedDate = receipt.date.removingPunctuation()
                
                return normalizedReceiverName.contains(normalizedSearchText) ||
                normalizedAmount.contains(normalizedSearchText) || normalizedTitle.contains(normalizedSearchText) || normalizedDate.contains(normalizedSearchText)
            }
            
            self.dataModel?.data.receipts = filteredReceipts
        }
        
        receiptViewScreen.receiptTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        loadReceipts()
        receiptViewScreen.receiptTableView.reloadData()
    }
}
