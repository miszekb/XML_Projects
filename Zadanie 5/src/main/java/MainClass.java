import java.util.Date;

public class MainClass {
    public static void main(String[] args){

        Dokument dok = new Dokument();

        Zmiana zmiana1 = new Zmiana(new Date());
        Zmiana zmiana2 = new Zmiana(new Date());
        Zmiana zmiana3 = new Zmiana(new Date());

        dok.addToZmiany(zmiana1);
        dok.addToZmiany(zmiana2);
        dok.addToZmiany(zmiana3);

        Autor autor1 = new Autor("Michal Bialecki",1,"miszekb");
        Autor autor2 = new Autor("Michal Mamona",2,"MickAlmighty");

        dok.addToAutorzy(autor1);
        dok.addToAutorzy(autor2);
        Cena cena1 = new Cena(26700, "PLN");
        Model model1 = new Model("Sharan", "Niemcy");
        MarkaAuta marka1 = new MarkaAuta("M1");
        Samochod samochod1 = new Samochod("auto1", marka1, model1,2008, "Minivan", 248000, "Diesel", 1.8f, cena1,  new Date());

        Marka marka = new Marka("M1", "Volkswagen", 1908);
        dok.addToMarki(marka);
        dok.addToBaza(samochod1);
        XMLSerializer xmlSerializer = new XMLSerializer();
        xmlSerializer.serializeAll(dok);

    }
}
