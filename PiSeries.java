public class PiSeries{
    public static void main (String [] args){
	fractions(1, 5001);
	System.out.println("EOF");
    }

    public static double fractions(double num, int limiter){
	double decimal = 0;
	if (limiter > 0){
	    decimal = 1 / num;
	    System.out.println(decimal);
	    num = (Math.abs(num) + 2) * (-1 * Math.signum(num));
	    limiter--;
	    fractions(num, limiter);
	}

	return decimal;
    }
}
