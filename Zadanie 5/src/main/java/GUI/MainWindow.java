package GUI;

import STRUCTURE.*;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class MainWindow extends JPanel {

    private JTable samochody;
    private JTable marki;
    private JTextField fieldID = new JTextField("Wprowadź ID elementu do usunięcia");
    private JButton serializujButton = new JButton("Serializuj");
    private JButton deserializujButton = new JButton("Deserializuj");
    private JButton transformujButton = new JButton("Transformuj do HTML");
    private JButton refreshButton = new JButton("Odśwież");
    private JButton usunButton = new JButton("Usuń");
    private JScrollPane jps;
    private JScrollPane jps2;
    private JLabel bazaLabel = new JLabel("Baza aut");
    private JLabel markiLabel = new JLabel("Baza marek");

    public XMLSerializer xmlSerializer = new XMLSerializer();
    public XSLTransformer xslTransformer = new XSLTransformer();
    public Dokument dokument;

    public MainWindow() {
        initialize();
    }


    public void initialize() {
        //dokument = new Dokument();
        dokument = xmlSerializer.deserializeAll();
        String[][] samochodyDane = new String[dokument.getBaza().getSamochody().size() + 1][12];
        String[][] markiDane = new String[dokument.getMarki().getMarki().size() + 1][3];

        int i = 0;
        final DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");

        for (Samochod samochod : dokument.getBaza().getSamochody()) {

            String strDate = dateFormat.format(samochod.getData());

            samochodyDane[i][0] = samochod.getID();
            samochodyDane[i][1] = samochod.getMarka().getID();
            samochodyDane[i][2] = samochod.getModel().getModel();
            samochodyDane[i][3] = samochod.getModel().getKraj();
            samochodyDane[i][4] = Integer.toString(samochod.getRocznik());
            samochodyDane[i][5] = samochod.getTyp();
            samochodyDane[i][6] = Integer.toString(samochod.getPrzebieg());
            samochodyDane[i][7] = samochod.getRodzajSilnika();
            samochodyDane[i][8] = Float.toString(samochod.getPojemnoscSilnika());
            samochodyDane[i][9] = Integer.toString(samochod.getCena().getCena());
            samochodyDane[i][10] = samochod.getCena().getWaluta();
            samochodyDane[i][11] = strDate;
            i++;
        }

        i = 0;

        for (Marka marka : dokument.getMarki().getMarki()) {

            markiDane[i][0] = marka.getID();
            markiDane[i][1] = marka.getKoncern();
            markiDane[i][2] = Integer.toString(marka.getRokZalozenia());
            i++;
        }

        String[] markiColumns = {"ID", "Koncern", "Rok założenia"};
        String[] samochodyColumns = {"ID", "Marka", "Model", "Kraj", "Rocznik", "Typ", "Przebieg[km]", "Rodzaj silnika", "Pojemność[l]", "Cena", "Waluta", "Data"};

        samochody = new JTable(samochodyDane, samochodyColumns);
        samochody.setPreferredScrollableViewportSize(new Dimension(800, 300));
        samochody.setFillsViewportHeight(true);
        jps = new JScrollPane(samochody);
        add(bazaLabel);
        add(jps);

        marki = new JTable(markiDane, markiColumns);
        marki.setPreferredScrollableViewportSize(new Dimension(400, 300));
        marki.setFillsViewportHeight(true);
        jps2 = new JScrollPane(marki);
        add(markiLabel);
        add(jps2);
        add(serializujButton);
        add(deserializujButton);
        add(transformujButton);
        add(refreshButton);
        add(usunButton);
        add(fieldID);

        refreshButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                refresh();
            }
        });

        deserializujButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                dokument = xmlSerializer.deserializeAll();
                refresh();
            }
        });

        usunButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                System.out.println(dokument.getMarki().toString());

                Marka markaDoUsuniecia = null;
                Samochod samochodDoUsuniecia = null;

                for(Marka marka : dokument.getMarki().getMarki()) {
                    if(marka.getID().equals(fieldID.getText())) {
                        System.out.println("HALO");
                        markaDoUsuniecia = marka;
                    }
                }

                dokument.getMarki().getMarki().remove(markaDoUsuniecia);
                dokument.getBaza().getSamochody().remove(samochodDoUsuniecia);

                //xmlSerializer.serializeAll(dokument);
                refresh();

            }
        });

        transformujButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                xslTransformer.transform();
            }
        });

        serializujButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                dokument = new Dokument();
                String[][] currentData = new String[marki.getRowCount()][3];
                System.out.println(marki.getRowCount());
                for (int i = 0; i < marki.getRowCount(); i++) {

                    if (i == marki.getRowCount() - 1) {
                        if (marki.getValueAt(i, 0) == null
                                || marki.getValueAt(i, 1) == null
                                || marki.getValueAt(i, 2) == null) {
                            break;
                        }
                    }

                    currentData[i][0] = (String) marki.getValueAt(i, 0);
                    currentData[i][1] = (String) marki.getValueAt(i, 1);
                    currentData[i][2] = (String) marki.getValueAt(i, 2);

                    dokument.addToMarki(new Marka(currentData[i][0], currentData[i][1], Integer.parseInt(currentData[i][2])));
                }

                String[][] currentData2 = new String[samochody.getRowCount()][12];

                for (int i = 0; i < samochody.getRowCount(); i++) {

                    if (i == samochody.getRowCount() - 1) {
                        if (samochody.getValueAt(i, 0) == null
                                || samochody.getValueAt(i, 1) == null
                                || samochody.getValueAt(i, 2) == null
                                || samochody.getValueAt(i, 3) == null
                                || samochody.getValueAt(i, 4) == null
                                || samochody.getValueAt(i, 5) == null
                                || samochody.getValueAt(i, 6) == null
                                || samochody.getValueAt(i, 7) == null
                                || samochody.getValueAt(i, 8) == null
                                || samochody.getValueAt(i, 9) == null
                                || samochody.getValueAt(i, 10) == null
                                || samochody.getValueAt(i, 11) == null) {
                            break;
                        }
                    }
                    currentData2[i][0] = (String) samochody.getValueAt(i, 0);
                    currentData2[i][1] = (String) samochody.getValueAt(i, 1);
                    currentData2[i][2] = (String) samochody.getValueAt(i, 2);
                    currentData2[i][3] = (String) samochody.getValueAt(i, 3);
                    currentData2[i][4] = (String) samochody.getValueAt(i, 4);
                    currentData2[i][5] = (String) samochody.getValueAt(i, 5);
                    currentData2[i][6] = (String) samochody.getValueAt(i, 6);
                    currentData2[i][7] = (String) samochody.getValueAt(i, 7);
                    currentData2[i][8] = (String) samochody.getValueAt(i, 8);
                    currentData2[i][9] = (String) samochody.getValueAt(i, 9);
                    currentData2[i][10] = (String) samochody.getValueAt(i, 10);
                    currentData2[i][11] = (String) samochody.getValueAt(i, 11);

                    try {
                        dokument.addToBaza(new Samochod(currentData2[i][0], new MarkaAuta(currentData2[i][1]),
                                new Model(currentData2[i][2], currentData2[i][3]), Integer.parseInt(currentData2[i][4]),
                                currentData2[i][5], Integer.parseInt(currentData2[i][6]), currentData2[i][7],
                                Float.parseFloat(currentData2[i][8]), new Cena(Integer.parseInt(currentData2[i][9]), currentData2[i][10]),
                                new SimpleDateFormat("yyyy-mm-dd hh:mm:ss").parse(currentData2[i][11])));
                    } catch (Exception exception) {
                        System.out.println(exception.getMessage());
                    }

                }
                int j = 0;
                System.out.println(dokument.getMarki().toString());

                for (Marka marka : dokument.getMarki().getMarki()) {
                    System.out.println(j);
                    marka.setID(currentData[j][0]);
                    marka.setKoncern(currentData[j][1]);
                    marka.setRokZalozenia(Integer.parseInt(currentData[j][2]));
                    j++;
                }

                xmlSerializer.serializeAll(dokument);
            }
        });

    }

    public void refresh() {
        remove(samochody);
        remove(bazaLabel);
        remove(marki);
        remove(markiLabel);
        remove(serializujButton);
        remove(deserializujButton);
        remove(transformujButton);
        remove(refreshButton);
        remove(usunButton);
        remove(jps);
        remove(jps2);

        initialize();
        revalidate();
        repaint();
    }

}