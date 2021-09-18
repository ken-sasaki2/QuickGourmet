//
//  MockPickerSelectTypeRepository.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/09/04.
//

import Foundation

class MockPickerSelectTypeRepository: PickerSelectTypeRepositoryInterface {
    func getPickerSelectType(selectType: PickerSelectType) -> Int {
        let pickerSelectType = PickerSelectTypeTranslator.translate(selectType: selectType)
        return pickerSelectType
    }
}
