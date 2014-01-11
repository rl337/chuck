public class Scale {
    int n[];
    int t;

    function void init(int tonic, int intervals[]) {
        tonic => t;

        int b[intervals.cap() + 1] @=> n;
        0 => int note;
        for(0 => int i; i < intervals.cap(); i++) {
            t + note => n[i];
            note + intervals[i] => note;
        }
        n[0] + 12 => n[intervals.cap()];
    }

    function int note(int degree) {
        n.cap() => int intervals;

        // This dance is to guarantee that safenote is between 0 - i.cap()-1 
        (degree % intervals + intervals) % intervals => int safenote;

        // If we were above i.cap() or below 0, we need to offset by some octaves.
        degree / (intervals) => int multiplier;
        if (degree < 1 && safenote > 0) {
            multiplier--;
        }

        return n[safenote] + 12 * multiplier;
    }

}
