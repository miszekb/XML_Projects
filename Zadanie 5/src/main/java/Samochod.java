import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import java.util.Date;

@XmlAccessorType(XmlAccessType.FIELD)
public class Samochod {
    @XmlAttribute(name = "ID")
    private String ID; //attribute
    @XmlElement(name = "marka_auta")
    private Marka marka; //empty element with attribute
    private String model;
    private int rocznik;
    private String typ;
    private int przebieg;
    @XmlElement(name = "rodzaj_silnika")
    private String rodzajSilnika;
    @XmlElement(name = "pojemność_silnika")
    private float pojemnoscSilnika;
    private int cena;
    private String waluta; //attribute
    private Date data;

    public Samochod(String ID, Marka marka, String model, int rocznik, String typ, int przebieg, String rodzajSilnika, float pojemnoscSilnika, int cena, String waluta, Date data) {
        this.ID = ID;
        this.marka = marka;
        this.model = model;
        this.rocznik = rocznik;
        this.typ = typ;
        this.przebieg = przebieg;
        this.rodzajSilnika = rodzajSilnika;
        this.pojemnoscSilnika = pojemnoscSilnika;
        this.waluta = waluta;
        this.cena = cena;
        this.data = data;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public Marka getMarka() {
        return marka;
    }

    public void setMarka(Marka marka) {
        this.marka = marka;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public int getRocznik() {
        return rocznik;
    }

    public void setRocznik(int rocznik) {
        this.rocznik = rocznik;
    }

    public String getTyp() {
        return typ;
    }

    public void setTyp(String typ) {
        this.typ = typ;
    }

    public int getPrzebieg() {
        return przebieg;
    }

    public void setPrzebieg(int przebieg) {
        this.przebieg = przebieg;
    }

    public String getRodzajSilnika() {
        return rodzajSilnika;
    }

    public void setRodzajSilnika(String rodzajSilnika) {
        this.rodzajSilnika = rodzajSilnika;
    }

    public float getPojemnoscSilnika() {
        return pojemnoscSilnika;
    }

    public void setPojemnoscSilnika(float pojemnoscSilnika) {
        this.pojemnoscSilnika = pojemnoscSilnika;
    }

    public String getWaluta() {
        return waluta;
    }

    public void setWaluta(String waluta) {
        this.waluta = waluta;
    }

    public int getCena() {
        return cena;
    }

    public void setCena(int cena) {
        this.cena = cena;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }
}
