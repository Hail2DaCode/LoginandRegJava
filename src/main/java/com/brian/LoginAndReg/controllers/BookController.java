package com.brian.LoginAndReg.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.brian.LoginAndReg.models.Book;
import com.brian.LoginAndReg.models.User;
import com.brian.LoginAndReg.services.BookService;
import com.brian.LoginAndReg.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;


@Controller
public class BookController {
	@Autowired
	private BookService bookServ;
	@Autowired 
	private UserService userServ;
	
	@GetMapping("/books")
	public String dash(Model model, HttpSession session) {
		if (session.getAttribute("id") == null) {
			return "redirect:/";
		}
		List<Book> books = bookServ.allBooks();
		model.addAttribute("books", books);
		return "welcome.jsp";
	}
	@GetMapping("/books/new")
	public String addBook(@ModelAttribute("book") Book book, HttpSession session) {
		System.out.println(session.getAttribute("id"));
		return "newBook.jsp";
	}
	@PostMapping("/new/Book")
	public String newBook(@Valid @ModelAttribute("book") Book book, BindingResult result) {
		if(result.hasErrors()) {
			return "newBook.jsp";
		}
		else {
			bookServ.createBook(book);
			return "redirect:/books";
		}
	}
	@GetMapping("/books/{id}")
	public String showBook(@PathVariable("id") Long id, Model model) {
		Book book = bookServ.findBook(id);
		model.addAttribute("book", book);
		return "showBook.jsp";
	}
	@GetMapping("/books/{id}/edit")
	public String editButton(@PathVariable("id") Long id, Model model,  HttpSession session) {
		Book book = bookServ.findBook(id);
		System.out.println(session.getAttribute("id"));
		model.addAttribute("book", book);
		if (book.getBorrower() != null) {
			User borrower = book.getBorrower();
			model.addAttribute("borrower", borrower);
		}
		return "editBook.jsp";
	}
	@GetMapping("books/{id}/delete")
	public String deleteButton(@PathVariable("id") Long id) {
		bookServ.deleteBook(id);
		return "redirect:/books";
	}
	@PutMapping("/books/{id}")
	public String updateBook(@Valid @ModelAttribute("book") Book updateBook, BindingResult result, Model model, HttpSession session) {
		System.out.println(session.getAttribute("id"));
		if (result.hasErrors()) {
			model.addAttribute("book", updateBook);
			return "editBook.jsp";
		}
		else {
			User user = userServ.findUser((Long) session.getAttribute("id"));
			updateBook.setUser(user);
			bookServ.createBook(updateBook);
			return "redirect:/books";
		}
		
	}
	@GetMapping("/bookmarket")
	public String bookMarket(Model model, HttpSession session) {
		List<Book> unborrowed = bookServ.getUnborrowedBooks();
		System.out.println(session.getAttribute("id"));
		User user = userServ.findUser((Long) session.getAttribute("id"));
		model.addAttribute("user", user);
		model.addAttribute("unborrowed", unborrowed);
		return "borrowed.jsp";
	}
	@GetMapping("/bookmarket/{id}")
	public String borrow(@PathVariable("id") Long id, HttpSession session) {
		Book book = bookServ.findBook(id);
		System.out.println(session.getAttribute("id"));
		User borrower = userServ.findUser((Long) session.getAttribute("id"));
		book.setBorrower(borrower);
		bookServ.createBook(book);
		return "redirect:/bookmarket";
	}
	
	@GetMapping("/return/{id}")
	public String returnBook(@PathVariable("id") Long id) {
		Book book = bookServ.findBook(id);
		book.setBorrower(null);
		bookServ.createBook(book);
		return "redirect:/bookmarket";
	}
}
