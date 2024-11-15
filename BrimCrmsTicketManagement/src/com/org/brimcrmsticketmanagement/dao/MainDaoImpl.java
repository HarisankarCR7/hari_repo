package com.org.brimcrmsticketmanagement.dao;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.zip.DataFormatException;
import java.util.zip.Inflater;

import javax.sql.DataSource;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.json.simple.JSONArray;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.org.brimcrmsticketmanagement.model.CafDetails;
import com.org.brimcrmsticketmanagement.model.ComplaintsReg;
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
	@Autowired
	BCryptPasswordEncoder encoder;

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

				query.setParameter("status", "L1-Pending");
			} else if (roles.get(0).equals("vendor")) {

				query.setParameter("status", "L1-Pending");
			} else if (roles.get(0).equals("super_admin")) {

				query.setParameter("status", "L1-Pending");
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
	public List<ComplaintsReg> getTicketDetails(int complaintId) {
		List<ComplaintsReg> complaintDetails = new ArrayList<ComplaintsReg>();
		try {
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("select t from ComplaintsReg t where t.id = :id");
			query.setParameter("id", complaintId);
			complaintDetails = query.list();
			return complaintDetails;
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
			java.sql.Date date = new java.sql.Date(Calendar.getInstance().getTime().getTime());
			ticket.setResolvedTime(date);
			session.update(ticket);

		} catch (Exception e) {
			e.printStackTrace();

		}
	}

	@Override
	public List<ComplaintsReg> getClosedTickets() {
		JSONArray jArray = new JSONArray();
		String jsonText = "";
		ObjectMapper mapper = new ObjectMapper();
		List<ComplaintsReg> tickets = null;
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
			Query query = session.createQuery("select t from ComplaintsReg t where t.status = :status");
			query.setParameter("status", "Closed");
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
	public List<ComplaintsReg> getTicketsReport(String fromDate, String toDate, String status) {
		// List<Tickets> tickets = new ArrayList<>();
		Session session = null;
		String UserQuery = "";
		try {
			session = sessionFactory.getCurrentSession();
		} catch (HibernateException e) {
			// session = sessionFactory.openSession();
		}
		try {
			UserQuery = "select b FROM ComplaintsReg b where";
			if (!fromDate.equals("") && !toDate.equals("") && !status.equals("")) {
				UserQuery = "select b FROM ComplaintsReg b where CONVERT(date,b.loginTIme) >= :fromDate and CONVERT(date,b.loginTIme) <= :toDate AND b.status = :status";
			} else {
				UserQuery = "select b FROM ComplaintsReg b where 1=1";
				if (!fromDate.equals("")) {
					UserQuery += " and CONVERT(date,b.loginTIme) >= :fromDate";
				}
				if (!toDate.equals("")) {
					UserQuery += " and CONVERT(date,b.loginTIme) <= :toDate";
				}
				if (!status.equals("")) {
					UserQuery += " AND b.status = :status";
				}
			}
			System.out.println("testing" + UserQuery);
			Query query = session.createQuery(UserQuery);
			if (!fromDate.equals("")) {
				query.setParameter("fromDate", Date.valueOf(fromDate));
			}
			if (!toDate.equals("")) {
				query.setParameter("toDate", Date.valueOf(toDate));
			}
			if (!status.equals("")) {
				query.setParameter("status", status);
			}

			List<ComplaintsReg> tickets = query.list();
			// System.out.println("database:"+tickets);
			System.out.println(tickets.size());
			return tickets;
		}

		catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	@Override
	public List<ComplaintsReg> getComplaints() {
		Session session = null;
		try {
			session = sessionFactory.getCurrentSession();
		} catch (HibernateException e) {
			// session = sessionFactory.openSession();
		}
		try {

			String getComplaintsQuery = "FROM ComplaintsReg  c where c.status=:status or c.status=:status1";
			Query query = session.createQuery(getComplaintsQuery);
			query.setParameter("status", "Pending");
			query.setParameter("status1", "Escalated");
			List<ComplaintsReg> complaintstList = query.list();
			// System.out.println("database:"+tickets);
			return complaintstList;
		}

		catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	@Override
	public boolean addUsers(Users user) {
		Session session = null;
		boolean insertStatus = false;
		try {
			session = sessionFactory.getCurrentSession();
		} catch (HibernateException e) {
			// session = sessionFactory.openSession();
			e.printStackTrace();
		}
		try {
			user.setPassword(encoder.encode(user.getPassword()));
			user.setEnabled("yes");
			session.save(user);
			// System.out.println(id);
			insertStatus = true;
			return insertStatus;

		}

		catch (Exception e) {
			e.printStackTrace();
			return insertStatus;

		}
	}

	@Override
	public String closeTicket(ComplaintsReg complaint, String userName) {
		Session session = null;
		boolean insertStatus = false;
		try {
			session = sessionFactory.getCurrentSession();
		} catch (HibernateException e) {
			// session = sessionFactory.openSession();
			e.printStackTrace();
		}
		try {
			ComplaintsReg complaintObj = (ComplaintsReg) session.get(ComplaintsReg.class, complaint.getId());
			//System.out.println("status prior to close" + complaintObj.getStatus()+"\n status to close" + complaint.getStatus());
			if(complaintObj.getStatus().equals("Closed")) {
				return "processed";
			}
			else {
			
			complaintObj.setClosedBy(userName);

			complaintObj.setClosedRemarks(complaint.getClosedRemarks());
			Calendar cal = Calendar.getInstance();
			java.sql.Timestamp timestamp = new java.sql.Timestamp(cal.getTimeInMillis());
			complaintObj.setClosedOn(complaint.getClosedOn());
			complaintObj.setTicketNo("BR" + complaint.getId());
			complaintObj.setStatus(complaint.getStatus());
			complaintObj.setUpdatedOn(complaint.getUpdatedOn());
			//System.out.println("closing" + complaint.getClosedBy());
			complaintObj.setClosedBy(complaint.getClosedBy());
			return "success";
			}
		}

		catch (Exception e) {
			e.printStackTrace();
			return "failed";

		}

	}

	public byte[] viewImage(String id) {
		Session session = null;
		boolean insertStatus = false;
		try {
			session = sessionFactory.getCurrentSession();
		} catch (HibernateException e) {
			// session = sessionFactory.openSession();
			e.printStackTrace();
		}
		try {
String sql = "select c.image from ComplaintsReg c where c.id=:id";
Query query = session.createQuery(sql);
query.setParameter("id", Integer.parseInt(id));
byte[] imageData =  (byte[]) query.uniqueResult();
System.out.println("image" + imageData.length);
System.out.println(Arrays.toString(imageData));
//return decompressImage(imageData);
return imageData;

		}

		catch (Exception e) {
			e.printStackTrace();
			return null;

		}

	}
	
	 public static byte[] decompressImage(byte[] data) throws DataFormatException, IOException {
		  final int BITE_SIZE = 4 * 1024;  
		 Inflater inflater = new Inflater();
	        inflater.setInput(data);
	        ByteArrayOutputStream outputStream = new ByteArrayOutputStream(data.length);
	        int biteSize=4*1024;
	        byte[] tmp = new byte[data.length];

	        while (!inflater.finished()) {
	            int count = inflater.inflate(tmp);
	            outputStream.write(tmp, 0, count);
	        }

	        outputStream.close();

	        return outputStream.toByteArray();
	    }

}
