package com.org.brimcrmsticketmanagement.config;

import org.springframework.security.web.context.AbstractSecurityWebApplicationInitializer;

/**
 * Spring Web MVC Security Java Config Demo Project
 * Bootstraps Spring Security Filter.
 * 
 * @author www.codejava.net
 *
 */
public class SecurityWebApplicationInitializer extends AbstractSecurityWebApplicationInitializer {

	public SecurityWebApplicationInitializer() {
		super(SecurityConfig.class);
	}

}
