//
//  GamePickerViewAdapter.swift
//  GamesApp
//
//  Created by rasit on 15.01.2023.
//

import Foundation
import UIKit
class GamesPicketViewAdapter: NSObject {
    private var pickerView: UIPickerView!
    private weak var viewModel: GamesViewModel?

    init(pickerView: UIPickerView, viewModel: GamesViewModel) {
      self.pickerView = pickerView
      self.viewModel = viewModel
      super.init()
        pickerDelegate()
    }
    
    func pickerDelegate() {
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
    }
}


extension GamesPicketViewAdapter: UIPickerViewDelegate, UIPickerViewDataSource {
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
