public class Chordable {
    Pan2 bus;
    Playable v[];

    public void init(Playable voices[]) {
        voices @=> v;
        for (0 => int i; i < v.cap(); i++) {
            v[i].bus => bus;
        }
    }

    function void play(Chord chord, dur duration, float gain) {
        for (0 => int i; i < v.cap(); i++) {
            spork ~ v[i].play(chord.note(i), duration, gain/v.cap());
        }

	duration => now;
    }

    function void arpeggio(Chord chord, int sequence[], dur duration, float gain) {
        for (0 => int i; i < sequence.cap(); i++) {
            v[i].play(chord.note(sequence[i]), duration / sequence.cap(), gain);
        }
    }

}
