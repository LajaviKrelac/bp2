package alternative;

import java.util.Collection;
import java.util.Random;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import model.Professor;
import model.Report;

public class ProfessorService {
	protected EntityManager em;

	public ProfessorService(EntityManager em) {
		this.em = em;
	}

	public Professor createProfessor(int id, String name, String lastname) {
		Professor emp = new Professor();
		emp.setLname(name);
		emp.setName(lastname);
		emp.setId(id);
		em.persist(emp);
		return emp;
	}

	public Professor createProfessor(String name, String lastname) {
		Professor emp = new Professor();
		emp.setLname(lastname);
		emp.setName(name);
		emp.setId(getMaxId() + 1);
		em.persist(emp);
		return emp;
	}
	
	public int createReport(int professorId, String report) {
//		Professor emp = em.find(Professor.class, professorId);
//		Report r = new Report();
//		r.setProfessor(emp);
//		r.setFullReport(report);
//		r.setId(getMaxReportId() + 1);
////		em.merge(r);
//		em.persist(r);
		int id = getMaxReportId() + 1;
		em.createNativeQuery("INSERT INTO report(id, professorId, full_report) " +
			    "       VALUES(?, ?,?)")
			      .setParameter(1, id).setParameter(2, professorId).setParameter(3, report)
			      .executeUpdate();
		
		return id;
	}

	public void removeProfessor(int id) {
		Professor emp = findProfessor(id);
		if (emp != null) {
			em.remove(emp);
		}
	}

	public Professor findProfessor(int id) {
		return em.find(Professor.class, id);
	}

	public Collection<Professor> findAllProfessors() {
		Query query = em.createQuery("SELECT e FROM Professor e");
		return query.getResultList();
	}

	public int getMaxId() {
		Query query = em.createQuery("SELECT MAX(e.id) FROM Professor e");
		return (Integer) query.getSingleResult();
	}
	
	public int getMaxReportId() {
		Query query = em.createQuery("SELECT MAX(e.id) FROM Report e");
		Integer r = (Integer) query.getSingleResult();
		if (r != null)
		return (Integer) r;
		else return 1;
	}
	
	public Report findReport(int id) {
		return em.find(Report.class, id);
	}
	
	
}

// MOJ PROFESSOR SERVICE