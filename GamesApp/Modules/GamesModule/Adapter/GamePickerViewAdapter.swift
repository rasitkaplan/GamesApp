//
//  GamePickerViewAdapter.swift
//  GamesApp
//
//  Created by rasit on 15.01.2023.
//

import Foundation
import UIKit
class GamesPickerViewAdapter: NSObject {
    // MARK: - Outlets
    private var pickerView: UIPickerView!
    private weak var viewModel: GamesViewModel?

    // MARK: - Init
    init(pickerView: UIPickerView, viewModel: GamesViewModel) {
      self.pickerView = pickerView
      self.viewModel = viewModel
      super.init()
        pickerDelegate()
    }
}

// MARK: - Picker Delegate Function
extension GamesPickerViewAdapter {
    func pickerDelegate() {
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
    }
}

// MARK: - TableView Functions
extension GamesPickerViewAdapter: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel?.filterArray.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewModel?.filterArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        viewModel?.state = .loading
        viewModel?.filter = viewModel?.filterArray[row] ?? ""
    }
    
}
