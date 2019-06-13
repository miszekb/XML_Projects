import java.util.Date;

public class Samochod {

    private String ID;
    private Marka marka;
    private String model;
    private short rocznik;
    private String typ;
    private int przebieg;
    private String rodzajSilnika;
    private float pojemnoscSilnika;
    private int cena;
    private Date data;

    public Samochod(String ID, Marka marka, String model, short rocznik, String typ, int przebieg, String rodzajSilnika, float pojemnoscSilnika, int cena, Date data) {
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

    public short getRocznik() {
        return rocznik;
    }

    public void setRocznik(short rocznik) {
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
