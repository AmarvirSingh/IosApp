//
//  ViewController.swift
//  midtermTest
//
//  Created by Amarvir Mac on 19/11/20.
//  Copyright © 2020 Amarvir Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //**********************************************************
    
    @IBOutlet weak var highSchool: UIButton!
    @IBOutlet weak var bachlors: UIButton!
    @IBOutlet weak var diploma: UIButton!
    @IBOutlet weak var single: UIButton!
    @IBOutlet weak var notSingle: UIButton!
    @IBOutlet weak var no: UIButton!
    @IBOutlet weak var yes: UIButton!
    @IBOutlet weak var swift: UIButton!
    @IBOutlet weak var java: UIButton!
    @IBOutlet weak var r: UIButton!
    @IBOutlet weak var cHash: UIButton!
    @IBOutlet weak var php: UIButton!
    @IBOutlet weak var python: UIButton!
    @IBOutlet weak var javascript: UIButton!
    @IBOutlet weak var slideKids: UISlider!
    @IBOutlet weak var qtyKids: UITextField!
    @IBOutlet weak var slideExperience: UISlider!
    @IBOutlet weak var qtyExperience: UITextField!
    
   
    //***************************************************************
    
    // user defined variable whioch are used in the programm
   
    // setting bool values for every programming languages so that whem they are true i can use that as refernce
    var swiftBool = false
    var pythonBool = false
    var rBool = false
    var javaBool = false
    var cBool = false
    var scriptBool = false
    var phpBool = false
    //----------------------------------
    var langSalary = 0.0
    var sumSalary = 0.0
    var s :Double = 0
    var expi = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       

        
   
    }

    
    // this is for button get salary when ever this button is pressed this will calculate salary and it to the othe
    // viewController
    
    
    @IBAction func getSalary(_ sender: Any) {
       
        let o = salaryForExpi()
        let x = watch()
        let y = salaryForKids()
         let z =  y + x + o
        sumSalary = sumSalary + z
        
        let vc = self.storyboard?.instantiateViewController(identifier: "SalaryViewController") as! SalaryViewController // making instance of second view Controller
        vc.salary = sumSalary // passing calculated salary to other the variable of other view controller
        self.navigationController?.pushViewController(vc, animated: true)
        // reseting everything to normal
        
        sumSalary = 0.0
        langSalary = 0.0

        reset()
            
    }
    
   // func tion for button to get value of kids slider to the test field
    @IBAction func getkidQuan(_ sender: Any) {
        qtyKids.text = String (slideKids.value.rounded())
    }
    
    // function for slider to get value of slider to the text field of experience
    @IBAction func getExperience(_ sender: Any) {
    qtyExperience.text = String(slideExperience.value.rounded())
    }
    
    // function is used to check if the language related salary has to be added or not and return lang salary after calculation
    func watch() -> Double{
        if swiftBool == true || pythonBool == true || rBool == true{
            langSalary += 5000.0
        }
        if javaBool == true || scriptBool == true || cBool == true{
            langSalary += 3000.0
        }
        return langSalary
    }

    // this is for checkboxes of languages
    @IBAction func getLang(_ sender: UIButton) {
        if sender.tag == 0{  //  chcking tags to confirm which button is pressed
            if swift.isSelected { // chcking if chcekbox is already slelected uncheck it
                swiftBool = false   // if check box is unselectedset boolean value to false
                swift.isSelected = false  // set check box to false
            }
            else {
            swift.isSelected = true
               swiftBool = true
            }
        }
        if sender.tag == 1{
            if java.isSelected {
          javaBool = false
                java.isSelected = false
        
            }
            else {
            java.isSelected = true
                javaBool = true
            }
        }
        if sender.tag == 2{
            if r.isSelected {
             rBool = false
                r.isSelected = false
               
            }
            else {
            r.isSelected = true
            rBool = true
            }
        }
        if sender.tag == 3{
            if cHash.isSelected {
            cBool = false
                cHash.isSelected = false
                
            }
            else {
            cHash.isSelected = true
                cBool = true
            }
        }
        if sender.tag == 4{
            if php.isSelected {
            php.isSelected = false
                
            }
            else {
            php.isSelected = true
                
            }
        }
        if sender.tag == 5{
            if python.isSelected {
            pythonBool = false
                python.isSelected = false
                
            }
            else {
            python.isSelected = true
                pythonBool = true
            }
        }
        if sender.tag == 6{
            if javascript.isSelected {
            scriptBool = false
                javascript.isSelected = false
            }
            else {
            javascript.isSelected = true
                scriptBool = true
            }
        }
    }
    // function is used to check number of kids and return total salary which is the mulotpliction of nuber of kids with 7000
    func salaryForKids() ->Double{
        s = Double(slideKids.value.rounded()) // getting number of kids from the slider
        var totalkidSal = 0.0
        
        if yes.isSelected == true{
             totalkidSal = s * 7000
        }
        
        return totalkidSal
        
    }
    // fucntion is used to return number of years of experience
    func salaryForExpi() -> Double {
        expi = Double(slideExperience.value.rounded())
        var totalexpi = 0.0
        if expi > 3{
            totalexpi = 10000
        }
        return totalexpi
    }
    
    
    // this is for the radio buttons of having kids if the user have kids click yes to enable slider
    // choosing no will disable the slider
    
    @IBAction func getKids(_ sender: UIButton) {
        if sender.tag == 0{
            yes.isSelected = true
            no.isSelected = false
            slideKids.isEnabled = true // enabling slider
            
        }
        else if sender.tag == 1{
            yes.isSelected = false
            no.isSelected = true
             slideKids.isEnabled = false // disabling slider
            slideKids.value = 0.0 // seting value of slider to 0
            qtyKids.text = ""  // setting textfield to empty
           
            
            
        }
        
    }
    //this is for single or not single radio buttons ... all the radio buttons of this section are attached to it
    @IBAction func getSingle(_ sender: UIButton) {
         if sender.tag == 0{
            single.isSelected = true
            notSingle.isSelected = false
        }
        else if sender.tag == 1{
            single.isSelected = false
            notSingle.isSelected = true
        }
    }
    
    // this is for qualification radio buttons ... all the radio buttons of qualtification section is attached to it
    
    @IBAction func getQualification(_ sender: UIButton) {
        if sender.tag == 0{
            highSchool.isSelected = true
            bachlors.isSelected = false
            diploma.isSelected = false
            sumSalary = 40000
        }else if sender.tag == 1{
            highSchool.isSelected = false
            bachlors.isSelected = true
            diploma.isSelected = false
            sumSalary = 55000
        }else if sender.tag == 2{
            highSchool.isSelected = false
            bachlors.isSelected = false
            diploma.isSelected = true
            sumSalary = 47000
        }
    }
    // function is used to reset every vaue inthe veiw
    
     func reset() {
        highSchool.isSelected = false
        bachlors.isSelected = false
        diploma.isSelected = false
        single.isSelected = false
        notSingle.isSelected = false
        yes.isSelected = false
        no.isSelected = false
        swift.isSelected = false
        java.isSelected = false
        r.isSelected = false
        cHash.isSelected = false
        php.isSelected = false
        python.isSelected = false
        javascript.isSelected = false
        slideKids.isEnabled = false
        slideKids.value = 0.0
        qtyKids.text = ""
        slideExperience.value = 0.0
        qtyExperience.text = ""
        sumSalary = 0

         swiftBool = false
         pythonBool = false
         rBool = false
         javaBool = false
         cBool = false
         scriptBool = false
         phpBool = false
        s = 0
        
    }
    
}

