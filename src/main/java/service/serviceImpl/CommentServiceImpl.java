package service.serviceImpl;

import domain.Comment;
import org.springframework.stereotype.Service;
import service.CommentService;
@Service("commentService")
public class CommentServiceImpl extends BaseServiceImpl<Comment> implements CommentService {
}
