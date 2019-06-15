package GUI;

import STRUCTURE.Dokument;
import STRUCTURE.Samochod;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class MainWindow {

    private JPanel MainWindow;
    private JButton edytujButton;
    private JButton serializujButton;
    private JButton deserializujButton;
    private JButton dodajButton;
    private JButton usuńButton;
    private JList<Samochod> samochodJList = new JList<>();
    private DefaultListModel<Samochod> modelSamochod = new DefaultListModel<>();
    public XMLSerializer xmlSerializer;
    public Dokument dokument;

    public MainWindow() {

        samochodJList.setModel(modelSamochod);
        deserializujButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                dokument = xmlSerializer.deserializeAll();
                System.out.println(dokument.getAutorzy().toString());
                JOptionPane.showMessageDialog(null, "Deserializacja przebiegła pomyślnie.");

                //modelSamochod.add();
            }
        });

        dodajButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                JOptionPane.showMessageDialog(null, "Element został dodany.");
        }
        });

        usuńButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                JOptionPane.showMessageDialog(null, "Element został usunięty.");
            }
        });

        serializujButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                xmlSerializer.serializeAll(dokument);
                JOptionPane.showMessageDialog(null, "Serializacja przebiegła pomyślnie.");
            }
        });
    }

    public static void main(String[] args) {
        GUI.MainWindow mainWindow = new MainWindow();
        mainWindow.xmlSerializer = new XMLSerializer();
        mainWindow.dokument = new Dokument();
        JFrame mainFrame = new JFrame();
        mainFrame.setLayout(null);
        mainFrame.setContentPane(mainWindow.MainWindow);
        mainFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        mainFrame.pack();
        mainFrame.setVisible(true);


    }

}
