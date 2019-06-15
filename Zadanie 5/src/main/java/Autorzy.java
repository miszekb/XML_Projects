import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import java.util.ArrayList;

@XmlAccessorType(XmlAccessType.FIELD)
public class Autorzy {
    @XmlElement(name = "autor")
    private ArrayList<Autor> autorzy = new ArrayList<Autor>();

    public void add(Autor autor) {
        autorzy.add(autor);
    }

    @Override
    public String toString() {
        String temp = "";
        for (Autor autor : autorzy) {
            temp += autor.getAutorDane() + "\n";
        }

        return temp;
    }

}
