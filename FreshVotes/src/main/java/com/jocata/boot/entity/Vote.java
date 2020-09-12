package com.jocata.boot.entity;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "vote_tbl")
public class Vote {
	
	@EmbeddedId
	private VoteId vId;
	private Boolean upVote;
	
	public VoteId getvId() {
		return vId;
	}
	public void setvId(VoteId vId) {
		this.vId = vId;
	}
	public Boolean getUpVote() {
		return upVote;
	}
	public void setUpVote(Boolean upVote) {
		this.upVote = upVote;
	}
	
	
}
