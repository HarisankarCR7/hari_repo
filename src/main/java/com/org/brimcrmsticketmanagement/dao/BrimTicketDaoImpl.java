package com.org.brimcrmsticketmanagement.dao;

import java.sql.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.org.brimcrmsticketmanagement.model.Tickets;

@Repository
public class BrimTicketDaoImpl implements BrimTicketDao {

    @Autowired
    private SessionFactory sessionFactory;

/*    @Override
    public List<Tickets> getAllTickets() {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("from Tickets").list();
    }

    @Override
    public List<Tickets> searchTickets(String searchQuery) {             
        Session session = sessionFactory.getCurrentSession();
        String hql = "from Tickets t where t.center like :searchQuery or t.module like :searchQuery or t.userName like :searchQuery or t.TicketNumber like :searchQuery or t.crmTicketNo like :searchQuery or t.status like :searchQuery";
        Query query = session.createQuery(hql);
        query.setParameter("searchQuery", "%" + searchQuery + "%");
        return query.list();
    }
    */
    
    @Override
    public List<Tickets> getTickets(Date fromDate, Date toDate, String status, String center) {
        Session session;
        try {
            session = sessionFactory.getCurrentSession();
        } catch (HibernateException e) {
            session = sessionFactory.openSession();
        }

        try {
            System.out.println("database welcome");

           
            StringBuilder UserQuery = new StringBuilder("FROM Tickets b WHERE convert(date, b.loginTime) >= :fromDate AND convert(date, b.loginTime) <= :toDate");

           
            if (status != null && !status.isEmpty()) {
                UserQuery.append(" AND b.status = :status");
            }
            if (center != null && !center.isEmpty()) {
                UserQuery.append(" AND b.center = :center");
            }
               
    		if (status != null && !status.isEmpty() && center != null && !center.isEmpty()) {
                UserQuery.append(" AND b.status = :status AND b.center = :center");
            }  
    		
            Query query = session.createQuery(UserQuery.toString());
            query.setParameter("fromDate", fromDate);
            query.setParameter("toDate", toDate);

            
            if (status != null && !status.isEmpty()) {
                query.setParameter("status", status);
            }
            if (center != null && !center.isEmpty()) {
                query.setParameter("center", center);
            }

            List<Tickets> tickets = query.list();
            System.out.println("database: " + tickets);
            return tickets;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    @Override
    public List<String> getDistinctCenters() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("SELECT DISTINCT t.center FROM Tickets t");
        return query.list();
    }
}