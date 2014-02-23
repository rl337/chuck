public class Chord {
    int notes[];

    public void init(int halfsteps[]) {
        int b[halfsteps.cap()] @=> notes;
        for(0 => int i; i < halfsteps.cap(); i++) {
            halfsteps[i] => notes[i];
        }
    }

    public int note(int index) {
	notes.cap() => int span;
        (index % span + span) % span => int safeindex;
        index / span => int multiplier;
        if (index < 1 && safeindex > 0) {
            multiplier--;
        }

        return notes[safeindex] + 12 * multiplier;
    }

}
