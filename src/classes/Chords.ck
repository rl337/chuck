public class Chords {

    public static Chord Major(Scale scale, int root) {
        Chord result;
        result.init([scale.note(root), scale.note(root + 3), scale.note(root + 5)]);
        return result;
    }

    public static Chord Augmented(Scale scale, int root) {
        Chord result;
        result.init([scale.note(root), scale.note(root + 3), scale.note(root + 5)+1]);
        return result;
    }

    public static Chord Augmented7th(Scale scale, int root) {
        Chord result;
        result.init([scale.note(root), scale.note(root + 3), scale.note(root + 5)+1, scale.note(root+7)]);
        return result;
    }

    public static Chord Minor(Scale scale, int root) {
        Chord result;
        result.init([scale.note(root), scale.note(root + 3)-1, scale.note(root + 5)]);
        return result;
    }

    public static Chord Diminished(Scale scale, int root) {
        Chord result;
        result.init([scale.note(root), scale.note(root + 3)-1, scale.note(root + 5)-1]);
        return result;
    }

}
