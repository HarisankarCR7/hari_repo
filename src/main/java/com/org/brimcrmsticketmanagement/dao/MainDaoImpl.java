package com.org.brimcrmsticketmanagement.dao;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.type.StandardBasicTypes;
import org.json.simple.JSONArray;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.org.brimcrmsticketmanagement.model.BrimTicketForwarding;
import com.org.brimcrmsticketmanagement.model.BrimTicketTrackingLog;
import com.org.brimcrmsticketmanagement.model.CafDetails;
import com.org.brimcrmsticketmanagement.model.Tickets;
import com.org.brimcrmsticketmanagement.model.Users;

@Repository
public class MainDaoImpl implements MainDao {
	/*
	 * private JdbcTemplate jdbcTemplate;
	 * 
	 * @Autowired public void setDataSource(@Qualifier("othersDb") DataSource
	 * dataSource) { this.jdbcTemplate = new JdbcTemplate(dataSource); }
	 */
	/*
	 * @Autowired
	 * 
	 * @Qualifier("othersJdbcTemplate")
	 */

	private JdbcTemplate jdbcTemplate;
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<JSONArray> getCenter(String region) {

		String sql = "select distinct center from  crms.dbo.CaftrackingCourierDetails where region IN (:regions)";
		JSONArray centerArr = new JSONArray();
		ObjectMapper mapper = new ObjectMapper();
		List<String> regionList = new ArrayList<String>();

		try {

			regionList = Arrays.asList(mapper.readValue(region, String[].class));

			Map<String, Object> regionMap = Collections.singletonMap("regions", regionList);
			NamedParameterJdbcTemplate jdbctemplate = new NamedParameterJdbcTemplate(jdbcTemplate.getDataSource());
			List<Map<String, Object>> rows = jdbctemplate.queryForList(sql, regionMap);
			for (Map<String, Object> row : rows) {
				// String center = row.get("center").toString();
				centerArr.add(row.get("center").toString());
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return centerArr;
	}

	@Override
	public List getRegion() {
		String sql = "select distinct region from  crms.dbo.CaftrackingCourierDetails where status='send'";
		JSONArray regionArr = new JSONArray();
		ObjectMapper mapper = new ObjectMapper();
		List<String> regionList = new ArrayList<String>();

		try {

			// regionList = Arrays.asList(mapper.readValue(data, String[].class));
			// Map regionMap = Collections.singletonMap("regions", regionList);
			// NamedParameterJdbcTemplate jdbctemplate = new
			// NamedParameterJdbcTemplate(this.jdbcTemplate.getDataSource());
			List<Map<String, Object>> rows = jdbcTemplate.queryForList(sql);
			for (Map<String, Object> row : rows) {
				String region = row.get("region").toString();
				regionArr.add(row.get("region").toString());
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return regionArr;
	}

	/*
	 * @Override public String getCafDetails(String cafNo) { // TODO Auto-generated
	 * method stub JSONArray jArray = new JSONArray(); String jsonText="";
	 * 
	 * try { String
	 * sql="select addressmerged,subCode,caf_no,name,currentContactNo,email,activatedOn,status from crms.dbo.cafDetailsTracking  where caf_no=?"
	 * ; NamedParameterJdbcTemplate jdbctemplate = new
	 * NamedParameterJdbcTemplate(jdbcTemplate.getDataSource()); List<Map<String,
	 * Object>> rows = jdbcTemplate.queryForList(sql, new Object[] { cafNo});
	 * 
	 * 
	 * for (Map<String, Object> row : rows) { JsonObject obj= new JsonObject();
	 * 
	 * obj.addProperty("address",row.get("addressmerged").toString() );
	 * obj.addProperty("Subcode", row.get("subCode").toString());
	 * obj.addProperty("cafno", row.get("caf_no").toString());
	 * obj.addProperty("Name", row.get("name").toString()); obj.addProperty("Phone",
	 * row.get("currentContactNo").toString()); obj.addProperty("ActivateDate",
	 * row.get("activatedOn").toString()); obj.addProperty("Email",
	 * row.get("email").toString()); obj.addProperty("Status",
	 * row.get("status").toString()); jArray.add((Object) obj);
	 * 
	 * } jsonText = JSONValue.toJSONString((Object) jArray); return jsonText; }
	 * catch (Exception e) { // TODO: handle exception
	 * System.out.println("Error in gettting cafdetails" + e); return jsonText; } }
	 */
	@Override
	public String getDispatchedCouriers(String center) {
		// TODO Auto-generated method stub
		JSONArray jArray = new JSONArray();
		String jsonText = "";
		ObjectMapper mapper = new ObjectMapper();

		List<String> centerList = new ArrayList<String>();

		try {
			centerList = Arrays.asList(mapper.readValue(center, String[].class));
			Map<String, Object> centerMap = Collections.singletonMap("center", centerList);
			String sql = "select * from crms.dbo.[CaftrackingCourierDetails]  where center IN (:center) and status='send'";
			NamedParameterJdbcTemplate jdbctemplate = new NamedParameterJdbcTemplate(jdbcTemplate.getDataSource());
			List<Map<String, Object>> rows = jdbctemplate.queryForList(sql, centerMap);

			for (Map<String, Object> row : rows) {
				JsonObject obj = new JsonObject();

				obj.addProperty("id", row.get("Id").toString());
				obj.addProperty("CourierNo", row.get("CourierNo").toString());
				obj.addProperty("CourierName", row.get("CourierName").toString());
				obj.addProperty("TrackingNo", row.get("TrackingNo").toString());
				obj.addProperty("NoofCafDispatched", row.get("NoofCafDispatched").toString());
				System.out.println("caourir dispatched time" + row.get("DateAndTime").toString());
				obj.addProperty("DateAndTime", row.get("DateAndTime").toString());
				obj.addProperty("FromPerson", row.get("FromPerson").toString());
				obj.addProperty("ToPerson", row.get("ToPerson").toString());
				obj.addProperty("status", row.get("status").toString());
				obj.addProperty("region", row.get("region").toString());
				obj.addProperty("center", row.get("center").toString());
				jArray.add((Object) obj);

			}
			jsonText = JSONValue.toJSONString((Object) jArray);
			return jsonText;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error in gettting cafdetails" + e);
			return jsonText;
		}
	}

	@Override
	public List<CafDetails> getDispatchedCafs(int courierId) {
		String sql = "select cz.caf_id,cz.caf_no,c.subCode,c.division,c. name,c.landmark,c.pincode,c. phone,c. mobile,c.currentContactNo,c.email,c.region,c.area,c.activatedOn,"
				+ "c.status,"
				+ "c.mac,c.subStatus,c.serviceAmo,c.centerId,c.cafStatus,c.cafDate,c.dispatchStatus,c.courierID from dbo.cafDetailsTracking as c join dbo.CafZenithTracking as cz on c.subcode=cz.sap_bp_id where c.courierID=?";

		List<CafDetails> cafDetailsList = new ArrayList<CafDetails>();
		try {

			cafDetailsList = jdbcTemplate.query(sql, new Object[] { courierId },
					new BeanPropertyRowMapper(CafDetails.class));

			return cafDetailsList;

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error in getting caflist" + e.getMessage());
			return cafDetailsList;
		}

	}

	@Override
	public List<CafDetails> getCafDetails(String cafNo) {
		System.out.println("inside getting cafDetails method");

		String sql = "select cz.caf_id,cz.caf_no,c.subCode,c.division,c. name,c.landmark,c.pincode,c. phone,c. mobile,c.currentContactNo,c.email,c.region,c.area,c.activatedOn,"
				+ "c.status,"
				+ "c.mac,c.subStatus,c.serviceAmo,c.centerId,c.cafStatus,c.cafDate,c.dispatchStatus,c.courierID,c.addressMerged,c.houseNo,c.street,c.state,c.country from dbo.cafDetailsTracking as c join dbo.CafZenithTracking as cz on c.subcode=cz.sap_bp_id where cZ.CAF_NO=?";

		List<CafDetails> cafDetailsList = new ArrayList<CafDetails>();
		try {

			cafDetailsList = jdbcTemplate.query(sql, new Object[] { cafNo },
					new BeanPropertyRowMapper(CafDetails.class));

			return cafDetailsList;

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error in getting caflist" + e.getMessage());
			return cafDetailsList;
		}
	}

	@Override
	public List<Map<String, Object>> getCafVerificationStatus() {

		String sql = "select distinct status from crms.dbo.CafVerificationStatus";

		List<Map<String, Object>> statusList = null;
		try {

			statusList = jdbcTemplate.queryForList(sql);
			return statusList;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error in getting cafverificationstatus" + e.getMessage());
			return statusList;
		}
	}

	@Override
	public List<Map<String, Object>> getCourierDetails(String courierId) {
		String sql = "select c.CourierNo,c.CourierName,c.TrackingNo,c.FromPerson,c.center from CaftrackingCourierDetails c  where c.id=?";
		List<Map<String, Object>> courierDetails = null;
		try {

			courierDetails = jdbcTemplate.queryForList(sql, new Object[] { courierId });

			return courierDetails;

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error in getting Courier Details" + e.getMessage());
			return courierDetails;
		}
	}

	@Override
	public int courierAcknowledgement(String courierId, String comments) {
		// TODO Auto-generated method stub
		int count = 0;
		try {

			String SQL = "update [CRMS].[dbo].[CaftrackingCourierDetails] set status = ?,comments= ?  where id = ?";
			count = jdbcTemplate.update(SQL, "Acknowledged", comments, courierId);
			return count;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Error in getting Courier Details" + e.getMessage());
			return count;
		}

	}

	@Override
	public List<Tickets> getPendingTickets(List<String> roles) {
		JSONArray jArray = new JSONArray();
		String jsonText = "";
		ObjectMapper mapper = new ObjectMapper();
		List<Tickets> tickets = null;
		try {
			// String sql="select * from crms.dbo.[CaftrackingCourierDetails] where
			// status='send'";
			// NamedParameterJdbcTemplate jdbctemplate = new
			// NamedParameterJdbcTemplate(jdbcTemplate.getDataSource());
			// List<Map<String, Object>> rows = jdbcTemplate.queryForList(sql);

			/*
			 * for (Map<String, Object> row : rows) { JsonObject obj= new JsonObject();
			 * 
			 * obj.addProperty("id",row.get("Id").toString() ); obj.addProperty("CourierNo",
			 * row.get("CourierNo").toString()); obj.addProperty("CourierName",
			 * row.get("CourierName").toString()); obj.addProperty("TrackingNo",
			 * row.get("TrackingNo").toString()); obj.addProperty("NoofCafDispatched",
			 * row.get("NoofCafDispatched").toString()); obj.addProperty("DateAndTime",
			 * row.get("DateAndTime").toString()); obj.addProperty("FromPerson",
			 * row.get("FromPerson").toString()); obj.addProperty("ToPerson",
			 * row.get("ToPerson").toString()); obj.addProperty("status",
			 * row.get("status").toString()); obj.addProperty("region",
			 * row.get("region").toString()); obj.addProperty("center",
			 * row.get("center").toString()); jArray.add((Object) obj);
			 * 
			 * } jsonText = JSONValue.toJSONString((Object) jArray);
			 */

			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("select t from Tickets t where t.status = :status");
			// System.out.println(roles.get(0));
			if (roles.size() > 1) {
			}

			else if (roles.get(0).equals("intern")) {
				System.out.println("Status has been set");
				query.setParameter("status", "L1-Pending");
			} else if (roles.get(0).equals("vendor")) {
				System.out.println("Status has been set");
				query.setParameter("status", "L1-Pending");
			} else if (roles.get(0).equals("super_admin")) {
				System.out.println("Status has been set");
				query.setParameter("status", "L1-Pending");
			}
			// query.setParameter("status", "pending");
			tickets = query.list();
			// System.out.println("JSON String \n" + jsonText);

			return tickets;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("Error in gettting cafdetails" + e);
			return tickets;
		}
	}

	@Override
	public List<Tickets> getTicketDetails(String ticketNo, Long currentUser) {
		 List<Tickets> ticketDetails = new ArrayList<Tickets>();
		String ticketStatus = "";
		Query query = null;
		System.out.println("Into get ticket details dao" + ticketNo + currentUser );
		try {
			Session session = sessionFactory.getCurrentSession();
			ticketStatus = (String) session
					.createQuery("select t.status from Tickets t where t.ticketNo = :ticketNumber")
					.setParameter("ticketNumber", ticketNo).uniqueResult();

			if (ticketStatus.equals("Forwarded")) {
				//SQLQuery query1 = session.createSQLQuery("");
				SQLQuery query1 = session.createSQLQuery(
						"select {t.*},u.username as forwardedby,br.comments as forwardcomments,br.forward_time as forwardtime from brim_ticket t join Brim_Ticket_Forwarding br on t.autoId=br.ticket_id join Brim_Ticket_Tracking_Users u on  u.user_id = br.forwardBy where t.TicketNumber = :ticketNumber and br.user_id = :toUser");
				query1.setParameter("ticketNumber", ticketNo);
				query1.setParameter("toUser", currentUser);
				query1.addEntity("t",Tickets.class);
				query1.addScalar("forwardedby", StandardBasicTypes.STRING);
				query1.addScalar("forwardcomments",StandardBasicTypes.STRING);
				query1.addScalar("forwardtime",StandardBasicTypes.STRING);
				List<Object[]> objectList = query1.list();
				final List<Tickets> ticketList = new ArrayList<Tickets>() ;
				objectList.stream().forEach((record) ->{
					 Tickets ticketobj = (Tickets) record[0];
					String forwardedBy = (String) record[1];
					String forwardComments = (String) record[2];
					String forwardTime = (String) record[3];
					//System.out.println("Getting ticketdetails for forward case \n" + ticketobj.getCrmTicketNo() +"\n forwarded by" + forwardedBy);
					ticketobj.setForwardedBy(forwardedBy);
					ticketobj.setForwardComments(forwardComments);
					ticketobj.setForwardedTime(forwardTime);
					ticketList.add(ticketobj);
				});
				for(Tickets obj : ticketList) {
					ticketDetails.add(obj);
				}
					

			} else {
				query = session.createQuery("select t from Tickets t where t.ticketNo = :ticketNumber");
				query.setParameter("ticketNumber", ticketNo);
				ticketDetails = query.list();
			}

			
			for (Tickets t : ticketDetails) {
				System.out.println("Forwared by user" + t.getForwardedBy());
			}
			return ticketDetails;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public void updateTicketStatus(Tickets ticket) {
//System.out.println(ticket.getId() +"," + ticket.getStatusUpdate() + "," + ticket.getTicketNo());
		try {
			if (ticket.getStatusUpdate().equals("Resolved")) {
				ticket.setStatus("Resolved");
			} else if (ticket.getStatusUpdate().equals("L2-Pending")) {
				ticket.setStatus("L2-Pending");
			}
			Session session = sessionFactory.getCurrentSession();
			java.sql.Timestamp date = new java.sql.Timestamp(Calendar.getInstance().getTime().getTime());
			// String timeStamp = new
			// SimpleDateFormat("yyyyMMdd_HHmmss").format(Calendar.getInstance().getTime());

			System.out.println(date.toString());
			ticket.setResolvedTime(date.toString());
			session.update(ticket);

		} catch (Exception e) {
			e.printStackTrace();

		}
	}

	@Override
	public List<Tickets> getClosedTickets() {
		JSONArray jArray = new JSONArray();
		String jsonText = "";
		ObjectMapper mapper = new ObjectMapper();
		List<Tickets> tickets = null;
		try {
			// String sql="select * from crms.dbo.[CaftrackingCourierDetails] where
			// status='send'";
			// NamedParameterJdbcTemplate jdbctemplate = new
			// NamedParameterJdbcTemplate(jdbcTemplate.getDataSource());
			// List<Map<String, Object>> rows = jdbcTemplate.queryForList(sql);

			/*
			 * for (Map<String, Object> row : rows) { JsonObject obj= new JsonObject();
			 * 
			 * obj.addProperty("id",row.get("Id").toString() ); obj.addProperty("CourierNo",
			 * row.get("CourierNo").toString()); obj.addProperty("CourierName",
			 * row.get("CourierName").toString()); obj.addProperty("TrackingNo",
			 * row.get("TrackingNo").toString()); obj.addProperty("NoofCafDispatched",
			 * row.get("NoofCafDispatched").toString()); obj.addProperty("DateAndTime",
			 * row.get("DateAndTime").toString()); obj.addProperty("FromPerson",
			 * row.get("FromPerson").toString()); obj.addProperty("ToPerson",
			 * row.get("ToPerson").toString()); obj.addProperty("status",
			 * row.get("status").toString()); obj.addProperty("region",
			 * row.get("region").toString()); obj.addProperty("center",
			 * row.get("center").toString()); jArray.add((Object) obj);
			 * 
			 * } jsonText = JSONValue.toJSONString((Object) jArray);
			 */

			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("select t from Tickets t where t.status = :status");
			query.setParameter("status", "Resolved");
			tickets = query.list();
			// System.out.println("JSON String \n" + jsonText);
			return tickets;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error in gettting closed tickets" + e);
			return tickets;
		}

	}

	@Override
	public List<Tickets> getTicketsReport(Date fromDate, Date toDate, String status) {
		// List<Tickets> tickets = new ArrayList<>();
		Session session = null;
		try {
			session = sessionFactory.getCurrentSession();
		} catch (HibernateException e) {
			// session = sessionFactory.openSession();
		}
		try {

			String UserQuery = "FROM Tickets  b where convert(date,b.loginTime) >= :fromDate and convert(date,b.loginTime) <= :toDate AND b.status = :status";
			Query query = session.createQuery(UserQuery);
			query.setParameter("fromDate", fromDate);
			query.setParameter("toDate", toDate);
			query.setParameter("status", status);
			List<Tickets> tickets = query.list();
			// System.out.println("database:"+tickets);
			return tickets;
		}

		catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	@Override

	public List<Tickets> getL2PendingTickets(List<String> roles) {

		JSONArray jArray = new JSONArray();

		String jsonText = "";

		ObjectMapper mapper = new ObjectMapper();

		List<Tickets> tickets = null;

		try {

			// String sql="select * from crms.dbo.[CaftrackingCourierDetails] where

			// status='send'";

			// NamedParameterJdbcTemplate jdbctemplate = new

			// NamedParameterJdbcTemplate(jdbcTemplate.getDataSource());

			// List<Map<String, Object>> rows = jdbcTemplate.queryForList(sql);

			/*
			 * 
			 * for (Map<String, Object> row : rows) { JsonObject obj= new JsonObject();
			 * 
			 * 
			 * 
			 * obj.addProperty("id",row.get("Id").toString() ); obj.addProperty("CourierNo",
			 * 
			 * row.get("CourierNo").toString()); obj.addProperty("CourierName",
			 * 
			 * row.get("CourierName").toString()); obj.addProperty("TrackingNo",
			 * 
			 * row.get("TrackingNo").toString()); obj.addProperty("NoofCafDispatched",
			 * 
			 * row.get("NoofCafDispatched").toString()); obj.addProperty("DateAndTime",
			 * 
			 * row.get("DateAndTime").toString()); obj.addProperty("FromPerson",
			 * 
			 * row.get("FromPerson").toString()); obj.addProperty("ToPerson",
			 * 
			 * row.get("ToPerson").toString()); obj.addProperty("status",
			 * 
			 * row.get("status").toString()); obj.addProperty("region",
			 * 
			 * row.get("region").toString()); obj.addProperty("center",
			 * 
			 * row.get("center").toString()); jArray.add((Object) obj);
			 * 
			 * 
			 * 
			 * } jsonText = JSONValue.toJSONString((Object) jArray);
			 * 
			 */

			Session session = sessionFactory.getCurrentSession();

			Query query = session.createQuery("select t from Tickets t where t.status = :status");

			System.out.println(roles.get(0));

			if (roles.size() > 1) {

			}

			else if (roles.get(0).equals("intern")) {

				System.out.println(roles.get(0));

				System.out.println("Query- Intern");

				query.setParameter("status", "l2-pending");

			} else if (roles.get(0).equals("vendor")) {

				System.out.println(roles.get(0));

				System.out.println("Query- vendor");

				query.setParameter("status", "l2-pending");

			} else if (roles.get(0).equals("super_admin")) {

				System.out.println(roles.get(0));

				System.out.println("Query Super-Admin");

				query.setParameter("status", "l2-pending");

			}

			// query.setParameter("status", "pending");

			tickets = query.list();

			// System.out.println("JSON String \n" + jsonText);

			return tickets;

		} catch (Exception e) {

			// TODO: handle exception

			System.out.println("Error in gettting cafdetails" + e);

			return tickets;

		}

	}

	@Override
	public void forwardTcket(String ticketId, String user, String comments, int forwardedBy) {

		Session session = null;
		try {
			session = sessionFactory.getCurrentSession();
		} catch (HibernateException e) {
			// session = sessionFactory.openSession();
		}
		try {
			System.out.println(Long.parseLong(user) + "" + Integer.parseInt(ticketId) + "" + comments);

			System.out.println("Gettting user obj" + "" + Long.parseLong(user));
			Users userObj = (Users) session.get(Users.class, Long.parseLong(user));
			Tickets ticketObj = (Tickets) session.get(Tickets.class, Integer.parseInt(ticketId));
			System.out.println("Getting ticket" + " " + ticketObj.getId());
			System.out.println("getting user obj" + userObj.getId());

			// ticketObj.getForwarededUsers().add(userObj);
			// ticketObj.setUser(userObj);

			System.out.println("inserting into brimticket forwarding");
			// session.update(ticketObj);
			// .....inserting ticket forwarding table.....
			BrimTicketForwarding ticketForward = new BrimTicketForwarding();
			ticketForward.setTickets(ticketObj);
			ticketForward.setUsers(userObj);
			ticketForward.setForwardBy(forwardedBy);
			ticketForward.setComments(comments);
			session.save(ticketForward);
			// ...end ........
			// ......Updating tickket status.....
			ticketObj.setForwardComments(comments);
			ticketObj.setStatus("Forwarded");
			ticketObj.setForwardedUserId(Integer.valueOf(userObj.getId().intValue()));
			// .......end updating ticket status.......
			// ......Inserting Logs........
			BrimTicketTrackingLog brimLog = new BrimTicketTrackingLog();
			brimLog.setTicketId(Integer.parseInt(ticketId));
			brimLog.setUserId(Integer.parseInt(user));
			brimLog.setComments(comments);
			session.save(brimLog);
			// .....end inserting log.......
		}

		catch (Exception e) {
			e.printStackTrace();

		}

	}

	@Override
	public List<Tickets> checkForwardedTickets(String userID) {
		Session session = null;
		List<Tickets> forwardTicketList = new ArrayList<Tickets>();

		try {
			session = sessionFactory.getCurrentSession();
		} catch (HibernateException e) {
			// session = sessionFactory.openSession();
		}
		try {
			int userId = Integer.parseInt(userID);
			String getForwardTicketquery = "select t from Tickets t   \r\n"
					+ "       where t.forwardedUserId = :userid and t.status= :status";
			Query query = session.createQuery(getForwardTicketquery);
			query.setParameter("userid", userId);
			query.setParameter("status", "Forwarded");
			forwardTicketList = query.list();

			return forwardTicketList;
		}

		catch (Exception e) {
			System.out.println("checking forwardedtickets");
			e.printStackTrace();
			return null;

		}

	}

	@Override
	public List<Tickets> getReceiveTickets(int userId) {
		JSONArray jArray = new JSONArray();

		String jsonText = "";

		ObjectMapper mapper = new ObjectMapper();

		List<Tickets> tickets = null;

		try {
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("from Tickets t where t.forwardedUserId = :userId");
			query.setParameter("userId", userId);
			tickets = query.list();
			// System.out.println("JSON String \n" + jsonText);
			return tickets;

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error in gettting closed tickets" + e);
			return tickets;
		}

	}

	@Override
	public List<Tickets> getTicketsForwarded(int userId) {
		List<Tickets> ticketList = new ArrayList<Tickets>();
		try {
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery(
					"select t from Tickets t join t.forwarededUsers forwarded where forwarded.id = :userId");
			query.setParameter("userId", Long.valueOf(userId));
			ticketList = query.list();
			// System.out.println("JSON String \n" + jsonText);
			return ticketList;

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error in gettting closed tickets" + e);
			return ticketList;
		}

	}

}
