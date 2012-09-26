

import java.io.File;
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
	public static int sendReport1(int professorId) {
		// load from disc and call sendReport
		try {
//			Logger l = configure();
//			l.debug("TEST");
//			return 0;
			EntityManagerFactory emf = Persistence.createEntityManagerFactory("DB2");
		    EntityManager em = emf.createEntityManager();
		    ProfessorService service = new ProfessorService(em);

		    em.getTransaction().begin();
		    int r = service.createReport(professorId, DBTest.readFile().toString());
		    em.getTransaction().commit();
		    
		    em.close();
		    emf.close();
		    
		    return r;
		} catch (Exception e) {
			System.out.println(e);
			return -1;
		}
		
	}
	
	public static int sendReport3(String professorName, String professorLastName) {
		return -2;
	}
	
	public static String queryReport(String predmet, int ocena, int sifra) {
		return System.getProperty("user.dir");
	}

}
