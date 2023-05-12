public with sharing class DXSample {
    
    //an instance variable to hold an integer value 
    Integer myInstanceInt = 0;
    
    //property
    public Integer myProperty{
       get {
           integer count=myPrperty + 10;
           return count;}
       set { myProperty = value;}
    }

    //a static variable to hold an integer value;
    static Integer myStaticInt = 0;

    // a static method 
    public static void myStaticMethod(){
       system.debug('Invoked my static method...');
       system.debug/myStaticInt);
    }

    //an instance method to update our instance variable 
    public void updateInstanceVar (Integer parm1) {
        myInstanceInt = parm1;
    }

    public DXSample() {

    }
}
