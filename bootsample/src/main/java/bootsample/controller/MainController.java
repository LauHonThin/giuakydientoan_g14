package bootsample.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import bootsample.model.Article;
import bootsample.service.ArticleService;

@Controller
public class MainController {

	@Autowired
	private ArticleService articleService;
	

	@GetMapping("/")
	public String home(HttpServletRequest request){
		request.setAttribute("mode", "MODE_HOME");
		return "index";
	}
	
	@GetMapping("/all-articles")
	public String allArticles(HttpServletRequest request){
		request.setAttribute("articles", articleService.findAll());
		request.setAttribute("mode", "MODE_ARTICLES");
		return "index";
	}
	@GetMapping("/new-article")
	public String newArticle(HttpServletRequest request){
		request.setAttribute("mode", "MODE_NEW");
		return "index";
	}
	@PostMapping("/save-article")
	public String saveArticle(@ModelAttribute Article article, BindingResult bindingResult, HttpServletRequest request){
		articleService.save(article);
		request.setAttribute("articles", articleService.findAll());
		request.setAttribute("mode", "MODE_ARTICLES");
		return "index";
	}
	
	@GetMapping("/update-article")
	public String updateArticle(@RequestParam int id, HttpServletRequest request){
		request.setAttribute("article", articleService.findArticle(id));
		request.setAttribute("mode", "MODE_UPDATE");
		return "index";
	}
	@GetMapping("/delete-article")
	public String deleteArticle(@RequestParam int id, HttpServletRequest request){
		articleService.delete(id);
		request.setAttribute("articles", articleService.findAll());
		request.setAttribute("mode", "MODE_ARTICLES");
		return "index";
	}
}
