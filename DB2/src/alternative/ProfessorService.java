package alternative;

import java.util.Collection;

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
	
	public Report createReport(int professorId, String report) {
		Professor emp = em.find(Professor.class, professorId);
		Report r = new Report();
		r.setProfessor(emp);
		r.setFullReport(report);
		r.setId(getMaxReportId() + 1);
		em.persist(r);
		return r;
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
		return (Integer) query.getSingleResult();
	}
	
	
}