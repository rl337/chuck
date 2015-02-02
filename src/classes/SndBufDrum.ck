
public class SndBufDrum extends Drum {
    SndBuf sample;
    1.0 => float gain;
    1.0 => float rate;
    0.05 => float dgain;
    0.05 => float drate;
    
    function void init(string file, float base_gain, float base_rate, float rand_gain, float rand_rate) {
        file => sample.read;
        sample.samples() => sample.pos;
        sample => this.bus;
        base_gain => gain;
        base_rate => rate;
        rand_gain => dgain;
        rand_rate => drate;
    }
    
    function void init(string file, float base_gain, float base_rate) {
        init(file, base_gain, base_rate, 0.2, 0.2);
    }
    
    function void init(string file) {
        init(file, 1.0, 1.0);
    }
    
    function void hit(float intensity) {
        intensity * gain + Math.random2f(-dgain/2, dgain/2) => sample.gain;
        rate + Math.random2f(-drate/2, drate/2) => sample.rate;
        0 => sample.pos;
    }
    
}

// Samples are located in:
// /Library/ChucK/examples/book/digital-artists/audio/
