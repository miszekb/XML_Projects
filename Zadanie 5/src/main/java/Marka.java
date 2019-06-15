public class Marka {

    private String markaID;
    private String koncern;
    private int rokZalozenia;


    public Marka(String ID, String koncern, int rokZalozenia) {
        this.markaID = ID;
        this.koncern = koncern;
        this.rokZalozenia = rokZalozenia;
    }
    public String getID() {
        return markaID;
    }

    public void setID(String ID) {
        this.markaID = ID;
    }

    public String getKoncern() {
        return koncern;
    }

    public void setKoncern(String koncern) {
        this.koncern = koncern;
    }

    public int getRokZalozenia() {
        return rokZalozenia;
    }

    public void setRokZalozenia(int rokZalozenia) {
        this.rokZalozenia = rokZalozenia;
    }



}
