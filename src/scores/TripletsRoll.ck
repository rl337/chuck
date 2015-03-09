

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

left.addTripletA(left.bpm.quarterNote, 6);
right.addTripletB(left.bpm.quarterNote, 6);

left.addTripletB(left.bpm.quarterNote, 6);
right.addTripletA(left.bpm.quarterNote, 6);

left.addTripletA(left.bpm.quarterNote, 6);
right.addTripletB(left.bpm.quarterNote, 6);

left.addTripletB(left.bpm.quarterNote, 6);
right.addTripletA(left.bpm.quarterNote, 6);

left.addTripletA(left.bpm.quarterNote, 6);
right.addTripletB(left.bpm.quarterNote, 6);

left.addTripletB(left.bpm.quarterNote, 6);
right.addTripletA(left.bpm.quarterNote, 6);

kit.play(left, right);
