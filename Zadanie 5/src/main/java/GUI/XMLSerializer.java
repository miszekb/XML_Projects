package GUI;

import STRUCTURE.Dokument;

import javax.swing.*;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;
import java.io.*;

public class XMLSerializer {

    public void serializeAll(Dokument dokument)
    {
        try (OutputStreamWriter osw = new OutputStreamWriter(new FileOutputStream("car_database.xml"), "UTF-8");)
        {
            JAXBContext ctx = JAXBContext.newInstance(Dokument.class);
            Marshaller mrs = ctx.createMarshaller();
            mrs.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, Boolean.TRUE);
            mrs.marshal(dokument, osw);

        }
        catch (Exception exception) {
           JOptionPane.showMessageDialog(null, exception.getMessage());
           // System.out.println(exception.getCause());
        }
    }

    public Dokument deserializeAll()
    {
        try (InputStreamReader osw = new InputStreamReader(new FileInputStream("car_database.xml"), "UTF-8");)
        {
            JAXBContext ctx = JAXBContext.newInstance(Dokument.class);
            Unmarshaller unmrs = ctx.createUnmarshaller();
            Object dok = unmrs.unmarshal(osw);

            return (Dokument)dok;

        }
        catch (Exception exception) {
            JOptionPane.showMessageDialog(null, exception.getMessage());
        }

        return null;

    }
}
