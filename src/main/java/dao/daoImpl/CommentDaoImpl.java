package dao.daoImpl;

import dao.CommentDao;
import domain.Comment;
import org.springframework.stereotype.Repository;

@Repository("commentDao")
public class CommentDaoImpl extends BaseDaoImpl<Comment> implements CommentDao {
}
