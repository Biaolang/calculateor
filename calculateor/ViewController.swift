//
//  ViewController.swift
//  calculateor
//
//  Created by han on 2018/11/16.
//  Copyright © 2018 biaolang. All rights reserved.
//

import UIKit
class stack <T>{
    var top:Int = -1
    var flag:Int = 0
    var num = [T]()
    
    
    public init() {}
    public func IsEmpty() ->Int
    {
        if top == -1
        {
            return 1;
        }
        if top > -1
        {
        return 0;
        }
        return -1;
    }
    public func PushStack(x:T) -> Int {
        num.append(x)
        top = top+1
        return 1;
    }
    public func PopStack() -> T? {
        let f =  num.removeLast()
        
        top = top - 1
        return f
    }
    public func inspect() ->T?
    {
        if top == -1
        {
            return nil
        }
        else
        {
            return num[top]
        }
        
    }
    public func GetTop() -> Int
    {
        return top
    }
    public func DelStack() -> Int
    {
        while IsEmpty() != 1
        {
            PopStack()
        }
        return 1
    }
};

class calculate {
    var flag = 0
    var y1 = stack<Double>()
    var z1 = stack<String>()
    public init() {}
    public func judge(x:String)->Int
    {
        if x == "="
        {
            flag = -9
        }
        if x == "×"
        {
            flag = 4
        }
        if x == "÷"
        {
            flag = 4
        }
        if x == "+"
        {
            flag = 2
        }
        if x == "-"
        {
            flag = 2
        }
        if x == "("
        {
            flag = -5
        }
        if x == ")"
        {
            flag = -7
        }
        return flag
    }
    public func sum()->Double
    {
        var e:String = "0"
        var a:Double = 0
        var b:Double = 0
        while(z1.IsEmpty() != 1)
        {
            e = z1.PopStack()!
            if e == "+"
            {
                a = y1.PopStack()!
                b = y1.PopStack()!
                y1.PushStack(x: a + b)
            }
            if e == "-"
            {
                a = y1.PopStack()!;
                b = y1.PopStack()!
                y1.PushStack(x: a - b)
            }
            if e == "×"
            {
                a = y1.PopStack()!;
                b = y1.PopStack()!
                y1.PushStack(x: a * b)
            }
            if e == "÷"
            {
                a = y1.PopStack()!;
                b = y1.PopStack()!
                 y1.PushStack(x: a / b)
            }
            
        }
        return y1.PopStack()!;
    }
    public func op1(x1:String,y1:stack<Double>,z1:stack<String>)
    {
        var e:String = "0"
        var a:Double = 0
        var b:Double = 0
        while(z1.IsEmpty() != 1&&judge(x: x1) < judge(x:z1.inspect()!)+1&&z1.IsEmpty() != 1)
        {
            e = z1.PopStack()!;
            if e == "+"
            {
                a = y1.PopStack()!;
                b = y1.PopStack()!
                y1.PushStack(x: a + b)
            }
            if e == "-"
            {
                a = y1.PopStack()!;
                b = y1.PopStack()!
                y1.PushStack(x: b - a)
            }
            if e == "×"
            {
                a = y1.PopStack()!;
                b = y1.PopStack()!
                y1.PushStack(x: a * b)
            }
            if e == "÷"
            {
                a = y1.PopStack()!;
                b = y1.PopStack()!
                y1.PushStack(x: b / a)
            }
            if e == "("
            {
                break
            }
        }
 
    }
    
};

class ViewController: UIViewController {

    var st1 = stack<Double>()
    var st2 = stack<String>()
    var op = calculate()
    var temp = 1.0
    @IBAction func button_1(_ sender: Any) {
        result.text = result.text! + "1"
        result2.text = result2.text! + "1"
    }
    
    @IBAction func button_2(_ sender: Any) {
        result.text = result.text! + "2"
        result2.text = result2.text! + "2"
    }
    
    @IBAction func button_3(_ sender: Any) {
        result.text = result.text! + "3"
        result2.text = result2.text! + "3"
    }
    
    @IBAction func button_4(_ sender: Any) {
        result.text = result.text! + "4"
        result2.text = result2.text! + "4"
    }
    
    @IBAction func button_5(_ sender: Any) {
        result.text = result.text! + "5"
        result2.text = result2.text! + "5"
    }
    
    @IBAction func button_6(_ sender: Any) {
        result.text = result.text! + "6"
        result2.text = result2.text! + "6"
    }
    
    @IBAction func button_7(_ sender: Any) {
        result.text = result.text! + "7"
        result2.text = result2.text! + "7"
    }
    
    @IBAction func button_8(_ sender: Any) {
        result.text = result.text! + "8"
        result2.text = result2.text! + "8"
    }
    
    @IBAction func button_9(_ sender: Any) {
        result.text = result.text! + "9"
        result2.text = result2.text! + "9"
    }
    
    @IBAction func button_0(_ sender: Any) {
        result.text = result.text! + "0"
        result2.text = result2.text! + "0"
    }
    
    
    @IBAction func left(_ sender: Any) {
         st2.PushStack(x: "(")
        result.text = result.text! + "("
        
    }
    
    @IBAction func right(_ sender: Any) {
        if result2.text != ""
        {
             st1.PushStack(x: Double(result2.text!)!)
        }
        result2.text = ""
        op.op1(x1: ")", y1: st1, z1: st2)
    
        result.text = result.text! + ")"
    
        
    }
    @IBAction func add(_ sender: Any) {
        if result2.text != ""
        {
            st1.PushStack(x: Double(result2.text!)!)
            result2.text = ""
        }
       
        if st2.IsEmpty() == 1
        {
            st2.PushStack(x: "+")
        }
        else
        {
            op.op1(x1: "+", y1: st1, z1: st2)
            st2.PushStack(x: "+")
        }
        
        
        result.text = result.text! + "+"
    }
    
    @IBAction func multiply(_ sender: Any) {
        if result2.text != ""
        {
            st1.PushStack(x: Double(result2.text!)!)
            result2.text = ""
        }
        
        if st2.IsEmpty() == 1
        {
            st2.PushStack(x: "×")
        }
        else
        {
            op.op1(x1: "×", y1: st1, z1: st2)
            st2.PushStack(x: "×")
        }
        
        
        result.text = result.text! + "×"
    }
    @IBAction func reduce(_ sender: Any) {
        if result2.text != ""
        {
            st1.PushStack(x: Double(result2.text!)!)
            result2.text = ""
        }
        if st2.IsEmpty() == 1
        {
            st2.PushStack(x: "-")
        }
        else
        {
            op.op1(x1: "-", y1: st1, z1: st2)
            st2.PushStack(x: "-")
        }
        
        
        result.text = result.text! + "-"
    
    }
    
    
    @IBAction func divide(_ sender: Any) {
        if result2.text != ""
        {
            st1.PushStack(x: Double(result2.text!)!)
            result2.text = ""
        }
        
        if st2.IsEmpty() == 1
        {
            st2.PushStack(x: "÷")
        }
        else
        {
            op.op1(x1: "÷", y1: st1, z1: st2)
            st2.PushStack(x: "÷")
        }
        
        
        result.text = result.text! + "÷"
    
    }
    
    @IBAction func sum(_ sender: Any) {
      
        if result2.text != ""
        {
            st1.PushStack(x: Double(result2.text!)!)
            result2.text = ""
        }
        op.op1(x1: "=", y1: st1, z1: st2)
        var t = st1.PopStack()
        
        result.text = result.text! + "=" + "\(t ?? 0)"
    }
    
    @IBAction func dot(_ sender: Any) {
    result2.text = result2.text! + "."
    result.text = result.text! + "."
    }
    @IBAction func AC(_ sender: Any) {
        result.text=""
        result2.text=""
        st1.DelStack()
        st2.DelStack()
    }
    @IBOutlet weak var result: UITextField!
    @IBOutlet weak var result2: UITextField!
    @IBOutlet weak var text: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
}


}

class MarksStruct {
    var mark: Int
    init(mark: Int) {
        self.mark = mark
    }
}

class studentMarks {
    var mark = 300
}
