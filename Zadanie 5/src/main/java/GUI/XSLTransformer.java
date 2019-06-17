package GUI;

import STRUCTURE.Dokument;

import javax.swing.*;
import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.InputStreamReader;

public class XSLTransformer {

    public void transform() {

        TransformerFactory factory = TransformerFactory.newInstance();

        try (InputStreamReader xsl_isr = new InputStreamReader(
                new FileInputStream("transform.xsl"), "UTF-8");
             InputStreamReader xml_isr = new InputStreamReader(
                     new FileInputStream("car_database.xml"), "UTF-8");
             OutputStreamWriter osw = new OutputStreamWriter(
                     new FileOutputStream("transform.html"), "UTF-8"); )
        {
            Source xsl_src = new StreamSource(xsl_isr);
            Transformer transformer = factory.newTransformer(xsl_src);

            Source xml_src = new StreamSource(xml_isr);
            Result out = new StreamResult(osw);
            transformer.transform(xml_src, out);
            JOptionPane.showMessageDialog(null, "Transformacja do HTML przebiegła pomyślnie");

        }
        catch (Exception exception) {
            JOptionPane.showMessageDialog(null, exception.getMessage());
        }
    }
}
