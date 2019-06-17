import java.util.Date;

import STRUCTURE.*;
import GUI.*;

import javax.swing.*;

public class MainClass {
    public static void main(String[] args){
            MainWindow mainWindow = new MainWindow();
            mainWindow.xmlSerializer = new XMLSerializer();
            mainWindow.dokument = new Dokument();
            JFrame mainFrame = new JFrame();
            mainFrame.setSize(1000,800);
            mainFrame.setLayout(null);
            mainFrame.setContentPane(mainWindow);
            mainFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
            mainFrame.pack();
            mainFrame.setVisible(true);
    }
}
