import javax.xml.bind.JAXBContext;
import javax.xml.bind.Marshaller;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.OutputStreamWriter;

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
}
