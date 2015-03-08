
public class DrumKit {
    Pan2 bus;

    string audioDir;
    SndBufDrum leftSnare;
    SndBufDrum rightSnare;

    float leftGain;
    float leftBaseFreq;
    float leftAccuracy;
    float leftPrecision;

    float rightGain;
    float rightBaseFreq;
    float rightAccuracy;
    float rightPrecision;

    "/snare_01.wav" => string SNARE_FILE;

    function void init(string audioDir, float precision, float accuracy, float handbias) {

        // hand bias of 0 means left hand has max ability
        // if handbias is 1, right hand has max ability
        Math.min(1.0, (1.0 - handbias)/2 + 0.5) => float leftyness;
        Math.min(1.0, handbias/2 + 0.5) => float rightyness;

        leftyness => float scale;
        if (rightyness > leftyness) {
            rightyness => scale;
        }

        leftyness / scale => float leftAbility;
        rightyness / scale => float rightAbility;

        precision / 10 + 0.9 => precision;
        accuracy / 10 + 0.9 => accuracy;

        precision * (leftAbility/5 + 0.8) => leftPrecision;
        precision * (rightAbility/5 + 0.8) => rightPrecision;

        accuracy * (leftAbility/4 + 0.75) => leftAccuracy;
        accuracy * (rightAbility/4 + 0.75) => rightAccuracy;

        Math.pow(leftAccuracy, 3) => leftGain;
        Math.pow(rightAccuracy, 3) => rightGain;

        (leftAbility/5 + 0.8) => leftBaseFreq;
        (rightAbility/5 + 0.8) => rightBaseFreq;

        leftSnare.init(
            audioDir + SNARE_FILE,
            leftGain,
            leftBaseFreq,
            1.0 - leftPrecision,
            1.0 - leftAccuracy
        );
        leftSnare.bus => bus;

        rightSnare.init(
            audioDir + SNARE_FILE,
            rightGain,
            rightBaseFreq,
            1.0 - rightPrecision,
            1.0 - rightAccuracy
        );
        rightSnare.bus => bus;
    }


    function void play(DrumPattern left, DrumPattern right) {
        spork ~ leftSnare.play(left.pattern, left.tempo::second);
        rightSnare.play(right.pattern, right.tempo::second);
    }

}

