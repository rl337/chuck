public class Playable {
    Pan2 bus;

    function void play(int midi_note, dur duration, float gain) {
        play(Std.mtof(midi_note), duration, gain);
    }

    function void play(float freq, dur duration, float gain) {
        duration => now;
    }
}
