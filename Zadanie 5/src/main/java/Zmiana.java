import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlValue;
import java.util.Date;

@XmlAccessorType(XmlAccessType.FIELD)
public class Zmiana {
    @XmlValue
    private Date data;

    public Zmiana(Date data) {
        this.data = data;
    }
    public Zmiana() {}

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }
}
