package model;

import java.io.Serializable;
import java.sql.SQLXML;

import javax.persistence.*;


/**
 * The persistent class for the report database table.
 * 
 */
@Entity
@Table(name="report")
public class Report implements Serializable {
	private static final long serialVersionUID = 1L;
	private int id;
	private String fullReport;
	private Professor professor;

	public Report() {
	}


	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(unique=true, nullable=false)
	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}


	@Lob
	@Column(name="full_report")
	public String getFullReport() {
		return this.fullReport;
	}

	public void setFullReport(String fullReport) {
		this.fullReport = fullReport;
	}


	//bi-directional many-to-one association to Professor
	@ManyToOne
	@JoinColumn(name="professorId", nullable=false)
	public Professor getProfessor() {
		return this.professor;
	}

	public void setProfessor(Professor professor) {
		this.professor = professor;
	}

}