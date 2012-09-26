package service;


import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.util.Collection;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import model.Professor;
import model.Report;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

import alternative.ProfessorService;
import test.DBTest;
import test.RunQueries;

public class SendReport {

	public SendReport() {
		
	}
	
	public static int sendReport2(int professorId, String report) {
		return 0;
	}
	
	public static int zbir(int a, int b) {
		return a + b + 5;
	}
	
	public static Logger configure() {
		try {
			//
			if ((new File("../log4j.properties")).exists()) {
				PropertyConfigurator.configure("../log4j.properties");
			}
			PropertyConfigurator.configure("log4j.properties");
			return Logger.getLogger(SendReport.class.getSimpleName());
		} catch (Exception e) {
			return null;
		}
	}
	public static String sendReport1(int professorId) {
		System.setProperty("java.library.path", System.getProperty("java.library.path") +p);
		Logger l = configure();
		// load from disc and call sendReport
		try {
			l.debug("MOJ SEND REPORT****************************************************************");
//			return 0;
			EntityManagerFactory emf = Persistence.createEntityManagerFactory("DB2");
		    EntityManager em = emf.createEntityManager();
		    ProfessorService service = new ProfessorService(em);

		    em.getTransaction().begin();
		    int r = service.createReport(professorId, DBTest.readFile().toString());
		    em.getTransaction().commit();
		    
		    em.close();
		    emf.close();
		    
		    return Integer.toString(r);
		} catch (Exception e) {
			l.error(e, e);
			return Integer.toString(-1);
		}
		
	}
	
	public static int sendReport3(String professorName, String professorLastName) {
		return -2;
	}
	
	public static String queryReport(String predmet, int ocena, int sifra) {
		
		System.setProperty("java.library.path", System.getProperty("java.library.path") +p);
		Logger l = configure();
		
	    try {
			EntityManagerFactory emf = Persistence.createEntityManagerFactory("DB2");
		    EntityManager em = emf.createEntityManager();
		    ProfessorService service = new ProfessorService(em);

		    em.getTransaction().begin();
		    Report r = service.findReport(sifra);
		    em.getTransaction().commit();
		    
		    String filename = ""+sifra+"-"+ System.currentTimeMillis() + ".xml";
		    
		    BufferedWriter out = new BufferedWriter(new FileWriter(filename));
		    out.write(r.getFullReport());
		    out.close();
		    
			
//		    String query = "for $x in doc('upload/reportexample.xml') return $x";
//		    String query = "for $x in doc('" + filename + "') return $x";
		    String query = "for $x in doc('" + filename + "')/report return $x";
		    
		    String s = RunQueries.query(query);
		    return s;
	    } catch (Exception e) {
	    	l.error(e, e);
			return "ERROR_OCCURED";
	    }
	    
		
	}
private static final String p = ";C:\\Program Files (x86)\\Microsoft JDBC Driver 4.0 for SQL Server\\sqljdbc_4.0\\enu\\auth\\x86";
}
