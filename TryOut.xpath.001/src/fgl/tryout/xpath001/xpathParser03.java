package fgl.tryout.xpath001;

import java.io.File;

public class xpathParser03 {

public static void main(String[] args) {
		
		try{
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
		
		
		
		//+++ Nun das XPath - Ausdrücke, Merke: Groß-/Kleinschreibung ist wichtig.
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
		
		
		String sExpression = expression06;
		
		//+++++++++++++++++++++++++++++++++++++++++++++++++++
		String[] argsForParser = new String[3];
		argsForParser[0] = sBaseDirectory;
		argsForParser[1] = sFileName;
		argsForParser[2] = sExpression;
		
		MyXPathParserFGL objParserFGL = new MyXPathParserFGL();		
		objParserFGL.startIt(argsForParser);
		
		
		} catch (Exception e) {
			e.printStackTrace(System.err);
		}

	}

}
