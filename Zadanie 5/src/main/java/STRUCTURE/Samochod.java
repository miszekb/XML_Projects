package STRUCTURE;

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
    private MarkaAuta marka; //empty element with attribute
    private Model model;
    private int rocznik;
    private String typ;
    private int przebieg;
    @XmlElement(name = "rodzaj_silnika")
    private String rodzajSilnika;
    @XmlElement(name = "pojemność_silnika")
    private float pojemnoscSilnika;
    private Cena cena;
    @XmlElement(name = "data_umieszczenia_ogłoszenia")
    private Date data;

    public Samochod() {}

    public Samochod(String ID, MarkaAuta marka, Model model, int rocznik, String typ, int przebieg, String rodzajSilnika, float pojemnoscSilnika, Cena cena, Date data) {
        this.ID = ID;
        this.marka = marka;
        this.model = model;
        this.rocznik = rocznik;
        this.typ = typ;
        this.przebieg = przebieg;
        this.rodzajSilnika = rodzajSilnika;
        this.pojemnoscSilnika = pojemnoscSilnika;
        this.cena = cena;
        this.data = data;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public MarkaAuta getMarka() {
        return marka;
    }

    public void setMarka(MarkaAuta marka) {
        this.marka = marka;
    }

    public Model getModel() {
        return model;
    }

    public void setModel(Model model) {
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

    public Cena getCena() {
        return cena;
    }

    public void setCena(Cena cena) {
        this.cena = cena;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }
}
