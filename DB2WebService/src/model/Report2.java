package model;

//import java.io.Serializable;
//
//import javax.persistence.Entity;
//import javax.persistence.Id;
//import javax.persistence.JoinColumn;
//import javax.persistence.ManyToOne;
//import javax.persistence.Table;
//
//
///**
// * The persistent class for the professor database table.
// * 
// */
//@Entity
//@Table(name="report")
//public class Report implements Serializable {
//	private static final long serialVersionUID = 1L;
//
//	@Id
//	private int id;
//
//	private String full_report;
//
//	private Professor professorId;
//	
//
//	public void setProfessorId(Professor professor) {
//		this.professorId = professor;
//	}
//
//	@ManyToOne
//	@JoinColumn(name="professorId", nullable=false)
//    public Professor getProfessorId() {
//		return this.professorId;
//	}
//
//	public int getId() {
//		return id;
//	}
//
//	public void setId(int id) {
//		this.id = id;
//	}
//
//	public String getFullReport() {
//		return full_report;
//	}
//
//	public void setFullReport(String fullReport) {
//		this.full_report = fullReport;
//	}
//
//	
//
//	
//
//}