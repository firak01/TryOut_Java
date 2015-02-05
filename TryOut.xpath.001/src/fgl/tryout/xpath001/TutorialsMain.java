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
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;
 
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

/*
 * aus: http://viralpatel.net/blogs/java-xml-xpath-tutorial-parse-xml/
 * Das habe ich dann in xpathPaser01 abgewandelt, so ist es nicht lauffähig.
 *
 * 
2. Learning XPath Expressions

As mentioned above, XPath uses a path expression to select nodes or list of node from an xml document. Heres a list of useful paths and expression that can be used to select any node/nodelist from an xml document.
Expression 	Description
nodename 	Selects all nodes with the name “nodename”
/ 	Selects from the root node
// 	Selects nodes in the document from the current node that match the selection no matter where they are
. 	Selects the current node
.. 	Selects the parent of the current node
@ 	Selects attributes
employee 	Selects all nodes with the name “employee”
employees/employee 	Selects all employee elements that are children of employees
//employee 	Selects all book elements no matter where they are in the document

Below list of expressions are called Predicates. The Predicates are defined in square brackets [ … ]. They are used to find a specific node or a node that contains a specific value.
Path Expression 	Result
/employees/employee[1] 	Selects the first employee element that is the child of the employees element.
/employees/employee[last()] 	Selects the last employee element that is the child of the employees element
/employees/employee[last()-1] 	Selects the last but one employee element that is the child of the employees element
//employee[@type='admin'] 	Selects all the employee elements that have an attribute named type with a value of ‘admin’

There are other useful expressions that you can use to query the data.
Read this w3school page for more details: http://www.w3schools.com/xpath/xpath_syntax.asp
 */
public class TutorialsMain {
 public static void main(String[] args) {
	 
	        try {
	            FileInputStream file = new FileInputStream(new File("c:/employees.xml"));
	                 
	            DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
	             
	            DocumentBuilder builder =  builderFactory.newDocumentBuilder();
	             
	            Document xmlDocument = builder.parse(file);
	 
	            XPath xPath =  XPathFactory.newInstance().newXPath();
	 
	            System.out.println("*************************");
	            String expression = "/Employees/Employee[@emplid='3333']/email";
	            System.out.println(expression);
	            String email = xPath.compile(expression).evaluate(xmlDocument);
	            System.out.println(email);
	 
	            System.out.println("*************************");
	            expression = "/Employees/Employee/firstname";
	            System.out.println(expression);
	            NodeList nodeList = (NodeList) xPath.compile(expression).evaluate(xmlDocument, XPathConstants.NODESET);
	            for (int i = 0; i < nodeList.getLength(); i++) {
	                System.out.println(nodeList.item(i).getFirstChild().getNodeValue());
	            }
	 
	            System.out.println("*************************");
	            expression = "/Employees/Employee[@type='admin']/firstname";
	            System.out.println(expression);
	            nodeList = (NodeList) xPath.compile(expression).evaluate(xmlDocument, XPathConstants.NODESET);
	            for (int i = 0; i < nodeList.getLength(); i++) {
	                System.out.println(nodeList.item(i).getFirstChild().getNodeValue());
	            }
	 
	            System.out.println("*************************");
	            expression = "/Employees/Employee[@emplid='2222']";
	            System.out.println(expression);
	            Node node = (Node) xPath.compile(expression).evaluate(xmlDocument, XPathConstants.NODE);
	            if(null != node) {
	                nodeList = node.getChildNodes();
	                for (int i = 0;null!=nodeList && i < nodeList.getLength(); i++) {
	                    Node nod = nodeList.item(i);
	                    if(nod.getNodeType() == Node.ELEMENT_NODE)
	                        System.out.println(nodeList.item(i).getNodeName() + " : " + nod.getFirstChild().getNodeValue());
	                }
	            }
	             
	            System.out.println("*************************");
	 
	            expression = "/Employees/Employee[age>40]/firstname";
	            nodeList = (NodeList) xPath.compile(expression).evaluate(xmlDocument, XPathConstants.NODESET);
	            System.out.println(expression);
	            for (int i = 0; i < nodeList.getLength(); i++) {
	                System.out.println(nodeList.item(i).getFirstChild().getNodeValue());
	            }
	         
	            System.out.println("*************************");
	            expression = "/Employees/Employee[1]/firstname";
	            System.out.println(expression);
	            nodeList = (NodeList) xPath.compile(expression).evaluate(xmlDocument, XPathConstants.NODESET);
	            for (int i = 0; i < nodeList.getLength(); i++) {
	                System.out.println(nodeList.item(i).getFirstChild().getNodeValue());
	            }
	            System.out.println("*************************");
	            expression = "/Employees/Employee[position() <= 2]/firstname";
	            System.out.println(expression);
	            nodeList = (NodeList) xPath.compile(expression).evaluate(xmlDocument, XPathConstants.NODESET);
	            for (int i = 0; i < nodeList.getLength(); i++) {
	                System.out.println(nodeList.item(i).getFirstChild().getNodeValue());
	            }
	 
	            System.out.println("*************************");
	            expression = "/Employees/Employee[last()]/firstname";
	            System.out.println(expression);
	            nodeList = (NodeList) xPath.compile(expression).evaluate(xmlDocument, XPathConstants.NODESET);
	            for (int i = 0; i < nodeList.getLength(); i++) {
	                System.out.println(nodeList.item(i).getFirstChild().getNodeValue());
	            }
	 
	            System.out.println("*************************");
	 
	        } catch (FileNotFoundException e) {
	            e.printStackTrace();
	        } catch (SAXException e) {
	            e.printStackTrace();
	        } catch (IOException e) {
	            e.printStackTrace();
	        } catch (ParserConfigurationException e) {
	            e.printStackTrace();
	        } catch (XPathExpressionException e) {
	            e.printStackTrace();
	        }      
	    }
	}


