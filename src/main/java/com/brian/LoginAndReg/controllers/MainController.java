package com.brian.LoginAndReg.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.brian.LoginAndReg.models.LoginUser;
import com.brian.LoginAndReg.models.User;
import com.brian.LoginAndReg.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;



@Controller
public class MainController {
	@Autowired
	private UserService userServ;
	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "logAndReg.jsp";
	}
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser,
			BindingResult result, Model model, HttpSession session) {
		User legitUser = userServ.register(newUser, result);
		 if (result.hasErrors()) {
			 model.addAttribute("newLogin", new LoginUser());
			 return "/logAndReg.jsp";
		 }
		 session.setAttribute("id", legitUser.getId());
		 session.setAttribute("name", legitUser.getUserName());
		 return "redirect:/books";
	}
	
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin,
			BindingResult result, Model model, HttpSession session) {
		User user = userServ.login(newLogin, result);
		if (result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "logAndReg.jsp";
		}
		else {
			 session.setAttribute("id", user.getId());
			 session.setAttribute("name", user.getUserName());
			 return "redirect:/books";
		}
	}
	@GetMapping("/clear")
	public String clear(HttpSession session) {
		session.setAttribute("id", null);
		session.setAttribute("name", null);
		return "redirect:/";
	}
}
