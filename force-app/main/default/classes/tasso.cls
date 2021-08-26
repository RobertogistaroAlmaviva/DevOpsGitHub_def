public class tasso {


    public static void  tasso2(){
        double a = tasso1(double.valueof(183528.00),30,double.valueof(0.023));
        System.debug(a);
    }



public static double  tasso1(double importo, integer anni, double tasso){
integer mesi = 12; //numero delle rate che si vogliono pagare 
//in un anno (se il valore è 12 una al mese) 
integer numeroRate= mesi* anni; //numero delle rate da pagare
//prima di estinguere il mutuo 

double temp = Math.pow( 1 + (tasso/mesi),double.valueOf((numeroRate)));   
//esegue la funzione potenza inclusa nelle classi Java 
return (importo*(temp)*(tasso/mesi)/(temp-1))+((importo)*0.00005874);
}
}