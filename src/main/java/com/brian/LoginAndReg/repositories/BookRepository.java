package com.brian.LoginAndReg.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.brian.LoginAndReg.models.Book;

public interface BookRepository extends CrudRepository<Book, Long> {
	List<Book> findAll();
}
