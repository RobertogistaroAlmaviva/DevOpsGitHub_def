@isTest
public class Calculator_Tests {
    @isTest static void testPositive () {
        system.assertEquals(Calculator.addition(2,2),4,'no');
        system.assertEquals(Calculator.multiply(2,2),4,'no');
        
        system.assertEquals(Calculator.subtraction(2,2),0,'no');
        system.assertEquals(Calculator.divide(2,2),1,'no');
        
        
    }
     @isTest static void testNegative() {
         boolean b;
         try{
             Integer x=Calculator.multiply(2,0);
         }catch(Exception e){
             b=true;
             system.assert(b,'It doesn\'t make sense to multiply by zero');
         }
         b=false;
          try{
             decimal x=Calculator.divide(2,0);
         }catch(Exception e){
             b=true;
             system.assert(b,'you still can\'t divide by zero');
         }
         b=false;
          try{
             decimal x=Calculator.divide(-1,2);
         }catch(Exception e){
             b=true;
             system.assert(b,'Division returned a negative value.'+(-1/2));
         }
         
        
        
    }

}