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
public class MyXPathParserFGL {

		//TODO: Den XPathParser als seperates Projekt einbinden.
	    //      Merke: Ihn gibt es schon als seperates Repository....
		public void MyXPathPaserFGL(){		
		}
		
		public boolean startIt(String[] args) {
			boolean bReturn = false;
			try{				
				//Parameterübergabe (z.B. für ein gepacktes .jar - File
				String stemp = "Kein Verzeichnis mit den zur parsenden Dateien als Parameter angegeben";
				if(args==null) throw new Exception(stemp + " (args null).");
				if(args.length==0) throw new Exception(stemp + " (0).");
				if(args[0].equals("") || args[0]==null) throw new Exception(stemp + " (null)");
				
				stemp = "Keine zu parsende Datei angeben";
				if(args.length==1) throw new Exception(stemp + " (1).");
				if(args[1].equals("") || args[1]==null) throw new Exception(stemp + " (null)");
				
				stemp = "Keine XPath Ausdruck angeben";
				if(args.length==2) throw new Exception(stemp + " (2).");
				if(args[2].equals("") || args[2]==null) throw new Exception(stemp + " (null)");
				
				//Die Verzeichnisse dürfen maximal mit einem Leerzeichen versehen sein!
				String sBaseDirectory = new String("");
				String sFileName = new String("");
				String sXPathExpression = new String("");
				int iArgCount = -1;
				for(String s : args){
					iArgCount++;
					switch (iArgCount){
					case 0:
						sBaseDirectory = s;						
						break;
					case 1:
						sFileName = s;
						break;
					case 2:
						sXPathExpression = s;
						break;
					default:
						
					}					
				}
			
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
			document = builder.parse(new FileInputStream(sBaseDirectory + File.separator + sFileName));
			
			//Alternative: XML String parsen, wäre so:
			//String sXml = "....";
			//document = builder.parse(new ByteArrayInputStream(xml.getBytes()));
			
			
			String expression = sXPathExpression;		
			System.out.println("Expression: '" + expression + "'");
			XPath xPath = XPathFactory.newInstance().newXPath();
			
			//FGL: Ein etwas (!) 'generischerer' Ansatz, d.h. von dem ausgwählten Ausdruck unabhängiger.
			//read an xml node using xpath		
			Node node = (Node) xPath.compile(expression).evaluate(document, XPathConstants.NODE);

			//Wenn ein Stringwert zurückkommt, liefere diesen, ansonsten den Node-Wert (FGL-Erweiterung). 
			//Beachte die null-Überprüfung ist absichtlich so von der Reihenfolge her.
			if(null != node && null != node.getNodeValue()){
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
						System.out.println(i+1 + ". Wert, Knotentname:Wert erster Kindknoten: " + nodeList.item(i).getNodeName() + " : " + nodeSub.getFirstChild().getNodeValue());
					}
				}
			}
			bReturn = true;
			
			
			
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (SAXException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace(System.err);				
			}
			return bReturn;
		}

}
