
public class GrooveBuilder {
    BPM bpm;
    float tempo;
    DrumPattern left;
    DrumPattern right;

    function void init(int init_bpm) {
        bpm.tempo(init_bpm);
        left.init(init_bpm);
        left.tempo => tempo;
        right.init(init_bpm);
    }

    function void addFullLeftTriplet(dur res, int intensity) {
        ((res/1::second) / tempo) $ int => int res_slots;
        int l_buffer[res_slots];
        int r_buffer[res_slots];

        (res_slots / 3) $ int => int triplet_slots;
        intensity => l_buffer[0];
        intensity => l_buffer[triplet_slots];
        intensity => l_buffer[2*triplet_slots];

        left.add(l_buffer, tempo::second);
        right.add(r_buffer, tempo::second);
    }

    function void addFullRightTriplet(dur res, int intensity) {
        ((res/1::second) / tempo) $ int => int res_slots;
        int l_buffer[res_slots];
        int r_buffer[res_slots];

        (res_slots / 3) $ int => int triplet_slots;
        intensity => r_buffer[0];
        intensity => r_buffer[triplet_slots];
        intensity => r_buffer[2*triplet_slots];

        left.add(l_buffer, tempo::second);
        right.add(r_buffer, tempo::second);
    }

    function void addTripletLRL(dur res, int intensity) {
        ((res/1::second) / tempo) $ int => int res_slots;
        int l_buffer[res_slots];
        int r_buffer[res_slots];

        (res_slots / 3) $ int => int triplet_slots;
        intensity => l_buffer[0];
        intensity => r_buffer[triplet_slots];
        intensity => l_buffer[2*triplet_slots];

        left.add(l_buffer, tempo::second);
        right.add(r_buffer, tempo::second);
    }

    function void addTripletRLR(dur res, int intensity) {
        ((res/1::second) / tempo) $ int => int res_slots;
        int l_buffer[res_slots];
        int r_buffer[res_slots];

        (res_slots / 3) $ int => int triplet_slots;
        intensity => r_buffer[0];
        intensity => l_buffer[triplet_slots];
        intensity => r_buffer[2*triplet_slots];

        left.add(l_buffer, tempo::second);
        right.add(r_buffer, tempo::second);
    }

}
