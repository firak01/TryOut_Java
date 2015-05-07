package fgl.tryout.element.choose;

import java.io.File;

import transformer.XmlTransformer;


/**
 * Mit daten von
 * http://www.w3schools.com/xsl/tryxslt.asp?xmlfile=cdcatalog&xsltfile=cdcatalog_choose2
 * @author Lindhauer
 *
 */
public class MyMusicMain {

	public static void main(String[] args) {
		try {
			System.out.println("\nSTART TRANSFORMER!");
			//TODO GOON: DIE VERZEICHNISSE ANPASSEN
			
						
//			if(args==null) throw new Exception("Kein Verzeichnis mit den .xsd Dateien als Parameter angegeben (null).");
//			if(args.length==0) throw new Exception("Kein Verzeichnis mit den .xsd Dateien als Parameter angegeben (0).");
			
			//Die Verzeichnisse dürfen maximal mit einem Leerzeichen versehen sein!
//			String sBaseDirectory = new String("");
//			for(String s : args){
//				if(sBaseDirectory.equals("")){
//					sBaseDirectory = s;
//				}else{
//					sBaseDirectory = sBaseDirectory + " " + s;
//				}
//			}
			
			//Eclipse Worspace
			File f = new File("");
		    String sPathEclipse = f.getAbsolutePath();
		    System.out.println("Eclipse absolut path: " + sPathEclipse);
	        //String sPathParent = sPathEclipse.substring(0, sPathEclipse.lastIndexOf(System.getProperty("file.separator")));
	        String sBaseDirectory = sPathEclipse + File.separator + "xmlInput";
	 
			if(sBaseDirectory.equals("")) throw new Exception("Kein Verzeichnis mit den .xsd Dateien als Parameter angegeben (Leerstring).");
			
			//TODO: Errechne den Package Namen
			String sPackageDirectory = "element" + File.separator + "choose"; 
			String sProcessingDirectory = sBaseDirectory + File.separator + sPackageDirectory;
			System.out.println("Directory to process: '" + sProcessingDirectory + "'");
	
			
			
			XmlTransformer objT = new XmlTransformer(sProcessingDirectory);
			objT.start();
					
			System.out.println("\nALL FINISHED!");
		} catch (Exception e) {
			e.printStackTrace(System.err);
		}

	}

}
