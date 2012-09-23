package model;
//
//import java.io.Serializable;
//import javax.persistence.*;
//import java.util.List;
//
//
///**
// * The persistent class for the professor database table.
// * 
// */
//@Entity
//@Table(name="professor")
//public class Professor implements Serializable {
//	private static final long serialVersionUID = 1L;
//
//	@Id
//	private int id;
//
//	private String lname;
//
//	private String name;
//
//	//bi-directional many-to-one association to Report
//	@OneToMany(mappedBy="professorId", fetch=FetchType.EAGER)
//	private List<Report> reports;
//
//	public Professor() {
//	}
//
//	public int getId() {
//		return this.id;
//	}
//
//	public void setId(int id) {
//		this.id = id;
//	}
//
//	public String getLname() {
//		return this.lname;
//	}
//
//	public void setLname(String lname) {
//		this.lname = lname;
//	}
//
//	public String getName() {
//		return this.name;
//	}
//
//	public void setName(String name) {
//		this.name = name;
//	}
//
//	public List<Report> getReports() {
//		return this.reports;
//	}
//
//	public void setReports(List<Report> reports) {
//		this.reports = reports;
//	}
//
//}