package action;

import domain.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import service.CommentService;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.util.Date;

@Controller("commentAjaxAction")
public class CommentAjaxAction extends SuperAction {
    @Autowired
    private CommentService commentService;
    private String message;
    private String result;
    @Resource(name = "comment")
    private Comment comment;

    public Comment getComment() {
        return comment;
    }

    public void setComment(Comment comment) {
        this.comment = comment;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
    public String addComment(){
        System.out.println("message:"+message);
        int uid = Integer.parseInt(session.getAttribute("id").toString());
        int cid = Integer.parseInt(session.getAttribute("cid").toString());
        System.out.println("id:"+uid);
        comment.setMessage(message);
        comment.setUid(uid);
        comment.setCid(cid);
        comment.setCreateBy(uid+"");
        comment.setCreateDate(new Timestamp(new Date().getTime()));
       if (commentService.save(comment))
            result = "true";
       else
           result = "false";
        return SUCCESS;
    }
}
