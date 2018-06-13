//
//  ViewController.swift
//  AnimationOne
//
//  Created by xfq on 2018/5/31.
//  Copyright © 2018年 xfq. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    var imageViewAirport : UIImageView?
    var imageAir : UIImageView?
    
    
    @objc func click(_ lqj:UIButton ,_ event:UIEvent) -> Void {
        
    }
    
    func buttonAction(texte: String) {
        print("Okay with \(texte)")
    }
    
    
    func cyanButtonClick(){
//        click(<#T##lqj: UIButton##UIButton#>, event: <#T##UIEvent#>)
    }
    
    /**
     
     func eatDinner(my you:String){
     print(you);
     }
     
      eatDinner(my: "bbbb");
     
    
     
     
     func eatDinner(_ you:String,_ his :String){
     print(you);
     }
     //        eatDinner(<#T##you: String##String#>, <#T##his: String##String#>)

     
     */
    func eatDinner(_ :String,_  :String){
        print(you);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        eatDinner("12", "23");
        
        let button = UIButton.init(frame: CGRect.init(x: 100, y: 100, width: 200, height: 100));
        button.backgroundColor = UIColor.red;
        
        self.view.addSubview(button);
        
        
//        button.addTarget(self, action: #selector(click), for:.touchUpInside);
        
        
        
        
//        @objc func click( _ lqj:UIButton , event:UIEvent) -> Void {
//
//        }
//        button.addTarget(self, action: #selector(click(_:event:)), for:.touchUpInside);
        
//        @objc func click(_ lqj:UIButton ,_ event:UIEvent) -> Void {
//
//        }
//        button.addTarget(self, action: #selector(click(_:_:)), for:.touchUpInside);
       
        
          button.addTarget(self, action: #selector(click(_:_:)), for:.touchUpInside);
        
        
        
        
        
        
        
//        imageViewAirport = UIImageView();
//        imageViewAirport?.backgroundColor = UIColor.cyan;
//        imageViewAirport?.frame = UIScreen.main.bounds;
//        imageViewAirport?.image = UIImage.init(named: "page_1");
//        self.view.addSubview(imageViewAirport!);
//
//        imageAir = UIImageView();
//        imageAir?.frame = CGRect.init(x: 100, y: 100, width: 30, height: 30);
//        imageAir?.image = UIImage.init(named: "推荐-红");
//        imageViewAirport?.addSubview(imageAir!);
//
        
        
        
//        UIView.animateKeyframes(withDuration: 2, delay: 0, options: [], animations: {
//            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25, animations: {
//                view.center.x += 200.0
//            })
//        }, completion: nil)
//
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
//        UIView.animateKeyframes(withDuration: 20, delay: 0, options:UIViewKeyframeAnimationOptions.calculationModeLinear, animations: {
//
//
//
//            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/2, animations: {() in
//                self.imageAir?.frame = CGRect.init(x: 300, y: 100, width: 30, height: 30);
//            });
//
//            UIView.addKeyframe(withRelativeStartTime: 1/2, relativeDuration: 1/2, animations: {() in
//                self.imageAir?.frame = CGRect.init(x: 300, y:300, width: 30, height: 30);
//            });
//
//
//        }) { (finish) in
//
//        };
//
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

