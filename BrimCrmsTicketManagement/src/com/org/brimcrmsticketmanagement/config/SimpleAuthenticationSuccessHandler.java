package com.org.brimcrmsticketmanagement.config;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
@Configuration
public class SimpleAuthenticationSuccessHandler  implements AuthenticationSuccessHandler {
private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest arg0, HttpServletResponse arg1, Authentication authentication)
			throws IOException, ServletException {
		
		/*
		 * Collection<? extends GrantedAuthority> authorities =
		 * authentication.getAuthorities(); authorities.forEach(authority -> {
		 * System.out.println("role listing");
		 * if(authority.getAuthority().equals("ROLE_ADMIN")) { try {
		 * redirectStrategy.sendRedirect(arg0, arg1, "/home"); } catch (Exception e) {
		 * // TODO Auto-generated catch block e.printStackTrace(); } } else
		 * if(authority.getAuthority().equals("ROLE_RCMS")) { try {
		 * redirectStrategy.sendRedirect(arg0, arg1, "/rcms"); } catch (Exception e) {
		 * // TODO Auto-generated catch block e.printStackTrace(); } } else
		 * if(authority.getAuthority().equals("ROLE_EXECUTIVE")) { try {
		 * redirectStrategy.sendRedirect(arg0, arg1, "/execcutive"); } catch (Exception
		 * e) { // TODO Auto-generated catch block e.printStackTrace(); } } else
		 * if(authority.getAuthority().equals("ROLE_CUSTOMERCARE")) { try {
		 * redirectStrategy.sendRedirect(arg0, arg1, "/customercare"); } catch
		 * (Exception e) { // TODO Auto-generated catch block e.printStackTrace(); }
		 * }else { throw new IllegalStateException(); } });
		 */
	//	arg0.getSession(false).setMaxInactiveInterval(600);
		//System.out.println("into auth success handler");
		redirectStrategy.sendRedirect(arg0, arg1, "/homePage"); 
		
	}

}
