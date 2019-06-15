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

}
