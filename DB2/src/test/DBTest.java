package test;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Collection;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import model.Professor;
import model.Report;

import org.apache.log4j.PropertyConfigurator;

import alternative.ProfessorService;

public class DBTest {

	/**
	 * @param args
	 */
	public static void main(String[] a) throws Exception {
		if ((new File("../log4j.properties")).exists()) {
			PropertyConfigurator.configure("../log4j.properties");
		}
		PropertyConfigurator.configure("log4j.properties");
		System.out.println("1");
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("DB2");
		System.out.println("1");
	    EntityManager em = emf.createEntityManager();
	    System.out.println("2");
	    ProfessorService service = new ProfessorService(em);

//	    em.getTransaction().begin();
//	    Professor emp = service.createProfessor("Milos", "Cvetanovic");
//	    em.getTransaction().commit();
//	    System.out.println("Persisted " + emp);
	    System.out.println("3");
	    em.getTransaction().begin();
	    Collection<Professor> emps = service.findAllProfessors();
	    for (Professor e : emps)
	    	for (Report r : e.getReports()) {
//	    		System.out.println(r.getFullReport());
//	    		r.setFullReport(readFile());
	    		
	    	}
	    em.getTransaction().commit();
	    
	    em.close();
	    emf.close();
	    
	    
	    String query =
	            "for $x in doc('upload/reportexample.xml') return $x";
	    
	    RunQueries.query(query);
	    
	    //	report
	    // 		course
	    //		professor
	    // 		students
	    //			student1
	    //			student2
	  }

	private static byte[] binary() throws FileNotFoundException, IOException {
		// Make a file object from the path name
		File file=new File("src/reportexample.xml");
		// Find the size
		long size=file.length();
		// Create a buffer big enough to hold the file
		byte[] contents=new byte[(int) size];
		// Create an input stream from the file object
		FileInputStream in=new FileInputStream(file);
		// Read it all
		in.read(contents);
		// Close the file
		in.close();
		return contents;
	}
	
	public static String readFile() {
		File file = new File("src/reportexample.xml");
        StringBuffer contents = new StringBuffer();
        BufferedReader reader = null;
 
        try {
            reader = new BufferedReader(new FileReader(file));
            String text = null;
 
            // repeat until all lines is read
            while ((text = reader.readLine()) != null) {
                contents.append(text)
                        .append(System.getProperty(
                                "line.separator"));
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (reader != null) {
                    reader.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
 
        // show file contents here
        return contents.toString();
	}

}
