public class BPM {
    static dur quarterNote;
    static dur eighthNote;
    static dur sixteenthNote;
    static dur thirtysecondNote;
    static dur sixtyfourthNote;
    static dur onetwentyeighthNote;
    
    function void tempo(float bpm) {
        60.0 / bpm => float spb;
        
        spb::second => quarterNote;
        quarterNote * 0.5 => eighthNote;
        eighthNote * 0.5 => sixteenthNote;
        sixteenthNote * 0.5 => thirtysecondNote;
        thirtysecondNote * 0.5 => sixtyfourthNote;
        sixtyfourthNote * 0.5 => onetwentyeighthNote;
    }
    
}
