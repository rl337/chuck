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
            v[i % v.cap()].play(chord.note(sequence[i]+inv), duration / sequence.cap(), gain);
        }
    }

}
