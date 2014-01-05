public class Playable {
   Pan2 bus;

    function void play(float freq, dur duration, float gain) {
        duration => now;
    }

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

public class OscADSRPlayable extends Playable {
   ADSR adsr;
   Osc osc;

   float a;
   float d;
   float r;

   float s_lvl;

   function void init(Osc o, float attack, float decay, float release, sustain_level) {
       o @=> osc;
       osc => adsr => bus;
   }

   function void play(float freq, dur duration, float gain) {
      gain => bus.gain;
      freq => osc.freq;

      duration * a => dur attack_dur;
      duration * d => dur decay_dur;
      duration * r => dur release_dur;
      duration - attack_dur - decay_dur - release_dur => dur sustain_dur;

      (attack_dur, decay_dur, s_lvl, release_dur) => adsr.set;
      1 => adsr.keyOn;
      attack_dur + decay_dur + sustain_dur => now;
      1 => adsr.keyOff;
      release_dur => now;
   }

}
