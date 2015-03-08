
public class DrumPattern {
    BPM bpm;

    int pattern[];
    int ptr;

    float tempo;
    
    0 => int REST;

    function void init(int init_bpm) {
        bpm.tempo(init_bpm);

        0 => ptr;

        bpm.onetwentyeighthNote / 1.0::second => tempo;

        int values[0] @=> pattern;
    }

    function void add(int notes[], dur res) {
        ((res/1::second) / tempo) $ int => int res_slots;

        int buffer[pattern.size() + res_slots*notes.size()];
        for( 0 => int i; i < pattern.size(); 1 +=> i) {
            pattern[i] => buffer[i];
        }

        buffer @=> pattern;

        for ( 0 => int i; i < notes.size(); 1 +=> i) {
            notes[i] => pattern[ptr];
            res_slots +=> ptr;
        }
    }

    function void addRepeated(int notes[], dur res, int n) {
        for ( 0 => int i; i < n; 1 +=> i) {
            add(notes, res);
        }
    }

    function dur duration() {
        return (pattern.size() * tempo)::second;
    }
}
