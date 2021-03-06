
"/Library/ChucK/examples/book/digital-artists/audio" => string audio_dir;

DrumKit kit;
kit.init(audio_dir, 0.9, 0.9, 0.75);
kit.bus => dac;

DrumPattern left;
left.init(120);

DrumPattern right;
right.init(120);

WavFileWriter writer;
writer.init("a.wav", 1.0);
dac => writer.bus;

left.addRepeated( [ 9,0,0,0, 0,0,0,0 ], left.bpm.sixteenthNote, 8);
left.addRepeated( [ 9,0,0,0, 9,0,0,0 ], left.bpm.sixteenthNote, 4);
left.addRepeated( [ 9,0,9,0, 9,0,9,0 ], left.bpm.sixteenthNote, 4);
left.addRepeated( [ 9,0,0,0, 9,0,0,0 ], left.bpm.sixteenthNote, 4);
left.addRepeated( [ 9,0,0,0, 0,0,0,0 ], left.bpm.sixteenthNote, 8);

left.addRepeated( [ 0,0,0,0, 9,0,0,0 ], right.bpm.sixteenthNote, 8);
left.addRepeated( [ 0,0,9,0, 0,0,9,0 ], right.bpm.sixteenthNote, 4);
left.addRepeated( [ 0,9,0,9, 0,9,0,9 ], right.bpm.sixteenthNote, 4);
left.addRepeated( [ 0,0,9,0, 0,0,9,0 ], right.bpm.sixteenthNote, 4);
left.addRepeated( [ 0,0,0,0, 9,0,0,0 ], right.bpm.sixteenthNote, 8);

right.addRepeated( [ 0,0,0,0, 9,0,0,0 ], right.bpm.sixteenthNote, 8);
right.addRepeated( [ 0,0,9,0, 0,0,9,0 ], right.bpm.sixteenthNote, 4);
right.addRepeated( [ 0,9,0,9, 0,9,0,9 ], right.bpm.sixteenthNote, 4);
right.addRepeated( [ 0,0,9,0, 0,0,9,0 ], right.bpm.sixteenthNote, 4);
right.addRepeated( [ 0,0,0,0, 9,0,0,0 ], right.bpm.sixteenthNote, 8);

right.addRepeated( [ 9,0,0,0, 0,0,0,0 ], left.bpm.sixteenthNote, 8);
right.addRepeated( [ 9,0,0,0, 9,0,0,0 ], left.bpm.sixteenthNote, 4);
right.addRepeated( [ 9,0,9,0, 9,0,9,0 ], left.bpm.sixteenthNote, 4);
right.addRepeated( [ 9,0,0,0, 9,0,0,0 ], left.bpm.sixteenthNote, 4);
right.addRepeated( [ 9,0,0,0, 0,0,0,0 ], left.bpm.sixteenthNote, 8);

kit.play(left, right);
