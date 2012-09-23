package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the professor database table.
 * 
 */
@Entity
@Table(name="professor")
public class Professor implements Serializable {
	private static final long serialVersionUID = 1L;
	private int id;
	private String lname;
	private String name;
	private List<Report> reports;

	public Professor() {
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


	@Column(length=256)
	public String getLname() {
		return this.lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}


	@Column(length=256)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}


	//bi-directional many-to-one association to Report
	@OneToMany(mappedBy="professor", fetch=FetchType.EAGER)
	public List<Report> getReports() {
		return this.reports;
	}

	public void setReports(List<Report> reports) {
		this.reports = reports;
	}

}