
"/Library/ChucK/examples/book/digital-artists/audio" => string audio_dir;
SndBufDrum left;
left.init(audio_dir + "/snare_01.wav", 0.65, 1.05, 0.10, 0.10);
left.bus => dac;

SndBufDrum right;
right.init(audio_dir + "/snare_01.wav", 0.8, 0.9, 0.01, 0.01);
right.bus => dac;

BPM bpm;
bpm.tempo(120);

[
    [
        9,0,0,0, 0,0,0,0,
        9,0,0,0, 0,0,0,0,
        9,0,0,0, 0,0,0,0,
        9,0,0,0, 0,0,0,0,

        9,0,0,0, 0,0,0,0,
        9,0,0,0, 0,0,0,0,
        9,0,0,0, 0,0,0,0,
        9,0,0,0, 0,0,0,0,

        9,0,0,0, 9,0,0,0,
        9,0,0,0, 9,0,0,0,
        9,0,0,0, 9,0,0,0,
        9,0,0,0, 9,0,0,0,

        9,0,9,0, 9,0,9,0,
        9,0,9,0, 9,0,9,0
    ],
    [
        0,0,0,0, 9,0,0,0,
        0,0,0,0, 9,0,0,0,
        0,0,0,0, 9,0,0,0,
        0,0,0,0, 9,0,0,0,

        0,0,0,0, 9,0,0,0,
        0,0,0,0, 9,0,0,0,
        0,0,0,0, 9,0,0,0,
        0,0,0,0, 9,0,0,0,

        0,0,9,0, 0,0,9,0,
        0,0,9,0, 0,0,9,0,
        0,0,9,0, 0,0,9,0,
        0,0,9,0, 0,0,9,0,

        0,9,0,9, 0,9,0,9,
        0,9,0,9, 0,9,0,9
    ]
] @=> int pattern[][];

spork ~ left.play(pattern[0], bpm.sixteenthNote);
right.play(pattern[1], bpm.sixteenthNote);

