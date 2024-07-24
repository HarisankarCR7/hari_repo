package com.org.brimcrmsticketmanagement.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 * Spring Web MVC Security Java Config Demo Project
 * Configures authentication and authorization for the application.
 * 
 * @author www.codejava.net
 *
 */
@Configuration
@EnableWebSecurity
@ComponentScan("com.org.brimcrmsticketmanagement")
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	@Autowired
  AuthenticationService authenticationService;
	@Autowired
	SimpleAuthenticationSuccessHandler simpleAuthSuccessHandler;
	
    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		
		/*
		 * auth .inMemoryAuthentication()
		 * .withUser("admin").password("nimda").roles("ADMIN");
		 */
		 
     // For User in database.
        auth.userDetailsService(authenticationService).passwordEncoder(bCryptPasswordEncoder());
       
    }
    @Override public void configure(WebSecurity web) throws Exception { web
  	  .ignoring() .antMatchers("/resources/**"); // #3 
  	  }
    
    @Override
    protected void configure(HttpSecurity http) throws Exception {
    	String[] resources = new String[]{
                "/", "/resources/**","/loginPage"
        };
		/* .antMatchers("/admin**").access("hasRole('ADMIN')") */
      http.authorizeRequests()
        .antMatchers(resources).permitAll()
        .anyRequest().authenticated()
        .and().formLogin()
        .loginPage("/loginPage").successHandler(simpleAuthSuccessHandler)
        //.defaultSuccessUrl("/homePage", true)
         .failureUrl("/loginPage?error=true").and()
         .sessionManagement()
         .maximumSessions(1)
         .expiredUrl("/loginPage")
         .maxSessionsPreventsLogin(false)
         .and()
         .sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED)
         .invalidSessionUrl("/loginPage");
      
      http.csrf().disable();
    }  
    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }
	
	  
	 
}
