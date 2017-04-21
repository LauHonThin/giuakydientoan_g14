package bootsample.dao;

import org.springframework.data.repository.CrudRepository;

import bootsample.model.Article;

public interface ArticleRepository extends CrudRepository<Article,Integer>{

}
