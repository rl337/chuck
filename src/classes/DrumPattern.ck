
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

    function void resize(int slots) {
        int buffer[pattern.size() + slots];
        for( 0 => int i; i < pattern.size(); 1 +=> i) {
            pattern[i] => buffer[i];
        }
        buffer @=> pattern;
    }

    function void add(int notes[], dur res) {
        ((res/1::second) / tempo) $ int => int res_slots;

        resize(res_slots*notes.size());
        for ( 0 => int i; i < notes.size(); 1 +=> i) {
            notes[i] => pattern[ptr];
            res_slots +=> ptr;
        }
    }

    function void addFullTriplet(dur res, int intensity) {
        ((res/1::second) / tempo) $ int => int res_slots;

        resize(res_slots);
        
        (res_slots / 3) $ int => int triplet_slots;
        intensity => pattern[ptr];
        intensity => pattern[ptr + triplet_slots];
        intensity => pattern[ptr + 2*triplet_slots];

        res_slots +=> ptr;
    }

    function void addTripletA(dur res, int intensity) {
        ((res/1::second) / tempo) $ int => int res_slots;

        resize(res_slots);
        
        (res_slots / 3) $ int => int triplet_slots;
        intensity => pattern[ptr];
        intensity => pattern[ptr + 2*triplet_slots];

        res_slots +=> ptr;
    }

    function void addTripletB(dur res, int intensity) {
        ((res/1::second) / tempo) $ int => int res_slots;

        resize(res_slots);
        
        (res_slots / 3) $ int => int triplet_slots;
        intensity => pattern[ptr + triplet_slots];

        res_slots +=> ptr;
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
