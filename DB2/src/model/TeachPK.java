package model;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the teaches database table.
 * 
 */
@Embeddable
public class TeachPK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(unique=true, nullable=false)
	private int cid;

	@Column(unique=true, nullable=false)
	private int sid;

	@Column(unique=true, nullable=false)
	private int id;

	public TeachPK() {
	}
	public int getCid() {
		return this.cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getSid() {
		return this.sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public int getId() {
		return this.id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof TeachPK)) {
			return false;
		}
		TeachPK castOther = (TeachPK)other;
		return 
			(this.cid == castOther.cid)
			&& (this.sid == castOther.sid)
			&& (this.id == castOther.id);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.cid;
		hash = hash * prime + this.sid;
		hash = hash * prime + this.id;
		
		return hash;
	}
}