

"/Library/ChucK/examples/book/digital-artists/audio" => string audio_dir;

DrumKit kit;
kit.init(audio_dir, 0.9, 0.9, 0.75);
kit.bus => dac;

DrumPattern left;
left.init(240);

DrumPattern right;
right.init(240);

WavFileWriter writer;
writer.init("a.wav", 1.0);
dac => writer.bus;


left.addRepeated(
    [
        9,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
        0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
        6,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,

        0,4,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
        6,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
        0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
    ],
    left.bpm.sixtyfourthNote,
    16 
);

right.addRepeated(
    [
        0,4,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
        6,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
        0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,

        9,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
        0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
        6,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
    ],
    left.bpm.sixtyfourthNote,
    16
);

kit.play(left, right);
