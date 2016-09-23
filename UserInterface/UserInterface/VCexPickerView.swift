//
//  ViewController-extension-PickerView.swift
//  UserInterface
//
//  Created by 楊信之 on 9/22/16.
//  Copyright © 2016 楊信之. All rights reserved.
//

import UIKit

extension ViewController : UIPickerViewDelegate, UIPickerViewDataSource {

    // Require
    // To show how many pickerView are
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Let pickerView know the count of list
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //
        return self.pickerViewList.count
    }
    
    // Optional
    // Let pickerView show the data
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //
        return self.pickerViewList[row]
    }
    
    // To let us know which one user choose
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //
        print("> I choose \(self.pickerViewList[row])")
    }
}
