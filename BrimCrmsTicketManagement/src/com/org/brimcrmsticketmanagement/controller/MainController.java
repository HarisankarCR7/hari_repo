
package com.org.brimcrmsticketmanagement.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URLDecoder;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.org.brimcrmsticketmanagement.exception.UserCreationException;
import com.org.brimcrmsticketmanagement.model.CafDetails;
import com.org.brimcrmsticketmanagement.model.ComplaintsReg;
import com.org.brimcrmsticketmanagement.model.ResourceNotFoundException;
import com.org.brimcrmsticketmanagement.model.Tickets;
import com.org.brimcrmsticketmanagement.model.Users;
import com.org.brimcrmsticketmanagement.service.MainServiceImpl;

@Controller
public class MainController {
	@Autowired
	MainServiceImpl mainServiceImpl;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {
		//System.out.println("inside login page");
		return "login";
	}

	@RequestMapping(value = "/loginPage", method = RequestMethod.GET)
	public String loginPage(@RequestParam(value = "logout", required = false) String logout) {
		//System.out.println("login form");
		// ModelAndView model = new ModelAndView();
		/*
		 * if (error != null) { System.out.println("error is there");
		 * model.addObject("error", "Invalid Credentials provided."); }
		 * 
		 * if (logout != null) { model.addObject("message",
		 * "Logged out from JournalDEV successfully."); }
		 */
		// model.setViewName("login");
		return "login";
	}

	@RequestMapping(value = "/rcms", method = RequestMethod.GET)
	public String rcms() {
		//System.out.println("inside login page");
		return "rcmsdashboard";
	}

	@RequestMapping(value = "/error", method = RequestMethod.GET)
	public String executive() {

		return "executivedashboard";
	}

	@RequestMapping(value = "/cutomercare", method = RequestMethod.GET)
	public String customercare() {

		return "customercaredashboard";
	}

	@RequestMapping(value = "/homePage", method = RequestMethod.GET)
	public String homePage(HttpServletRequest request,HttpSession session) {
	//	System.out.println("session" + request.getSession());
session.setAttribute("dashboard", "no");
		return "home1";
	}

	@RequestMapping(value = "/cafDetailsPage", method = RequestMethod.GET)
	public String getCafDetailsPage() {

		return "cafverify";
	}

	/*
	 * @RequestMapping(value = "/ticketdetails", method = RequestMethod.GET) public
	 * ModelAndView getTicketDetailsPage(@RequestParam(value = "ticktDtls") String
	 * ticketNumber, Model model) { String ticketNoDecoded = ""; List<Tickets> list
	 * = new ArrayList<Tickets>(); ModelAndView map = new ModelAndView("cafverify");
	 * model.addAttribute("ticket", new Tickets()); try { ticketNoDecoded =
	 * URLDecoder.decode(ticketNumber, "UTF-8"); list =
	 * mainServiceImpl.getTicketDetails(ticketNoDecoded);
	 * map.setViewName("cafverify"); map.addObject("ticketDetails", list); return
	 * map; } catch (UnsupportedEncodingException e) {
	 * System.out.println("Decoding exception" + e); return map; } catch (Exception
	 * e) { e.printStackTrace(); return map; }
	 * 
	 * }
	 */

	@RequestMapping(value = "/download/{fileName:.+}", method = RequestMethod.GET)
	public ResponseEntity<?> downloadFile(@PathVariable String fileName) {
		Path fileStorageLocation = Paths.get("E:/BrimUploads/").toAbsolutePath().normalize();
		//System.out.println("into file downloading");

		try {
			//System.out.println(fileName.substring(fileName.lastIndexOf("/") + 1));
			Path filePath = fileStorageLocation.resolve(fileName).normalize();
			Resource resource = new UrlResource(filePath.toUri());
			System.out.println("BrimCrmsTicketmanagement Resource path : " + " " + resource.getURI().toString());
			if (resource.exists()) {
				//System.out.println("Fle is there");
				return ResponseEntity.ok().header(HttpHeaders.CONTENT_DISPOSITION,
						"attachment; filename=\"" + resource.getFilename() + "\"").body(resource);
			} else {
				// return ResponseEntity.notFound().build();
				throw new ResourceNotFoundException();
			}
		} catch (MalformedURLException ex) {
			ex.printStackTrace();
			return ResponseEntity.badRequest().build();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return ResponseEntity.badRequest().build();
		}
	}

	@RequestMapping(value = "process", method = RequestMethod.POST)
	public String processTicket(@ModelAttribute("ticket") Tickets ticket, BindingResult bindingResult) {

		try {
			//System.out.println("Processing tickets \n" + ticket.getCenter() + "\n" + ticket.getStatusUpdate());
			mainServiceImpl.UpdateStatus(ticket);
			return "Success";
		} catch (Exception ex) {
			ex.printStackTrace();
			// System.out.println();
			return null;
		}

	}

	@RequestMapping(value = "/getPendingTickets", method = RequestMethod.GET)
	public @ResponseBody List<Tickets> getPendingTickets(Authentication authentication) {
		String role = "";
		List<String> listOfRoles = new ArrayList<String>();
		Collection<? extends GrantedAuthority> rolesList = authentication.getAuthorities();
		for (GrantedAuthority list : rolesList) {
			// System.out.println(list.getAuthority());
			listOfRoles.add(list.getAuthority());

		}

		//System.out.println("into get pendiong tickets");
		return mainServiceImpl.getPendingTickets(listOfRoles);

	}

	@RequestMapping(value = "dashboard", method = RequestMethod.GET)
	public ModelAndView dashboard(HttpSession session) {
		session.setAttribute("dashboard", "yes");
		ModelAndView model = new ModelAndView();
		model.setViewName("home1");
		return model;
	}
	
	@RequestMapping(value = "/getClosedTickets", method = RequestMethod.GET)
	public @ResponseBody List<ComplaintsReg> getClosedTickets(Authentication authentication) {
		String role = "";
		List<String> listOfRoles = new ArrayList<String>();
		
		return mainServiceImpl.getClosedTickets();

	}
	@RequestMapping(value = "/report", method = {RequestMethod.GET, RequestMethod.POST})
	public String submitForm(HttpServletRequest request, Model model) {
	    Optional<String> fromDateParam = Optional.ofNullable(request.getParameter("fromDate"));
	    Optional<String> toDateParam = Optional.ofNullable(request.getParameter("toDate"));
	    Optional<String> status = Optional.ofNullable(request.getParameter("status"));
	   // System.out.println(fromDateParam.get() + toDateParam.get() + status.get());
try {
	    if (fromDateParam != null && toDateParam != null && status != null) {
	 
	    	
	      // String  statusVar = status.get();
	        List<ComplaintsReg> tickets = mainServiceImpl.getTicketsReport(fromDateParam.get(), toDateParam.get(), status.get());
	        
	       	        model.addAttribute("tickets", tickets);
	    }
	    return "reportFormtable";
}
catch (Exception e) {
	e.printStackTrace();
}
	    return "reportFormtable";
	}
	
	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public String showForm(HttpSession session) {
		try {
			session.invalidate();
		}
		catch (Exception e) {
			// TODO: handle exception
		}
        return "reportFormtable";
    }
	@RequestMapping(value = "/getPendingBrimTickets", method = RequestMethod.GET)
	public @ResponseBody List<ComplaintsReg> getComplaints(HttpSession session) {
		List<ComplaintsReg> complaintsList = new ArrayList<ComplaintsReg>();
		try {
			complaintsList= mainServiceImpl.getComplaints();
			return complaintsList;
			
		}
		catch (Exception e) {
			e.printStackTrace();
			return complaintsList;
		}
        
    }
	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	public ResponseEntity<?> addUsers(@RequestBody Users user) {
	boolean insertStatus=false;
		try {
			
			insertStatus = mainServiceImpl.addUser(user);
			if(insertStatus) {
			return ResponseEntity.ok("user created successfully");
			}
			else {
				throw new UserCreationException("User Creation Exception");
	
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			throw new UserCreationException("User Creation Exception");
			
		}
        
    }
	@RequestMapping(value = "/complaintdetails", method = RequestMethod.GET)
	public ModelAndView getComplaintDetailsPage(@RequestParam(value = "complId") String ticketNumber,Model model, HttpSession session) throws UnsupportedEncodingException {
		String closedBy = (String)session.getAttribute("name");
		//System.out.println("ticket closed by" + closedBy);
		Calendar cal=Calendar.getInstance();
		java.sql.Timestamp timestamp = new java.sql.Timestamp(cal.getTimeInMillis());
		String ticketNoDecoded = "";
		List<ComplaintsReg> list = new ArrayList<ComplaintsReg>();
		ModelAndView map = new ModelAndView("cafverify");
		ComplaintsReg complaint = new ComplaintsReg();
		complaint.setClosedBy(closedBy);
		complaint.setUpdatedOn(timestamp.toString());
		//System.out.println("ticket closed by" + complaint.getClosedBy());
		model.addAttribute("complaint", complaint);
		try {
			ticketNoDecoded = URLDecoder.decode(ticketNumber, "UTF-8");
			int complaintId = Integer.parseInt(ticketNoDecoded);
			list = mainServiceImpl.getTicketDetails(complaintId);
			
			if(list.get(0).getStatus().equals("Pending")) {
				model.addAttribute("activity", "pending");
				model.addAttribute("updatedOn", timestamp.toString());
			}
			else if(list.get(0).getStatus().equals("Closed")) {
				model.addAttribute("activity", "closed");
				model.addAttribute("updatedOn", timestamp.toString());
			}
			else if(list.get(0).getStatus().equals("Escalated")) {
				model.addAttribute("activity", "escalated");
				model.addAttribute("updatedOn", timestamp.toString());
			}
			String description = list.get(0).getDescription().replaceAll("[\r\n]+", " ");
			list.get(0).setDescription(description);
			list.get(0).setClosedBy(closedBy);
			//System.out.println("descriotion" + list.get(0).getDescription() + "\n end");
			map.setViewName("cafverify");
			map.addObject("complaintDetails", list);
			return map;
		} catch (UnsupportedEncodingException e) {
			System.out.println("Decoding exception" + e);
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			return map;
		}

	}

	@RequestMapping(value = "closeTicket", method = RequestMethod.POST)
	public String closeTicket(@ModelAttribute("complaint") ComplaintsReg complaint,HttpSession session, RedirectAttributes redirectAttrs) {

		try {
			
			//System.out.println("Processing tickets \n" + ticket.getCenter() + "\n" + ticket.getStatusUpdate());
			String userName = (String)session.getAttribute("name");
			if(userName == null || userName.equals("")) {
				redirectAttrs.addFlashAttribute("complId", complaint.getId());
				redirectAttrs.addFlashAttribute("closeStatus", "<p class='text-danger'>Something went wrong,Please try again...!</p>");
				return "redirect:/complaintdetails?complId="+ complaint.getId();
			}
			String closeStatus=null;
			closeStatus =  mainServiceImpl.closeTicket(complaint,userName);
			if(closeStatus.equals("success")) {
				redirectAttrs.addFlashAttribute("closeStatus", "<p class='text-success'>Ticket has been closed successfully</p>");
				
				redirectAttrs.addFlashAttribute("complId", complaint.getId());
			}
			else if(closeStatus.equals("processed")) {
				redirectAttrs.addFlashAttribute("complId", complaint.getId());
				redirectAttrs.addFlashAttribute("closeStatus", "<p class='text-danger'>Ticket has already been closed..</p>");
	
			}
			else if(closeStatus.equals("failed")) {
				redirectAttrs.addFlashAttribute("complId", complaint.getId());
				redirectAttrs.addFlashAttribute("closeStatus", "<p class='text-danger'>Something went wrong..</p>");
			}
			
			
			return "redirect:/complaintdetails?complId="+ complaint.getId();
		} catch (Exception ex) {
			ex.printStackTrace();
			// System.out.println();
			redirectAttrs.addFlashAttribute("complId", complaint.getId());
			redirectAttrs.addFlashAttribute("closeStatus", "<p class='text-danger'>Something went wrong..</p>");
			return "redirect:/complaintdetails?complId="+ complaint.getId();
		}

	}
	@RequestMapping(value = "viewFile", method = RequestMethod.GET)
	public void downloadImage(@RequestParam String id,HttpServletResponse response) {
        byte[] imageData = mainServiceImpl.viewImage(id);
		/*
		 * return ResponseEntity.status(HttpStatus.OK)
		 * .contentType(MediaType.IMAGE_JPEG) .body(imageData);
		 */
        if (imageData != null) {
            response.setContentType("image/jpg");
            try {
                response.getOutputStream().write(imageData);
                response.getOutputStream().flush();
                response.getOutputStream().close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
	


}
