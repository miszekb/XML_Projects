package STRUCTURE;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;

@XmlAccessorType(XmlAccessType.FIELD)
public class Marka {

    @XmlAttribute
    private String markaID;
    @XmlElement(name = "koncern")
    private String koncern;
    @XmlElement(name = "rok_założenia")
    private int rokZalozenia;

    public Marka() {}

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
