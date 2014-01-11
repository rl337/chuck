public class Scales {


    public static Scale Major(int tonic) {
        Scale result;
        [ 2, 2, 1, 2, 2, 2, 1 ] @=>  int major_intervals[];
        result.init(tonic, major_intervals);
        return result;
    }

    public static Scale Minor(int tonic) {
        Scale result;
        [ 2, 1, 2, 2, 1, 2, 2 ] @=>  int major_intervals[];
        result.init(tonic, major_intervals);
        return result;
    }

}
