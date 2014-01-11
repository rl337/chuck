public class Playables {

    function static Playable SinOscADSR(float attack, float decay, float release, float sustain_level) {
        SinOsc s;
        OscADSRPlayable result;

        result.init(s, attack, decay, release, sustain_level);
        return result;
    }

    function static Playable SqrOscADSR(float attack, float decay, float release, float sustain_level) {
        SqrOsc s;
        OscADSRPlayable result;

        result.init(s, attack, decay, release, sustain_level);
        return result;
    }

    function static Playable TriOscADSR(float midpoint, float attack, float decay, float release, float sustain_level) {
        TriOsc t;
        midpoint => t.width;
        OscADSRPlayable result;

        result.init(t, attack, decay, release, sustain_level);
        return result;
    }

    function static Playable PulseOscADSR(float dutycycle, float attack, float decay, float release, float sustain_level) {
        PulseOsc p;
        dutycycle => p.width;
        OscADSRPlayable result;

        result.init(p, attack, decay, release, sustain_level);
        return result;
    }
}
