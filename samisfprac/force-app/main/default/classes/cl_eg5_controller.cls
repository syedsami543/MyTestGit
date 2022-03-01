public class cl_eg5_controller {
    public integer num1{set;get;}
    public integer num2{set;get;}
    public integer num3{set;get;}
    public integer result{set;get;}
    public string choice{set;get;}
    
    public void mymain()
    {
        if (choice=='G')
        {
            greater();
        }
        else if (choice == 'S')
        {
          smaller();  
        }    
    }
    
    void greater()
    {
        if(num1>num2 && num1>num3)
        {
            result=num1;
        }
        else if(num2>num1 && num2>num3)
        {
            result=num2;
        }
        else
        {
            result=num3;
        }
    }
    void smaller()
        {
        if(num1<num2 && num1<num3)
        {
            result=num1;
        }
        else if(num2<num1 && num2<num3)
        {
            result=num2;
        }
        else
        {
            result=num3;
        }
    }
        
}