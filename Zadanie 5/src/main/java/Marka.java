public class Marka {

    private String ID;
    private String koncern;

    public Marka(String ID, String koncern, short rokZalozenia) {
        this.ID = ID;
        this.koncern = koncern;
        this.rokZalozenia = rokZalozenia;
    }
    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getKoncern() {
        return koncern;
    }

    public void setKoncern(String koncern) {
        this.koncern = koncern;
    }

    public short getRokZalozenia() {
        return rokZalozenia;
    }

    public void setRokZalozenia(short rokZalozenia) {
        this.rokZalozenia = rokZalozenia;
    }

    private short rokZalozenia;


}
