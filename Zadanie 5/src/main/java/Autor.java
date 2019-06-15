import com.sun.xml.txw2.annotation.XmlElement;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlValue;

@XmlAccessorType(XmlAccessType.FIELD)
public class Autor {
    @XmlValue
    private String autorDane;
    @XmlAttribute
    private int grupa_TGSK;
    @XmlAttribute
    private String github;

    public Autor(String autorDane, int grupa, String github) {
        this.autorDane = autorDane;
        this.grupa_TGSK = grupa;
        this.github = github;
    }

    public Autor() {}

    public String getAutorDane() {
        return autorDane;
    }

    public void setAutorDane(String autorDane) {
        this.autorDane = autorDane;
    }

    public int getGrupa() {
        return grupa_TGSK;
    }

    public void setGrupa(int grupa) {
        this.grupa_TGSK = grupa;
    }

    public String getGithub() {
        return github;
    }

    public void setGithub(String github) {
        this.github = github;
    }
}
