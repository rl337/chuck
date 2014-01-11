
public class OscADSRPlayable extends Playable {
   ADSR adsr;
   Osc osc;

   float a;
   float d;
   float r;

   float s_lvl;

   function void init(Osc o, float attack, float decay, float release, float sustain_level) {
       o @=> osc;
       osc => adsr => bus;
       
       attack => a;
       decay => d;
       release => r;
       sustain_level => s_lvl;
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
