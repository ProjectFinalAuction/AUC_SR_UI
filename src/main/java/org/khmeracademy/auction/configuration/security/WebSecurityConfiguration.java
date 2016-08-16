package org.khmeracademy.auction.configuration.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;

@Configuration
@EnableWebSecurity
public class WebSecurityConfiguration extends WebSecurityConfigurerAdapter {
	
	@Autowired
	@Qualifier(value="CustomUserDetailService")
	private UserDetailsService userDetailsService;
	
	@Autowired
	@Qualifier("ajaxAuthenticationFailureHandler")
	private AjaxAuthenticationFailureHandler ajaxAuthenticationFailureHandler;
	
	@Autowired
	@Qualifier("ajaxAuthenticationSuccessHandler")
	private AjaxAuthenticationSuccessHandler ajaxAuthenticationSuccessHandler;
	
	@Autowired
	protected void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		/*auth.inMemoryAuthentication().withUser("admin").password("123").roles("ADMIN");
		auth.inMemoryAuthentication().withUser("user").password("123").roles("USER");
		auth.inMemoryAuthentication().withUser("dba").password("123").roles("ADMIN", "USER" , "DBA");
		auth.inMemoryAuthentication().withUser("dev").password("dev").roles("DEVELOPER");*/
		
		auth.userDetailsService(userDetailsService);
		
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.authorizeRequests()
			.antMatchers("/" , "/index" , "/about", "/contact", "/ui-itemlist", "error/**" ).permitAll()
			.antMatchers("/admin/**").hasRole("ADMIN");
			
		http
		.formLogin()
		.loginPage("/login")
		.usernameParameter("username")
		.passwordParameter("password")
		.successHandler(ajaxAuthenticationSuccessHandler)
		.failureHandler(ajaxAuthenticationFailureHandler)
		.permitAll();
		
		http
		.logout()
		.logoutUrl("/logout")
		.logoutSuccessUrl("/login?logout")
		.invalidateHttpSession(true)
		.deleteCookies("JESSIONID")
		.permitAll();	
		
		http
		.exceptionHandling()
		.accessDeniedPage("/access-denied");
		
		http.csrf().disable();
	}
	
//	@Bean
//	public PasswordEncoder passwordEncoder(){
//		return new BCryptPasswordEncoder();
//	}
}
