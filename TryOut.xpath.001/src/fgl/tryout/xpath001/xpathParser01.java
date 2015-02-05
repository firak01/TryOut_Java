package fgl.tryout.xpath001;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class xpathParser01 {

	public static void main(String[] args) {
		try{
		/* Hier ohne Parameter�bergabe, nur Eclipse Folder */
//		//Parameterübergabe (z.B. für ein gepacktes .jar - File
//		if(args==null) throw new Exception("Kein Verzeichnis mit den .xsd Dateien als Parameter angegeben (null).");
//		if(args.length==0) throw new Exception("Kein Verzeichnis mit den .xsd Dateien als Parameter angegeben (0).");
//		
//		//Die Verzeichnisse dürfen maximal mit einem Leerzeichen versehen sein!
//		String sBaseDirectory = new String("");
//		for(String s : args){
//			if(sBaseDirectory.equals("")){
//				sBaseDirectory = s;
//			}else{
//				sBaseDirectory = sBaseDirectory + " " + s;
//			}
//		}
		
		
		
		//Eclipse Worspace
		File f = new File("");
	    String sPathEclipse = f.getAbsolutePath();
	    System.out.println("Eclipse absolut path: " + sPathEclipse);
        //String sPathParent = sPathEclipse.substring(0, sPathEclipse.lastIndexOf(System.getProperty("file.separator")));
        String sBaseDirectory = sPathEclipse + File.separator + "xmlInput";
         
        String sFileName = "employee.xml";
        
		//... Ab hier wie bei der Paremterübergabe im fertig gepackten .jar - File...
		if(sBaseDirectory.equals("")) throw new Exception("Kein Verzeichnis mit den .xml Dateien als Parameter angegeben (Leerstring).");		
		System.out.println("Directory to process: '" + sBaseDirectory + "'");
		
		
		
		//########################################################
		//+++ Zuerst ein DOM-Document
		//1. DocumentBuilder Objekt
		DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = null;
		try{
			builder = builderFactory.newDocumentBuilder();
		}catch(ParserConfigurationException e){
			e.printStackTrace();
		}
		
		//2. Document Objekt
		Document document = null;
		try {
			document = builder.parse(new FileInputStream(sBaseDirectory + File.separator + sFileName));
			//Alternative: XML String parsen.
			//String sXml = "....";
			//document = builder.parse(new ByteArrayInputStream(xml.getBytes()));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (SAXException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		//+++ Nun das XPath - Objekt
		String expression = "/Employees/Employee[@emplid='3333']/email";
				
		XPath xPath = XPathFactory.newInstance().newXPath();
		
		//read a String Value
		String email = xPath.compile(expression).evaluate(document);
		
		//read an xml node using xpath
		Node node = (Node) xPath.compile(expression).evaluate(document, XPathConstants.NODE);
		System.out.println("Node - Wert: '" + node.getNodeValue() + "'");
		
		//read an nodelist using xpath
		NodeList nodeList = (NodeList) xPath.compile(expression).evaluate(document, XPathConstants.NODESET);
		for(int i = 0 ; i < nodeList.getLength(); i++){
			System.out.println(nodeList.item(i).getFirstChild().getNodeValue());
		}
		
		
		
		
		} catch (Exception e) {
			e.printStackTrace(System.err);
		}
	}

}
