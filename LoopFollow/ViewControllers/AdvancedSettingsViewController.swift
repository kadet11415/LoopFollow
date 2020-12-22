//
//  DebugSettingsViewController.swift
//  LoopFollow
//
//  Created by Jose Paredes on 7/16/20.
//  Copyright © 2020 Jon Fawcett. All rights reserved.
//

import Foundation
import Eureka
import EventKit
import EventKitUI

class AdvancedSettingsViewController: FormViewController {
    
    var appStateController: AppStateController?
    
    override func viewDidLoad()  {
        super.viewDidLoad()
        if UserDefaultsRepository.forceDarkMode.value {
            overrideUserInterfaceStyle = .dark
        }
        buildAdvancedSettings()
    }
    private func buildAdvancedSettings() {
        form
            +++ Section("Advanced Settings")
            
            <<< SwitchRow("onlyDownloadBG"){ row in
                row.title = "Only Download BG from NS"
                row.value = UserDefaultsRepository.onlyDownloadBG.value
            }.onChange { [weak self] row in
                guard let value = row.value else { return }
                UserDefaultsRepository.onlyDownloadBG.value = value
            }
            
            <<< SwitchRow("downloadTreatments"){ row in
                row.title = "Download Treatments"
                row.value = UserDefaultsRepository.downloadTreatments.value
            }.onChange { [weak self] row in
                guard let value = row.value else { return }
                UserDefaultsRepository.downloadTreatments.value = value
            }
            <<< SwitchRow("downloadPrediction"){ row in
                row.title = "Download Prediction"
                row.value = UserDefaultsRepository.downloadPrediction.value
            }.onChange { [weak self] row in
                guard let value = row.value else { return }
                UserDefaultsRepository.downloadPrediction.value = value
            }
            <<< SwitchRow("graphBasal"){ row in
                row.title = "Graph Basal"
                row.value = UserDefaultsRepository.graphBasal.value
            }.onChange { [weak self] row in
                guard let value = row.value else { return }
                UserDefaultsRepository.graphBasal.value = value
            }
            <<< SwitchRow("graphBolus"){ row in
                row.title = "Graph Bolus"
                row.value = UserDefaultsRepository.graphBolus.value
            }.onChange { [weak self] row in
                guard let value = row.value else { return }
                UserDefaultsRepository.graphBolus.value = value
            }
            <<< SwitchRow("graphCarbs"){ row in
                row.title = "Graph Carbs"
                row.value = UserDefaultsRepository.graphCarbs.value
            }.onChange { [weak self] row in
                guard let value = row.value else { return }
                UserDefaultsRepository.graphCarbs.value = value
            }
            <<< SwitchRow("graphOtherTreatments"){ row in
                row.title = "Graph Other Treatments"
                row.value = UserDefaultsRepository.graphOtherTreatments.value
            }.onChange { [weak self] row in
                guard let value = row.value else { return }
                UserDefaultsRepository.graphOtherTreatments.value = value
            }
            <<< StepperRow("bgUpdateDelay") { row in
                row.title = "BG Update Delay (Sec)"
                row.cell.stepper.stepValue = 1
                row.cell.stepper.minimumValue = 1
                row.cell.stepper.maximumValue = 30
                row.value = Double(UserDefaultsRepository.bgUpdateDelay.value)
                row.displayValueFor = { value in
                        guard let value = value else { return nil }
                        return "\(Int(value))"
                    }
            }.onChange { [weak self] row in
                    guard let value = row.value else { return }
                    UserDefaultsRepository.bgUpdateDelay.value = Int(value)
            }
            <<< SwitchRow("alwaysDownloadAllBG"){ row in
                row.title = "Allways Download All BG Values"
                row.value = UserDefaultsRepository.alwaysDownloadAllBG.value
            }.onChange { [weak self] row in
                guard let value = row.value else { return }
                UserDefaultsRepository.alwaysDownloadAllBG.value = value
            }
            <<< SwitchRow("debugLog"){ row in
                row.title = "Show Debug Log"
                row.value = UserDefaultsRepository.debugLog.value
            }.onChange { [weak self] row in
                guard let value = row.value else { return }
                UserDefaultsRepository.debugLog.value = value
            }

            
            
            
            
            +++ ButtonRow() {
                $0.title = "DONE"
            }.onCellSelection { (row, arg)  in
                self.dismiss(animated:true, completion: nil)
            }
    }
    

}
