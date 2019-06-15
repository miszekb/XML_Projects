import java.util.ArrayList;
import javax.xml.bind.annotation.*;

@XmlRootElement
@XmlType(propOrder = { "autorzy", "zmiany", "baza", "marki"})
public class Dokument {

    private Samochody baza = new Samochody();
    private Zmiany zmiany = new Zmiany();
    private Autorzy autorzy = new Autorzy();
    private Marki marki = new Marki();

    public void addToAutorzy(Autor autor) {
        autorzy.add(autor);
    }
    public void addToBaza(Samochod samochod) {
        baza.add(samochod);
    }
    public void addToMarki(Marka marka) {
        marki.add(marka);
    }
    public void addToZmiany(Zmiana zmiana) {
        zmiany.add(zmiana);
    }

    public Samochody getBaza() {
        return baza;
    }

    public void setBaza(Samochody baza) {
        this.baza = baza;
    }

    public Autorzy getAutorzy() {
        return autorzy;
    }

    public void setAutorzy(Autorzy autorzy) {
        this.autorzy = autorzy;
    }

    public Marki getMarki() {
        return marki;
    }

    public void setMarki(Marki marki) {
        this.marki = marki;
    }

    public Zmiany getZmiany() {
        return zmiany;
    }

    public void setZmiany(Zmiany zmiany) {
        this.zmiany = zmiany;
    }
}