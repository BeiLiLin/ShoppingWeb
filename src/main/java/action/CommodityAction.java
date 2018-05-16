package action;

import domain.Comment;
import domain.Commodity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import service.CommentService;
import service.CommodityService;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller("commodityAction")
public class CommodityAction extends SuperAction {
    @Autowired
    private CommodityService commodityService;
    @Autowired
    private CommentService commentService;
    @Resource(name = "commodity")
    private Commodity commodity;
    private List<Comment> commentList;

    public List<Comment> getCommentList() {
        return commentList;
    }

    public void setCommentList(List<Comment> commentList) {
        this.commentList = commentList;
    }

    public Commodity getCommodity() {
        return commodity;
    }

    public void setCommodity(Commodity commodity) {
        this.commodity = commodity;
    }

    public String showCommoidity(){
        System.out.println("id:"+commodity.getId());
        commodity = commodityService.get(Commodity.class,commodity.getId());
        Map<String,Object> map= new HashMap<>();
        map.put("o.cid",commodity.getId());
        commentList = commentService.find(Comment.class,map);
        session.setAttribute("cid",commodity.getId());
        return "success";
    }
}
