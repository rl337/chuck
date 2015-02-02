
public class Drum {
    Pan2 bus => JCRev out;

    function void reverb(float mix) {
        mix => out.mix;
    }

    function void hit(float intensity) {

    }

    function void play(int pattern[], dur spb) {
        for(0 => int i; i < pattern.cap(); i++) {
            if (pattern[i] > 0) {
                this.hit(pattern[i] * 0.1);
            }

            spb => now;
        }
    }

}

