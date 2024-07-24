package com.org.brimcrmsticketmanagement.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement(proxyTargetClass = true)
@PropertySource("classpath:application.properties")
@ComponentScan("com.org.brimcrmsticketmanagement")
public class DatabaseConfig {
	@Autowired
	Environment env;

	@Bean(name = "loginDbDatasource")
	public DataSource logingetDataSource() {
		BasicDataSource dataSource1 = new BasicDataSource();
		dataSource1.setDriverClassName(env.getProperty("jdbc.driver"));
		dataSource1.setUrl(env.getProperty("jdbc.url"));
		dataSource1.setUsername(env.getProperty("jdbc.username"));
		dataSource1.setPassword(env.getProperty("jdbc.password"));
		return dataSource1;
	}

	@Bean(name = "othersDbDatasource")
	public DataSource detailsgetDataSource() {
		BasicDataSource dataSource2 = new BasicDataSource();
		dataSource2.setDriverClassName(env.getProperty("details.jdbc.driver"));
		dataSource2.setUrl(env.getProperty("details.jdbc.url"));
		dataSource2.setUsername(env.getProperty("details.jdbc.username"));
		dataSource2.setPassword(env.getProperty("details.jdbc.password"));
		return dataSource2;
	}
	@Bean(name = "ticketingDbDatasource")
	public DataSource ticketingGetDataSource() {
		BasicDataSource dataSource2 = new BasicDataSource();
		dataSource2.setDriverClassName(env.getProperty("ticket.jdbc.driver"));
		dataSource2.setUrl(env.getProperty("ticket.jdbc.url"));
		dataSource2.setUsername(env.getProperty("ticket.jdbc.username"));
		dataSource2.setPassword(env.getProperty("ticket.jdbc.password"));
		return dataSource2;
	}

	// .....Hibernate Configuration...........


	@Bean
	public LocalSessionFactoryBean sessionFactory() {
		LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
		sessionFactory.setDataSource(ticketingGetDataSource());
		sessionFactory.setPackagesToScan(new String[] { "com.org.brimcrmsticketmanagement.model"});
		sessionFactory.setHibernateProperties(hibernateProperties());
		return sessionFactory;
	}

	/*
	 * @Bean public DataSource dataSource() { DriverManagerDataSource dataSource =
	 * new DriverManagerDataSource();
	 * dataSource.setDriverClassName(environment.getRequiredProperty(
	 * "jdbc.driverClassName"));
	 * dataSource.setUrl(environment.getRequiredProperty("jdbc.url"));
	 * dataSource.setUsername(environment.getRequiredProperty("jdbc.username"));
	 * dataSource.setPassword(environment.getRequiredProperty("jdbc.password"));
	 * return dataSource; }
	 */

	private Properties hibernateProperties() {
		Properties properties = new Properties();
		properties.put("hibernate.dialect", env.getRequiredProperty("hibernate.dialect"));
		properties.put("hibernate.show_sql", env.getRequiredProperty("hibernate.show_sql"));
		properties.put("hibernate.format_sql", env.getRequiredProperty("hibernate.format_sql"));
		properties.put("hibernate.hbm2ddl.auto", env.getRequiredProperty("hibernate.hbm2ddl.auto"));
		properties.put("hibernate.enable_lazy_load_no_trans", env.getRequiredProperty("hibernate.enable_lazy_load_no_trans"));
		return properties;
	}

	@Bean
	public HibernateTransactionManager getTransactionManager() {
		HibernateTransactionManager transactionManager = new HibernateTransactionManager();
		transactionManager.setSessionFactory(sessionFactory().getObject());
		return transactionManager;
	}
	// .....Hibernate Configuration end......

	/*
	 * @Autowired
	 * 
	 * @Bean(name = "transactionManager") public DataSourceTransactionManager
	 * getTransactionManager(@Qualifier("loginDb") DataSource dataSource) {
	 * DataSourceTransactionManager transactionManager = new
	 * DataSourceTransactionManager(dataSource);
	 * 
	 * return transactionManager; }
	 */
	/*
	 * @Bean(name = "loginJdbcTemplate") public JdbcTemplate
	 * loginJdbcTemplate(@Qualifier("loginDbDatasource") DataSource dsPostgres) {
	 * return new JdbcTemplate(dsPostgres); }
	 * 
	 * @Bean(name = "othersJdbcTemplate") public JdbcTemplate
	 * detailsJdbcTemplate(@Qualifier("othersDbDatasource") DataSource dsPostgres) {
	 * return new JdbcTemplate(dsPostgres); }
	 */

}
