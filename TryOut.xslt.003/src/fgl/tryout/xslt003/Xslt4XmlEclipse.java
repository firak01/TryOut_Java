package fgl.tryout.xslt003;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.StringWriter;
import java.util.StringTokenizer;

import javax.xml.transform.Result;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import transformer.XmlTransformer;


public class Xslt4XmlEclipse {
	//Nur zum testen: private static final String sBASE_DIRECTORY="c:\\temp\\20130110XSLT Notes Export Import\\CustomControls";
	public static void main(String[] args) {
	try {
		System.out.println("\nSTART TRANSFORMER. VERWENDE ECLIPSE PFADE!");
		
		//Nur zum Testen XPageTransformer objT = new XPageTransformer(sBASE_DIRECTORY);

		/* Hier ohne Parameter�bergabe, nur Eclipse Folder
		if(args==null) throw new Exception("Kein Verzeichnis mit den .xsd Dateien als Parameter angegeben (null).");
		if(args.length==0) throw new Exception("Kein Verzeichnis mit den .xsd Dateien als Parameter angegeben (0).");
		
		//Die Verzeichnisse d�rfen maximal mit einem Leerzeichen versehen sein!
		String sBaseDirectory = new String("");
		for(String s : args){
			if(sBaseDirectory.equals("")){
				sBaseDirectory = s;
			}else{
				sBaseDirectory = sBaseDirectory + " " + s;
			}
		}
		*/
		
		
		//Eclipse Worspace
		File f = new File("");
	    String sPathEclipse = f.getAbsolutePath();
	    System.out.println("Eclipse absolut path: " + sPathEclipse);
        //String sPathParent = sPathEclipse.substring(0, sPathEclipse.lastIndexOf(System.getProperty("file.separator")));
	    
	    //TODO: Ermittle als default den Packagenamen
	    String sPathByPackageName = "xslt003";
        String sBaseDirectoryXml = sPathEclipse + File.separator + "xmlInput" + File.separator + sPathByPackageName;
        String sBaseDirectoryXslt = sPathEclipse + File.separator + "xsltInput" + File.separator + sPathByPackageName;
        String sBaseDirectoryOutput = sPathEclipse + File.separator + "zOutput" + File.separator + sPathByPackageName;
        
        
		//... Ab hier wie bei der Parameterübergabe im fertig gepackten .jar - File...
        if(sBaseDirectoryXml.equals("")) throw new Exception("Kein Verzeichnis mit den .xml Dateien als Parameter angegeben (Leerstring).");		
		System.out.println("Directory to process: '" + sBaseDirectoryXml + "'");

		if(sBaseDirectoryXslt.equals("")) throw new Exception("Kein Verzeichnis mit den .xsd Dateien als Parameter angegeben (Leerstring).");		
		System.out.println("Directory to process: '" + sBaseDirectoryXslt + "'");

		if(sBaseDirectoryOutput.equals("")) throw new Exception("Kein Verzeichnis für die Output Dateien als Parameter angegeben (Leerstring).");		
		System.out.println("Directory to process: '" + sBaseDirectoryOutput + "'");
		
		XmlTransformer objT = new XmlTransformer(sBaseDirectoryXml, sBaseDirectoryXslt, sBaseDirectoryOutput);
		objT.start();
				
		System.out.println("\nALL FINISHED!");
	} catch (Exception e) {
		e.printStackTrace(System.err);
	}
}

}
