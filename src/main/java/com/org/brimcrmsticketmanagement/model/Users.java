package com.org.brimcrmsticketmanagement.model;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Brim_Ticket_Tracking_Users")
public class Users {
	 @Id
	    @Column(name = "user_id")
	    @GeneratedValue(strategy = GenerationType.AUTO)
	    private Long id;
	 
	    private String username;
	    private String password;
	    private boolean enabled;
	    

	    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	    @JoinTable(
	            name = "Brim_Ticket_Tracking_Users_Roles",
	            joinColumns = {@JoinColumn(name="user_id")},
	            inverseJoinColumns = { @JoinColumn(name = "role_id")}
	            )
	    private Set<Roles> roles = new HashSet<>();
	    
		/*
		 * @OneToMany(cascade = CascadeType.ALL, mappedBy = "user") private
		 * List<Tickets> ticket = new ArrayList<>();
		 */
		/*
		 * @ManyToMany(mappedBy = "forwarededUsers") private Set<Tickets>
		 * forwardedTickets = new HashSet<>();
		 */
	    @OneToMany(mappedBy = "primaryKey.users",
				cascade = CascadeType.ALL)
	    private Set<BrimTicketForwarding> forwardTicket = new HashSet<BrimTicketForwarding>();
	    
	    
	    public Users() {}
		
		

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
		public boolean isEnabled() {
			return enabled;
		}
		public void setEnabled(boolean enabled) {
			this.enabled = enabled;
		}
		public Set<Roles> getRoles() {
			return roles;
		}
		public void setRoles(Set<Roles> roles) {
			this.roles = roles;
		}


		
		public Set<BrimTicketForwarding> getForwardTicket() {
			return forwardTicket;
		}



		public void setForwardTicket(Set<BrimTicketForwarding> forwardTicket) {
			this.forwardTicket = forwardTicket;
		}


		public void addForwardTicket(BrimTicketForwarding forwardTicket) {
			this.forwardTicket.add(forwardTicket);
		}
	


	


		
	    
}
