//
//  AutomobileDetailsViewController.swift
//  Auto-Kit
//
//  Created by Сергей Павленок on 31.05.2021.
//  Copyright © 2021 just_terror. All rights reserved.
//

import UIKit

class AutomobileDetailsViewController: UIViewController {
    
    var autoModel: Automobile!;
    @IBOutlet weak var make_lbl: UILabel!
    @IBOutlet weak var model_lbl: UILabel!
    @IBOutlet weak var vin_lbl: UILabel!
    @IBOutlet weak var year_lbl: UILabel!
    @IBOutlet weak var engine_lbl: UILabel!
    @IBOutlet weak var made_in_lbl: UILabel!
    @IBOutlet weak var style_lbl: UILabel!
    @IBOutlet weak var drive_type_lbl: UILabel!
    @IBOutlet weak var transmission_lbl: UILabel!
    @IBOutlet weak var fuelType_lbl: UILabel!
    @IBOutlet weak var submit_button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadBackground()
        uiSetup()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Make the navigation bar background clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Restore the navigation bar to default
        navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        navigationController?.navigationBar.shadowImage = nil
    }
    
    func uiSetup() {
        make_lbl.text = autoModel.make
        model_lbl.text = autoModel.model
        vin_lbl.text = autoModel.vin
        year_lbl.text = autoModel.year
        engine_lbl.text = autoModel.engine
        made_in_lbl.text = autoModel.made_in
        style_lbl.text = autoModel.style
        drive_type_lbl.text = autoModel.drive_type
        transmission_lbl.text = autoModel.transmission
        fuelType_lbl.text = autoModel.fuel_type
        
        submit_button.layer.cornerRadius = 25
        submit_button.layer.borderWidth = 1
        submit_button.layer.borderColor = UIColor.blue.cgColor
    }
    
    @IBAction func submitButtonClicked(_ sender: Any) {
        
    }
}
