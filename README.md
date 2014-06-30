swift-study
===========

Now, first swift study application is coming, I'll complete this project at the end of July. Him ,Judy, follow you !
#Problems Day By Day
这里记载每一天得遇到得各种问题，也叫菜鸟成长记
* Day 1(2014-6-29)  
 1. Run applcation get this error in command line   
  ``` 
  EXC_BAD_INSTRUCTUCTION(code=I386_INVOP,subcode=0x0)  
  fatal error: Can't unwrap Optional.None  
 ```
  Code:   
```
   @IBOutlet var appsTableView : UITableView
``` 
      Solutions: set Referencing Outlets in storyboard  
    ![image](https://github.com/yangding39/swift-study/raw/master/images/reference-outlet.png)
   
