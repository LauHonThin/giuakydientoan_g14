package bootsample.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import bootsample.dao.ArticleRepository;
import bootsample.model.Article;


@Service
@Transactional
public class ArticleService {

	private final ArticleRepository  articleRepository;
	
	public ArticleService(ArticleRepository articleRepository)
	{
		this.articleRepository = articleRepository;
	}
	
	public void save(Article article){
		articleRepository.save(article);
	}
	public List<Article> findAll()
	{
		List<Article> articles = new ArrayList<>();
		for(Article article: articleRepository.findAll())
			articles.add(article);
		return articles;
	}
	
	public Article findArticle(int id){
		return articleRepository.findOne(id);
	}
	
	public void delete(int id){
		articleRepository.delete(id);
	}
	
	
}
