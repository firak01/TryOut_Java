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


public class Xslt4Xml {
	//Nur zum testen: private static final String sBASE_DIRECTORY="c:\\temp\\20130110XSLT Notes Export Import\\CustomControls";
	public static void main(String[] args) {
	try {
		System.out.println("\nSTART TRANSFORMER!");
		
		//Nur zum teesten XPageTransformer objT = new XPageTransformer(sBASE_DIRECTORY);
		
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
		if(sBaseDirectory.equals("")) throw new Exception("Kein Verzeichnis mit den .xsd Dateien als Parameter angegeben (Leerstring).");		
		System.out.println("Directory to process: '" + sBaseDirectory + "'");
		
		String sBaseDirectoryXslt = sBaseDirectory;
		if(sBaseDirectoryXslt.equals("")) throw new Exception("Kein Verzeichnis mit den .xsd Dateien als Parameter angegeben (Leerstring).");		
		System.out.println("Directory to process: '" + sBaseDirectoryXslt + "'");

		String sBaseDirectoryOutput = sBaseDirectory;
		if(sBaseDirectoryXslt.equals("")) throw new Exception("Kein Verzeichnis für den Output als Parameter angegeben (Leerstring).");		
		System.out.println("Directory for Output: '" + sBaseDirectoryOutput + "'");

		
		XmlTransformer objT = new XmlTransformer(sBaseDirectory, sBaseDirectoryXslt, sBaseDirectoryOutput);
		objT.start();
				
		System.out.println("\nALL FINISHED!");
	} catch (Exception e) {
		e.printStackTrace(System.err);
	}
}

}
