package STRUCTURE;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import java.util.ArrayList;

@XmlAccessorType(XmlAccessType.FIELD)
public class Marki {

    @XmlElement(name = "marka")
    private ArrayList<Marka> marki = new ArrayList<>();

    public void add(Marka marka) {
        marki.add(marka);
    }

    public ArrayList<Marka> getMarki() {
        return marki;
    }

    public void setMarki(ArrayList<Marka> marki) {
        this.marki = marki;
    }

}
