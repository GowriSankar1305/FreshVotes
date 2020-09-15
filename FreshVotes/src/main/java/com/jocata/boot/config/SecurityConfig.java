package com.jocata.boot.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.jocata.boot.utils.Roles;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private CustomUserDetailsService userDetailsService;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService).passwordEncoder(getPassEncoder());
	}
	
	@Bean
	public BCryptPasswordEncoder getPassEncoder()	{
		return new BCryptPasswordEncoder();
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
		.antMatchers("/superadmin/**").hasRole(Roles.SUPERADMIN)
		.antMatchers("/admin/**").hasAnyRole(Roles.SUPERADMIN,Roles.ADMIN)
		.antMatchers("/user/**").hasAnyRole(Roles.SUPERADMIN,Roles.ADMIN,Roles.USER)
		.antMatchers("/static/**").permitAll()
		.antMatchers("/","/login","/register","/validateEmail","/validateUname").permitAll()
		.antMatchers("/**").authenticated()
		.and().formLogin().loginPage("/login").failureUrl("/login?error")
		.defaultSuccessUrl("/dashboard").and()
		.logout().logoutSuccessUrl("/login?logout")
		.invalidateHttpSession(true).deleteCookies("JSESSIONID")
		.and().sessionManagement().maximumSessions(1).expiredUrl("/login?expired")
		.and().invalidSessionUrl("/login?invalid");
	}
}
