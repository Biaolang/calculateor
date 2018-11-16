//
//  ViewController.swift
//  calculateor
//
//  Created by han on 2018/11/16.
//  Copyright © 2018 biaolang. All rights reserved.
//

import UIKit
class stack1{
    var top:Int = 0
    var flag:Int = 0
    var num = [Int](repeating: 0, count: 100)
    
    func PushStack(x:Int) -> Int {
        num[top] = x;
        top = top+1
        return 1;
    }
    func PopStack() -> Int {
        var f = num[top]
        f = f-1
        return f
    }
    
    
};
class stack2{
    var top:Int = 0
    var flag:Int = 0
 var num = [String](repeatElement("123", count: 100))
    func PushStack(x:String) -> Int {
        num[top] = x;
        top = top+1
        return 1;
    }
    func PopStack() -> String {
        var f = num[top]
        top = top-1
        return f
    }
    
    
};class ViewController: UIViewController {

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
