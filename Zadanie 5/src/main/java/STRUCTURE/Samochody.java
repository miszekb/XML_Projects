package STRUCTURE;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import java.util.ArrayList;

@XmlAccessorType(XmlAccessType.FIELD)
public class Samochody {


    @XmlElement(name = "samochód")
    private ArrayList<Samochod> samochody = new ArrayList<Samochod>();

    public void add(Samochod samochod) {
        samochody.add(samochod);
    }

    public ArrayList<Samochod> getSamochody() {
        return samochody;
    }

    public void setSamochody(ArrayList<Samochod> samochody) {
        this.samochody = samochody;
    }

}
