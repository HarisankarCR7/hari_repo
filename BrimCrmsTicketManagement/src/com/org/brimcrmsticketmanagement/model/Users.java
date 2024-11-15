package com.org.brimcrmsticketmanagement.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.hibernate.annotations.ColumnDefault;

@Entity
@Table(name = "Complains_Reg_Users")
public class Users {
	 @Id
	    @Column(name = "user_id")
	    @GeneratedValue(strategy = GenerationType.AUTO)
	    private Long id;
	 
	    private String username;
	    private String password;
	    @Column(name = "enabled")
	    @ColumnDefault(value="yes")
	    
	    private String enabled;
	    private String name;

		/*
		 * @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
		 * 
		 * @JoinTable( name = "Brim_Ticket_Tracking_Users_Roles", joinColumns =
		 * {@JoinColumn(name="user_id")}, inverseJoinColumns = { @JoinColumn(name =
		 * "role_id")} ) private Set<Roles> roles = new HashSet<>();
		 */
	    public Users() {}
		
		public Users(Long id, String username, String password, String enabled, String name) {
			super();
			this.id = id;
			this.username = username;
			this.password = password;
			this.enabled = enabled;
			this.name = name;
		}

		public Long getId() {
			return id;
		}
		public void setId(Long id) {
			this.id = id;
		}
		public String getUsername() {
			return username;
		}
		public void setUsername(String username) {
			this.username = username;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public String isEnabled() {
			return enabled;
		}
		public void setEnabled(String enabled) {
			this.enabled = enabled;
		}
	

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}
		
		
	    
}
