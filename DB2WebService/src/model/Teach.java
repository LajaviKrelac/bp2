package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the teaches database table.
 * 
 */
@Entity
@Table(name="teaches")
public class Teach implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private TeachPK id;

	public Teach() {
	}

	public TeachPK getId() {
		return this.id;
	}

	public void setId(TeachPK id) {
		this.id = id;
	}

}