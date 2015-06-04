

"/Library/ChucK/examples/book/digital-artists/audio" => string audio_dir;

DrumKit kit;
kit.init(audio_dir, 0.9, 0.9, 0.75);
kit.bus => dac;

GrooveBuilder builder;
builder.init(240);

WavFileWriter writer;
writer.init("a.wav", 1.0);
dac => writer.bus;


for (0 => int i; i < 8; 1 +=> i) {
    builder.addTripletLRL(builder.bpm.halfNote, 70);

    builder.addTripletRLR(builder.bpm.halfNote, 70);
}

kit.play(builder.left, builder.right);
