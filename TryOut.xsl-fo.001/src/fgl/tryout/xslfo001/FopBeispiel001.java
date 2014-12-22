package fgl.tryout.xslfo001;

import java.io.*;

import javax.xml.transform.*;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamSource;

import org.apache.fop.apps.*;

/**Thorsten Horn Tutorial
 * 
 * @author Lindhauer
 *
 */
public class FopBeispiel001{
	public static void main( String[] args ) throws Exception
	{
//		if( args.length != 3 ) {
//			System.out.println( "Bitte XSL- und XML-Inputdateien sowie PDF-Outputdatei angeben." );
//			return;
//		}
		if( args.length != 1) {
			System.out.println( "Bitte Dateinamensbasis für XML- und XSL-Inputdatei und PDF-Outputdatei angeben. Die Dateinamen unterscheiden sich dann nur in ihrer Endung." );
			return;
		}
		String sBaseFile = args[0];
		
		//Merke: Wenn man diese Datei als ausführbare .jar Datei bereitstellt, dann muss man die Parameter anders übergeben.
		
		File f = new File("");
		String sPathEclipse = f.getAbsolutePath();
		System.out.println("Eclipse absolut path: " + sPathEclipse);
		//String sPathParent = sPathEclipse.substring(0, sPathEclipse.lastIndexOf(System.getProperty("file.separator")));
		String sBaseDirectoryXml = sPathEclipse + File.separator + "xmlInput";
		if(sBaseDirectoryXml.equals("")) throw new Exception("Kein Verzeichnis mit den .xml Dateien als Parameter angegeben (Leerstring).");		
		System.out.println("Directory to process xml: '" + sBaseDirectoryXml + "'");
		
		String sBaseDirectoryXsl = sPathEclipse + File.separator + "xslInput";
		if(sBaseDirectoryXsl.equals("")) throw new Exception("Kein Verzeichnis mit den .xsl Dateien als Parameter angegeben (Leerstring).");		
		System.out.println("Directory to process xsl: '" + sBaseDirectoryXsl + "'");
		
		String sBaseDirectoryPdf = sPathEclipse + File.separator + "pdfOutput";
		if(sBaseDirectoryPdf.equals("")) throw new Exception("Kein Verzeichnis mit den .pdf Dateien als Parameter angegeben (Leerstring).");		
		System.out.println("Directory for resulting pdf: '" + sBaseDirectoryPdf + "'");
		
		String sXmlFile = sBaseDirectoryXml + File.separator + sBaseFile + ".xml";
		String sXslFile = sBaseDirectoryXsl + File.separator + sBaseFile + ".xsl";
		String sPdfFile = sBaseDirectoryPdf + File.separator + sBaseFile + ".pdf";
			
		System.out.println( sXmlFile + " + " + sXslFile + " --> " + sPdfFile );
		FopBeispiel001.xmlToPdfPerXsl( sXslFile, sXmlFile, sPdfFile );
		System.out.println("Ende");
	}

	public static void xmlToPdfPerXsl( String inputXSL, String inputXML, String outputPDF ) throws Exception
	{
		OutputStream pdf = new FileOutputStream( outputPDF );
		Fop fop = FopFactory.newInstance().newFop( MimeConstants.MIME_PDF, pdf );
		Source xml = new StreamSource( inputXML );
		Source xsl = new StreamSource( inputXSL );
		Result sax = new SAXResult( fop.getDefaultHandler() );
		Transformer transformer = TransformerFactory.newInstance().newTransformer( xsl );
		transformer.transform( xml, sax );
	}
}