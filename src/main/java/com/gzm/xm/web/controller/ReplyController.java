package com.gzm.xm.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gzm.xm.common.entity.Reply;
import com.gzm.xm.common.enums.PageEnum;
import com.gzm.xm.common.util.JsonUtils;
import com.gzm.xm.service.ReplyService;

@Controller
@RequestMapping(value="reply")
public class ReplyController extends AbstractContoller{
	
	@Autowired
	protected ReplyService replyService;
	
	Logger logger = LoggerFactory.getLogger(ReplyController.class);
	
	@RequestMapping( method = RequestMethod.GET)
	public String list( ModelMap map){
		Long count = replyService.count();
		map.put( "count", count );
		map.put("size", pageSize);
		return "reply/list";
	}
	
	
	@RequestMapping(value="page", method = RequestMethod.GET)
	public @ResponseBody String listPage( @RequestParam Integer p){
		if(p == null){
			p = 0;
		}
		Page<Reply> replys = replyService.getAll(p, pageSize);
		return JsonUtils.toJson(replys);
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String add(Reply reply){
		reply.setFlag(0);
		replyService.save(reply);
		return "redirect:reply";
	}
	
	
	
	
	/************管理员处理************************/
		@RequestMapping(value="admin", method = RequestMethod.GET)
		public String adminList(ModelMap map){
			Long count = replyService.count();
			map.put( "count", count );
			map.put("size", pageSize);
			return "admin/reply/list";
		}
	
		/**
		 * 添加或修改
		 * @param reply
		 * @return
		 */
		@RequestMapping(value="admin" , method = RequestMethod.POST)
		public @ResponseBody void adminAdd(Reply reply){
			System.out.print(reply.getId());
			if(reply.getId() == null || reply.getId() == 0){
				reply.setFlag(1);
				replyService.save(reply);
			}else{
				replyService.update(reply.getId(), reply.getTitle());
			}
		}
	
		@RequestMapping(value="admin/{id}", method = RequestMethod.DELETE)
		public @ResponseBody  boolean delete(@PathVariable Integer id){
			return replyService.delete(id);
		}
		
		@ModelAttribute("pageType")
	    public Integer getPageType() {
	        return PageEnum.REPLY.getId();
	    }
		

}
