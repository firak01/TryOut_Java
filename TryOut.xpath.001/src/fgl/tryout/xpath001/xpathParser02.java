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

public class xpathParser02{

	public static void main(String[] args) {
		try{
			/* Hier ohne Parameter�bergabe, nur Eclipse Folder */
//			//Parameterübergabe (z.B. für ein gepacktes .jar - File
//			if(args==null) throw new Exception("Kein Verzeichnis mit den .xsd Dateien als Parameter angegeben (null).");
//			if(args.length==0) throw new Exception("Kein Verzeichnis mit den .xsd Dateien als Parameter angegeben (0).");
//			
//			//Die Verzeichnisse dürfen maximal mit einem Leerzeichen versehen sein!
//			String sBaseDirectory = new String("");
//			for(String s : args){
//				if(sBaseDirectory.equals("")){
//					sBaseDirectory = s;
//				}else{
//					sBaseDirectory = sBaseDirectory + " " + s;
//				}
//			}
			
			
			
			//Eclipse Workspace
			File f = new File("");
		    String sPathEclipse = f.getAbsolutePath();
		    System.out.println("Eclipse absolut path: " + sPathEclipse);
	        //String sPathParent = sPathEclipse.substring(0, sPathEclipse.lastIndexOf(System.getProperty("file.separator")));
	        String sBaseDirectory = sPathEclipse + File.separator + "xmlInput";
	                 
			//... Ab hier wie bei der Paremterübergabe im fertig gepackten .jar - File...
			if(sBaseDirectory.equals("")) throw new Exception("Kein Verzeichnis mit den .xml Dateien als Parameter angegeben (Leerstring).");		
			System.out.println("Directory to process: '" + sBaseDirectory + "'");
			
			String sFileName = "employee.xml";
			System.out.println("File to process: '" + sFileName + "'");
		
		
		
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
		
		
		//+++ Nun das XPath - Objekt, Merke: Groß-/Kleinschreibung ist wichtig.
		String expression01 = "employees/employee[@emplid='3333']/email";
		
		//read fistname of all the employees
		String expression02 = "/employees/employee/firstname";
		
		//Read a specific employee using employee id
		String expression03 = "/employees/employee[@emplid='2222']";
		
		//Read firstname of all employees who are admin
		String expression04 = "/employees/employee[@type='admin']/firstname";
		
		//Read firstname of all employees who are older than 40 year
		String expression05 = "/employees/employee[age>40]/firstname";
		
		//Read firstname of first two employees (defined in xml file)
		String expression06 = "/employees/employee[position() <= 2]/firstname";
		
		
		String expression = expression03;		
		System.out.println("Expression: '" + expression + "'");
		XPath xPath = XPathFactory.newInstance().newXPath();
		
		//FGL: Ein etwas (!) 'generischerer' Ansatz, d.h. von dem ausgwählten Ausdruck unabhängiger.
		//read an xml node using xpath		
		Node node = (Node) xPath.compile(expression).evaluate(document, XPathConstants.NODE);
		
		//Wenn ein Stringwert zurückkommt, liefer diesen, ansonsten den Node-Wert (FGL-Erweiterung)		
		if(node.getNodeValue() != null && node != null){
			System.out.println("Node - Wert: '" + node.getNodeValue() + "'");
		}else{
			
			//read a String Value
			String sValue = xPath.compile(expression).evaluate(document);
			System.out.println("String - Wert: '" + sValue + "'" );
		}		
		
		//read an nodelist using xpath
		NodeList nodeList = (NodeList) xPath.compile(expression).evaluate(document, XPathConstants.NODESET);
		for(int i = 0 ; i < nodeList.getLength(); i++){
			System.out.println(i+1 + ". Wert, erster Kindknoten: '" + nodeList.item(i).getFirstChild().getNodeValue() + "'");
		}
		
		if(node != null){
			nodeList = node.getChildNodes();
			for(int i = 0 ; nodeList != null && i < nodeList.getLength(); i++){
				Node nodeSub = nodeList.item(i);
				if(nodeSub.getNodeType() == Node.ELEMENT_NODE){
					System.out.println(i+1 + ". Wert, Kontentname:Wert erster Kindknoten: " + nodeList.item(i).getNodeName() + " : " + nodeSub.getFirstChild().getNodeValue());
				}
			}
		}
		
		
		
		
		} catch (Exception e) {
			e.printStackTrace(System.err);
		}
	}

}
