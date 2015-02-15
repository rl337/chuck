
public class WavFileWriter {
    WvOut output;
    Pan2 bus;

    function void init(string filename, float gain) {

        if (filename.length() != 0) {
            filename => output.wavFilename;

            bus => output => blackhole;
            gain => bus.gain;

            null @=> output;
        }
   }
}
