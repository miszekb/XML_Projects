package STRUCTURE;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import java.util.ArrayList;

@XmlAccessorType(XmlAccessType.FIELD)
public class Zmiany {
    @XmlElement(name = "zmiana")
    private ArrayList<Zmiana> zmiany = new ArrayList<Zmiana>();

    public void add(Zmiana zmiana) {
        zmiany.add(zmiana);
    }

}