package com.org.brimcrmsticketmanagement.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.springframework.security.core.userdetails.User;
@Entity
@Table(name = "Brim_Ticket_Tracking_Roles")
public class Roles {
	 @Id
	    @Column(name = "role_id")
	    @GeneratedValue(strategy = GenerationType.AUTO)
	    private Integer id;
	 @Column(name = "role_name")
	    private String name;
	 @ManyToMany(mappedBy = "roles")
	    private Set<Users> Users = new HashSet<>();
	 public Roles() {}
	public Roles(Integer id, String name, Set<com.org.brimcrmsticketmanagement.model.Users> users) {
		super();
		this.id = id;
		this.name = name;
		Users = users;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Set<Users> getUsers() {
		return Users;
	}
	public void setUsers(Set<Users> users) {
		Users = users;
	}
	
		    
	
}
