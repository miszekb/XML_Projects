import javax.xml.bind.JAXBContext;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;
import java.io.*;

public class XMLSerializer {

    public void serializeAll(Dokument dokument)
    {
        try (FileWriter fw = new FileWriter("outputFW.xml");
             OutputStreamWriter osw = new OutputStreamWriter(new FileOutputStream("output.xml"), "UTF-8");)
        {
            JAXBContext ctx = JAXBContext.newInstance(Dokument.class);
            Marshaller mrs = ctx.createMarshaller();
            mrs.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, Boolean.TRUE);

            mrs.marshal(dokument, fw);
            mrs.marshal(dokument, osw);
            mrs.marshal(dokument, System.out);
        }
        catch (Exception exception) {
            System.out.println(exception.getCause());
        }
    }

    public Dokument deserializeAll()
    {
        try (FileReader fr = new FileReader("output.xml");
             InputStreamReader osw = new InputStreamReader(new FileInputStream("car_database.xml"), "UTF-8");)
        {
            JAXBContext ctx = JAXBContext.newInstance(Dokument.class);
            Unmarshaller unmrs = ctx.createUnmarshaller();

            Object dok = unmrs.unmarshal(osw);
            return (Dokument)dok;

        }
        catch (Exception exception) {
            System.out.println(exception.getCause());
        }

        return null;

    }
}
