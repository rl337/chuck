public class Chordable {
    Pan2 bus;
    Playable v[];
    int inv;

    public void init(Playable voices[]) {
        voices @=> v;
        for (0 => int i; i < v.cap(); i++) {
            v[i].bus => bus;
        }
    }

    function void inversion(int inversion) {
        if (inversion > -1 && inversion < 4) {
            inversion => inv;
        }
    }

    function void play(Chord chord, dur duration, float gain) {
        for (0 => int i; i < v.cap(); i++) {
            spork ~ v[i].play(chord.note(i+inv), duration, gain/v.cap());
        }

	duration => now;
    }

    function void arpeggio(Chord chord, int sequence[], dur duration, float gain) {
        for (0 => int i; i < sequence.cap(); i++) {
            sequence[i] => int index;
            duration / sequence.cap() => dur notedur;

            // a -1 represents a rest
            if (sequence[i] != -1) {
                v[i % v.cap()].play(chord.note(index+inv), notedur, gain);
            } else {
                notedur => now;
            }
        }
    }

}
