
package com.org.brimcrmsticketmanagement.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URLDecoder;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.org.brimcrmsticketmanagement.model.CafDetails;
import com.org.brimcrmsticketmanagement.model.ResourceNotFoundException;
import com.org.brimcrmsticketmanagement.model.Tickets;
import com.org.brimcrmsticketmanagement.service.BrimTicketServiceImpl;
import com.org.brimcrmsticketmanagement.service.MainServiceImpl;

@Controller
public class MainController {
	@Autowired
	MainServiceImpl mainServiceImpl;
	@Autowired
	BrimTicketServiceImpl brimTicketService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {
		// System.out.println("inside login page");
		return "login";
	}

	@RequestMapping(value = "/loginPage", method = RequestMethod.GET)
	public String loginPage(@RequestParam(value = "logout", required = false) String logout) {

		System.out.println("Into login page");
		// System.out.println("login form");
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
		// System.out.println("inside login page");
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
	public String homePage(HttpServletRequest request, HttpSession session, Model model) {
		try {
			System.out.println("Into homepage controller");
			List<Tickets> forwardedTicketList = new ArrayList<Tickets>();
			// System.out.println("session" + request.getSession());

			String userID = session.getAttribute("userId").toString();
			forwardedTicketList = mainServiceImpl.checkForwardedTickets(userID);
			session.setAttribute("dashboard", "no");

			System.out.println("forward tickets size" + forwardedTicketList.size());
			model.addAttribute("forwardList", forwardedTicketList);

			return "home1";
		} catch (Exception e) {
			e.printStackTrace();
			return "home1";
		}
	}

	@RequestMapping(value = "/cafDetailsPage", method = RequestMethod.GET)
	public String getCafDetailsPage() {

		return "cafverify";
	}

	@RequestMapping(value = "/ticketdetails", method = RequestMethod.GET)
	public String getTicketDetailsPage(@RequestParam(value = "ticktDtls") String ticketNumber,HttpSession session, Model model) {
		String ticketNoDecoded = "";
		List<Tickets> list = new ArrayList<Tickets>();
		// ModelAndView map = new ModelAndView("cafverify");

		try {
			Long currentUser =  (Long) session.getAttribute("userId");
			ticketNoDecoded = URLDecoder.decode(ticketNumber, "UTF-8");
			list = mainServiceImpl.getTicketDetails(ticketNoDecoded,currentUser);
			Tickets ticket = list.get(0);
			model.addAttribute("ticket", ticket);
			// map.setViewName("cafverify");
			// map.addObject("ticketDetails", list);
			// model.addAttribute("ticketDetails", list);
			return "cafverify";
		} catch (UnsupportedEncodingException e) {
			System.out.println("Decoding exception" + e);
			return "cafverify";
		} catch (Exception e) {
			e.printStackTrace();
			return "cafverify";
		}

	}

	@RequestMapping(value = "/download/{fileName:.+}", method = RequestMethod.GET)
	public ResponseEntity<?> downloadFile(@PathVariable String fileName) {
		Path fileStorageLocation = Paths.get("E:/BrimUploads/").toAbsolutePath().normalize();
		// System.out.println("into file downloading");

		try {
			// System.out.println(fileName.substring(fileName.lastIndexOf("/") + 1));
			Path filePath = fileStorageLocation.resolve(fileName).normalize();
			Resource resource = new UrlResource(filePath.toUri());
			System.out.println("BrimCrmsTicketmanagement Resource path : " + " " + resource.getURI().toString());
			if (resource.exists()) {
				// System.out.println("Fle is there");
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
	public String processTicket(@ModelAttribute("ticket") @Valid Tickets ticket, BindingResult bindingResult,
			Authentication authentication, Model model) {
		ModelAndView map = new ModelAndView();
		try {
			List<Tickets> list = new ArrayList<Tickets>();

			if (bindingResult.hasErrors()) {

				for (Object object : bindingResult.getAllErrors()) {
					if (object instanceof FieldError) {
						FieldError fieldError = (FieldError) object;
						System.out.println(fieldError.getField());
						System.out.println("field error \n" + fieldError.getCode());
					}

					if (object instanceof ObjectError) {
						ObjectError objectError = (ObjectError) object;
						System.out.println(objectError.getObjectName());
						System.out.println("Object error \n" + objectError.getCode());
					}
				}

				// list.add(ticket);
				// map.setViewName("cafverify");
				// model.addAttribute("ticketDetails", list);
				return "cafverify";

			} else {
				if (authentication != null)
					ticket.setResolvedBy(authentication.getName());

				mainServiceImpl.UpdateStatus(ticket);
				map.setViewName("Success");
				return "Success";
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			// System.out.println();
			return null;
		}

	}

	@RequestMapping(value = "/getPendingTickets", method = RequestMethod.GET)
	public @ResponseBody List<Tickets> getPendingTickets(Authentication authentication) {
		String role = "";
		List<Tickets> ticketList = new ArrayList<Tickets>();
		try {
			List<String> listOfRoles = new ArrayList<String>();
			Collection<? extends GrantedAuthority> rolesList = authentication.getAuthorities();
			for (GrantedAuthority list : rolesList) {
				listOfRoles.add(list.getAuthority());

			}
			ticketList = mainServiceImpl.getPendingTickets(listOfRoles);

			// System.out.println("into get pendiong tickets");
			return ticketList;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}

	}

	@RequestMapping(value = "dashboard", method = RequestMethod.GET)
	public ModelAndView dashboard(HttpSession session) {
		session.setAttribute("dashboard", "yes");
		ModelAndView model = new ModelAndView();
		model.setViewName("home1");
		return model;
	}

	@RequestMapping(value = "/getClosedTickets", method = RequestMethod.GET)
	public @ResponseBody List<Tickets> getClosedTickets(Authentication authentication) {
		String role = "";
		List<Tickets> closedTickets = new ArrayList<Tickets>();
		List<String> listOfRoles = new ArrayList<String>();
		Collection<? extends GrantedAuthority> rolesList = authentication.getAuthorities();
		for (GrantedAuthority list : rolesList) {
			// System.out.println(list.getAuthority());
			listOfRoles.add(list.getAuthority());

		}
		closedTickets = mainServiceImpl.getClosedTickets();
		return closedTickets;

	}

	/*
	 * @RequestMapping(value = "/report", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public String submitForm(HttpServletRequest request,
	 * Model model) { String fromDateParam = request.getParameter("fromDate");
	 * String toDateParam = request.getParameter("toDate"); String status =
	 * request.getParameter("status");
	 * 
	 * if (fromDateParam != null && toDateParam != null && status != null) { Date
	 * fromDate = Date.valueOf(fromDateParam); Date toDate =
	 * Date.valueOf(toDateParam); List<Tickets> tickets =
	 * mainServiceImpl.getTicketsReport(fromDate, toDate, status);
	 * model.addAttribute("tickets", tickets); } return "reportFormtable"; }
	 * 
	 * @RequestMapping(value = "/form", method = RequestMethod.GET) public String
	 * showForm(HttpSession session) { try { session.invalidate(); } catch
	 * (Exception e) { // TODO: handle exception } return "reportFormtable"; }
	 */

	// Neeha Code
	@RequestMapping(value = "/getL2PendingTickets", method = RequestMethod.GET)
	public @ResponseBody List<Tickets> getL2PendingTickets(Authentication authentication) {
		String role = "";
		List<Tickets> l2PendingTickets = new ArrayList<Tickets>();
		List<String> listOfRoles = new ArrayList<String>();
		Collection<? extends GrantedAuthority> rolesList = authentication.getAuthorities();
		for (GrantedAuthority list : rolesList) {
			// System.out.println(list.getAuthority());
			listOfRoles.add(list.getAuthority());

		}

		l2PendingTickets = mainServiceImpl.getL2PendingTickets(listOfRoles);
		return l2PendingTickets;

	}

	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public String showForm(Model model) {
		List<String> centers = brimTicketService.getDistinctCenters();
		model.addAttribute("centers", centers);
		return "reportFormtable";
	}

	@RequestMapping(value = "/report", method = { RequestMethod.GET, RequestMethod.POST })
	public String submitForm(HttpServletRequest request, Model model, HttpSession session) {
		List<String> centers = brimTicketService.getDistinctCenters();
		model.addAttribute("centers", centers);

		String fromDateParam = request.getParameter("fromDate");
		String toDateParam = request.getParameter("toDate");
		String status = request.getParameter("status");
		String center = request.getParameter("center");

		Date fromDate = Date.valueOf(fromDateParam);
		Date toDate = Date.valueOf(toDateParam);
		List<Tickets> tickets = brimTicketService.getTickets(fromDate, toDate, status, center);
		model.addAttribute("tickets", tickets);
		session.setAttribute("tickets", tickets);

		return "reportFormtable";
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String getReport(@RequestParam(value = "searchQuery", required = false) String searchQuery, Model model,
			HttpSession session) {
		List<Tickets> tickets = (List<Tickets>) session.getAttribute("tickets");
		List<String> centers = brimTicketService.getDistinctCenters();
		model.addAttribute("centers", centers);

		if (tickets != null && searchQuery != null && !searchQuery.isEmpty()) {
			tickets = tickets.stream().filter(ticket -> ticket.matches(searchQuery)).collect(Collectors.toList());
		}
		model.addAttribute("tickets", tickets);
		return "reportFormtable";
	}

	@RequestMapping(value = "/activityPage", method = RequestMethod.GET)
	public String ActivityPage(HttpServletRequest request, HttpSession session) {
		// System.out.println("session" + request.getSession());
		Object sec = session.getAttribute("userId");
		System.out.println(sec);
		return "activity";
	}

	@RequestMapping(value = "/getReceiveTickets", method = RequestMethod.GET)
	public @ResponseBody List<Tickets> receiveTickets(Authentication authentication, HttpSession session) {
		String username = (String) session.getAttribute("username");
		Long userId = (Long) session.getAttribute("userId");
		// System.out.println("userid"+userId);
		// List<Tickets> tickets = (List<Tickets>) session.getAttribute("userId");
		// System.out.println("into get pendiong tickets");
		// List<Tickets> tickets = mainServiceImpl.getReceiveTickets(userId);
		int userID = Integer.valueOf(userId.intValue());
		return mainServiceImpl.getReceiveTickets(userID);

	}

	// Neeha code end

	@RequestMapping(value = "/forwardTicket", method = RequestMethod.POST)
	public String forwardTicket(@RequestParam(value = "ticketId", required = true) String ticketId,
			@RequestParam(value = "userselected", required = true) String user,
			@RequestParam(value = "comments", required = true) String comments, Model model, HttpSession session) {

		System.out.println(ticketId + " " + user + " " + comments);
		int forwardedBy = Integer.parseInt((session.getAttribute("userId").toString()));
		
		mainServiceImpl.forwardTcket(ticketId, user, comments, forwardedBy);
		return "reportFormtable";
	}

	@RequestMapping(value = "/getTicketsForwarded", method = RequestMethod.POST)
	public String getTicketsForwarded(@RequestParam(value = "user", required = true) String userId) {

		int userID = Integer.parseInt(userId);
		mainServiceImpl.getTicketsForwarded(userID);
		return "reportFormtable";
	}
}
